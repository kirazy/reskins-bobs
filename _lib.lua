-- HACK: To avoid pulling in the Artisanal Reskins: Library sprite overrides and until Artisanal
-- Reskins: Framework and Artisanal Reskins: Assets API are both ready for use.
--
-- IMPORTANT: This module is a bridge between the old and new frameworks, and and every effort
-- should be made to eliminate usage of it. No new code should be added to this module.

---@using Reskins.SpriteUtils

---@namespace Reskins.Bobs

local _sprite_utils = {
	icons = require("__reskins-sprite-utils__.icons"),
	colors = require("__reskins-sprite-utils__.colors"),
	defines = require("__reskins-sprite-utils__.defines"),
	sprites = require("__reskins-sprite-utils__.sprites"),
}

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
}

---@type Reskins.SpriteUtils.DeferredIconStore
local _deferred_icon_store = {}

---Provides methods for reskinning entities, icons, and technologies.
---@class LibHack
local lib = {}

local asset_mod_names = {
	["assets-angels"] = { directory = "__reskins-assets-angels__" },
	["assets-base"] = { directory = "__reskins-assets-base__" },
	["assets-bobs"] = { directory = "__reskins-assets-bobs__" },
}

---------------------------------------------------------------------------------------------------
-- functions.lua
---------------------------------------------------------------------------------------------------

---Defines the inputs of `setup_standard_entity`.
---@class LibHack.SetupStandardEntityInputs : LibHack.ParseInputsInputs, LibHack.CreateExplosionsAndParticlesInputs, LibHack.CreateRemnantInputs, LibHack.ConstructIconInputsOld

---Reskins the entity prototype with the given `name`. The defaults of `inputs` are filled in, and the explosions,
---particles, remnants, and icons that `inputs` enables are created.
---@param name string The name of the entity prototype to be reskinned.
---@param tier integer The tier of the entity. An integer between 0 and 6. Default `0`.
---@param inputs LibHack.SetupStandardEntityInputs The inputs that select what is created.
---@deprecated
function lib.setup_standard_entity(name, tier, inputs)
	-- Parse inputs.
	lib.set_inputs_defaults(inputs)

	-- Create particles and explosions.
	if inputs.make_explosions then
		lib.create_explosions_and_particles(name, inputs)
	end

	-- Create remnants.
	if inputs.make_remnants then
		lib.create_remnant(name, inputs)
	end

	-- Create icons.
	if inputs.make_icons then
		lib.construct_icon(name, tier, inputs)
	end
end

---Defines the inputs that select what `setup_standard_entity` creates.
---@class LibHack.ParseInputsInputs
---The size of the icon. Default `64`.
---@field icon_size? data.SpriteSizeType
---The size of the technology icon. Default `128`.
---@field technology_icon_size? data.SpriteSizeType
---When `true`, indicates that explosions are created. Default `true`.
---@field make_explosions? boolean
---When `true`, indicates that corpses are created. Default `true`.
---@field make_remnants? boolean
---When `true`, indicates that icons are created. Default `true`.
---@field make_icons? boolean
---When `true`, indicates that tier labels are added to icons. Default `true`.
---@field tier_labels? boolean
---When `true`, indicates that pictures for item-on-ground icons are created. Default `true`.
---@field make_icon_pictures? boolean

---Adds missing default values to the given `inputs` table.
---@param inputs LibHack.ParseInputsInputs The inputs that receive the default values.
---@return LibHack.ParseInputsInputs # `inputs`, with missing default values added.
---@deprecated
function lib.set_inputs_defaults(inputs)
	inputs.icon_size = inputs.icon_size or 64
	inputs.technology_icon_size = inputs.technology_icon_size or 128
	inputs.make_explosions = (inputs.make_explosions ~= false)
	inputs.make_remnants = (inputs.make_remnants ~= false)
	inputs.make_icons = (inputs.make_icons ~= false)
	inputs.tier_labels = (inputs.tier_labels ~= false)
	inputs.make_icon_pictures = (inputs.make_icon_pictures ~= false)

	return inputs
end

---Defines the inputs of `create_remnant`.
---@class LibHack.CreateRemnantInputs
---The name of the source entity prototype from which the corpse is copied, such as `"stone-furnace"`.
---@field base_entity_name string
---The type name of the entity to which the new `CorpsePrototype` is assigned.
---@field type string

---Copies the corpse of the entity named by `inputs.base_entity_name`, extends `data` with the copy under the name
---`ar-[name]-remnants`, and assigns it to the entity with the given `name`.
---@param name string The name of the entity prototype.
---@param inputs LibHack.CreateRemnantInputs The entity from which the corpse is copied and the type of the entity to which it is assigned.
---@return data.CorpsePrototype # The new corpse prototype.
---@deprecated
function lib.create_remnant(name, inputs)
	---@type data.CorpsePrototype
	local remnant = util.copy(data.raw["corpse"][inputs.base_entity_name .. "-remnants"])
	remnant.name = "ar-" .. name .. "-remnants"
	data:extend({ remnant })

	-- Assign corpse to originating entity.
	data.raw[inputs.type][name]["corpse"] = remnant.name

	return remnant
end

---Defines the inputs of `create_explosion`.
---@class LibHack.CreateExplosionInputs : LibHack.CreateRemnantInputs

---Copies the explosion of the entity named by `inputs.base_entity_name`, extends `data` with the copy under the name
---`ar-[name]-explosion`, and assigns it to the entity with the given `name`.
---@param name string The name of the entity prototype.
---@param inputs LibHack.CreateExplosionInputs The entity from which the explosion is copied and the type of the entity to which it is assigned.
---@deprecated
function lib.create_explosion(name, inputs)
	local explosion_copy = util.copy(data.raw["explosion"][inputs.base_entity_name .. "-explosion"])
	explosion_copy.name = "ar-" .. name .. "-explosion"
	data:extend({ explosion_copy })

	-- Assign explosion to originating entity.
	data.raw[inputs.type][name]["dying_explosion"] = explosion_copy.name
end

---Gets the value at the end of the given key path under `root`.
---@param root table The table from which the path starts.
---@param ... string|integer The keys of the path.
---@return any # The value at the end of the path if it exists; otherwise, `nil`.
local function try_get_value(root, ...)
	for i = 1, select("#", ...) do
		if type(root) ~= "table" then
			return nil
		end
		local key = select(i, ...)
		root = root[key]
		if root == nil then
			return nil
		end
	end

	return root
end

---Gets the base explosion the given `explosion` redirects to, if it exists; otherwise, `explosion`.
---@param explosion data.ExplosionPrototype The explosion to check for a base explosion.
---@return data.ExplosionPrototype # The base explosion, or `explosion`.
local function get_preferred_explosion(explosion)
	-- Several entities redirect to a base explosion entity. The base explosion is used when it exists.

	---@type data.TriggerEffect[]|nil
	local target_effects = try_get_value(explosion, "created_effect", "action_delivery", "target_effects")

	if not target_effects or #target_effects == 0 then
		return explosion
	end

	if target_effects[1] and target_effects[1].type == "create-explosion" then
		-- Copy the explosion reference and update the explosion, if the copy does not already exist. The same
		-- explosion may be visited more than once.
		local explosion_base_name = target_effects[1].entity_name

		local base_explosion = data.raw["explosion"][explosion_base_name]
		if base_explosion.name:find("ar-", 1, true) then
			return base_explosion
		end

		base_explosion = util.copy(data.raw["explosion"][explosion_base_name])
		base_explosion.name = "ar-" .. explosion.name .. "-base"
		data:extend({ base_explosion })

		-- Update the explosion reference name.
		target_effects[1].entity_name = base_explosion.name
		return base_explosion
	end

	return explosion
end

---A map of base particle names to the particle names that are excluded from matching them.
local particle_exclusions_map = {
	["metal-particle-medium"] = {
		"long-metal-particle-medium",
	},
}

---Checks if the given `particle_name` matches `base_particle_name` and is not excluded from matching it.
---@param particle_name data.ParticleID The particle name to check.
---@param base_particle_name string The base particle name against which `particle_name` is checked.
---@return boolean # `true` if the particle name matches; otherwise, `false`.
local function is_particle_name_intended_match(particle_name, base_particle_name)
	if particle_name:find(base_particle_name, 1, true) then
		local exclusions = particle_exclusions_map[base_particle_name]
		if exclusions then
			for _, exclusion in pairs(exclusions) do
				if particle_name:find(exclusion, 1, true) then
					return false
				end
			end
		end

		return true
	end

	return false
end

---Gets the particle effect from `particle_effects` with name matching the given `base_particle_name`. When `key` is
---provided, a matching effect at that index is selected; otherwise, the first matching effect is selected.
---@param particle_effects data.CreateParticleTriggerEffectItem[] The particle effects to search.
---@param base_particle_name string The base particle name that the selected effect matches.
---@param key integer The index of the effect to prefer.
---@return data.CreateParticleTriggerEffectItem|nil # The matching particle effect, or `nil` if none matches.
local function get_preferred_particle(particle_effects, base_particle_name, key)
	local preferred_particle
	local fallback_particle
	for index, effect in pairs(particle_effects) do
		if is_particle_name_intended_match(effect.particle_name, base_particle_name) then
			if index == key then
				preferred_particle = effect
				break
			elseif not fallback_particle then
				fallback_particle = effect
			end
		end
	end

	return preferred_particle or fallback_particle
end

---Links the given `explosion` to the given `particle` through the particle effect from the target effects of the
---explosion with name matching `base_particle_name`. When `key` is provided, a matching effect at that index is
---selected; otherwise, the first matching effect is selected.
---@param explosion data.ExplosionPrototype The explosion to which the particle is linked.
---@param particle data.ParticlePrototype The particle to link to the explosion.
---@param base_particle_name string The base particle name that the selected effect matches.
---@param key integer The index of the effect to prefer.
local function link_particle_to_explosion(explosion, particle, base_particle_name, key)
	local target_effects = try_get_value(explosion, "created_effect", "action_delivery", "target_effects")
	if not target_effects or #target_effects == 0 then
		return
	end

	-- Filter target_effects for all particle effects.
	local particle_effects = {}
	for _, effect in pairs(target_effects) do
		if effect.type == "create-particle" then
			table.insert(particle_effects, effect)
		end
	end

	if #particle_effects > 0 then
		local particle_effect = get_preferred_particle(particle_effects, base_particle_name, key)

		if particle_effect then
			particle_effect.particle_name = particle.name
		end
	end
end

---Copies the particle of the entity named by `base_entity_name`, applies `tint`, extends `data` with the copy under the
---name `ar-[name]-[base-particle-name]-tinted`, and links it to the explosion of the entity with the given `name`.
---@param name data.EntityID The name of an entity prototype that has an Artisanal Reskins explosion.
---@param base_entity_name data.EntityID The name of the source entity prototype from which the particles are copied, such as `"stone-furnace"`.
---@param base_particle_name string A key of `lib.particle_index` that selects the particle to copy.
---@param key integer The index of the particle effect within the target effects of the explosion.
---@param tint? data.Color The tint to apply to the particle.
---@deprecated
function lib.create_particle(name, base_entity_name, base_particle_name, key, tint)
	local particle = util.copy(data.raw["optimized-particle"][base_entity_name .. "-" .. base_particle_name])

	particle.name = "ar-" .. name .. "-" .. base_particle_name .. "-tinted"
	if particle.pictures and particle.pictures.sheet then
		particle.pictures.sheet.tint = tint
	end

	data:extend({ particle })

	local explosion = data.raw["explosion"]["ar-" .. name .. "-explosion"]
	if not explosion then
		return
	else
		local preferred_explosion = get_preferred_explosion(explosion)
		link_particle_to_explosion(preferred_explosion, particle, base_particle_name, key)
	end
end

---Defines the inputs of `create_explosions_and_particles`.
---@class LibHack.CreateExplosionsAndParticlesInputs : LibHack.CreateExplosionInputs
---A map of `lib.particle_index` keys to the index of the particle effect to copy within the target effects of the
---explosion.
---@field particles? table
---The tint applied to the particles.
---@field tint? table

---Creates the explosion and the tinted particles of the entity with the given `name`, through `create_explosion` and
---`create_particle`.
---@param name string The name of the entity prototype.
---@param inputs LibHack.CreateExplosionsAndParticlesInputs The entity to copy from, the type of the entity to assign to, the tint, and the particles.
---@deprecated
function lib.create_explosions_and_particles(name, inputs)
	lib.create_explosion(name, inputs)

	if inputs.particles then
		for particle, key in pairs(inputs.particles) do
			-- Create and assign the particle.
			lib.create_particle(name, inputs.base_entity_name, lib.particle_index[particle], key, inputs.tint)
		end
	end
end

lib.particle_index = {
	["tiny-stone"] = "stone-particle-tiny",
	["small"] = "metal-particle-small",
	["small-stone"] = "stone-particle-small",
	["medium"] = "metal-particle-medium",
	["medium-long"] = "long-metal-particle-medium",
	["medium-stone"] = "stone-particle-medium",
	["big"] = "metal-particle-big",
	["big-stone"] = "stone-particle-big",
	["big-tint"] = "metal-particle-big-tint",
}

---------------------------------------------------------------------------------------------------
-- icon-handling.lua
---------------------------------------------------------------------------------------------------

---Defines the inputs of `construct_technology_icon`.
---@class LibHack.ConstructTechnologyIconInputsOld
---The assets mod that holds the icon files.
---@field mod "assets-angels"|"assets-base"|"assets-bobs"|"assets-assorted"
---The folder under the `graphics/technology` folder. Default `nil`.
---@field group? string
---The folder under the `group` folder, such as `group/subgroup`. Default `nil`.
---@field subgroup? string
---When `true`, indicates that `tint` is not applied to the mask layer.
---@field untinted_icon_mask? boolean
---The tint of the mask layer. Default white, `{1, 1, 1, 1}`.
---@field tint? data.Color
---The file name of a single-layer icon, required when `icon_name` is `nil`.
---@field technology_icon_filename? data.FileName
---The size of the icon. Default `128`.
---@field technology_icon_size? data.SpriteSizeType
---The folder and file name prefix of the layered icon, required when `technology_icon_filename` is `nil`.
---@field icon_name? string
---The file name prefix of the base layer within the folder named by `icon_name`. Default `icon_name`.
---@field icon_base? string
---The file name prefix of the mask layer within the folder named by `icon_name`. Default `icon_name`.
---@field icon_mask? string
---The file name prefix of the highlights layer within the folder named by `icon_name`. Default `icon_name`.
---@field icon_highlights? string
---An array of `IconData` objects appended to the icon.
---@field technology_icon_extras? data.IconData[]
---The number of standard-form layers. Default `3` with `icon_name`. Default `1` with `technology_icon_filename`.
---@field technology_icon_layers? 1|2|3
---When `true`, indicates that the icon is stored for assignment at the end of the data-updates stage.
---@field defer_to_data_updates? boolean
---When `true`, indicates that the icon is stored for assignment at the end of the data-final-fixes stage, which
---supersedes `defer_to_data_updates`.
---@field defer_to_data_final_fixes? boolean

---Constructs an icon from the given `inputs` and assigns it to the technology with the given `name`.
---@param name string The name of the technology prototype.
---@param inputs LibHack.ConstructTechnologyIconInputsOld The icon inputs.
---@deprecated
function lib.construct_technology_icon(name, inputs)
	---@type LibHack.ConstructTechnologyIconInputsOld
	local inputs_copy = util.copy(inputs)

	-- Set defaults.
	inputs_copy.technology_icon_size = inputs_copy.technology_icon_size or 128

	-- Handle compatibility defaults.
	local subfolder_path = ""
	if inputs_copy.group then
		subfolder_path = inputs_copy.group .. "/"
	end
	if inputs_copy.subgroup then
		subfolder_path = subfolder_path .. inputs_copy.subgroup .. "/"
	end

	-- Handle mask tinting defaults.
	local icon_tint = inputs_copy.tint
	if inputs_copy.untinted_icon_mask then
		icon_tint = nil
	end

	-- Handle icon_layers defaults.
	local icon_layers
	if inputs_copy.technology_icon_filename then
		icon_layers = inputs_copy.technology_icon_layers or 1
	else
		icon_layers = inputs_copy.technology_icon_layers or 3
	end

	-- Some entities have variable bases and masks.
	local icon_base = inputs_copy.icon_base or inputs_copy.icon_name
	local icon_mask = inputs_copy.icon_mask or inputs_copy.icon_name
	local icon_highlights = inputs_copy.icon_highlights or inputs_copy.icon_name

	-- Setup icon layers.
	---@type data.IconData
	local icon_base_layer = {
		icon = inputs_copy.technology_icon_filename
			or asset_mod_names[inputs_copy.mod].directory
				.. "/graphics/technology/"
				.. subfolder_path
				.. inputs_copy.icon_name
				.. "/"
				.. icon_base
				.. "-base.png",
		icon_size = inputs_copy.technology_icon_size,
	}

	---@type data.IconData, data.IconData
	local icon_mask_layer, icon_highlights_layer
	if icon_layers > 1 then
		icon_mask_layer = {
			icon = asset_mod_names[inputs_copy.mod].directory
				.. "/graphics/technology/"
				.. subfolder_path
				.. inputs_copy.icon_name
				.. "/"
				.. icon_mask
				.. "-mask.png",
			icon_size = inputs_copy.technology_icon_size,
			tint = icon_tint,
		}

		icon_highlights_layer = {
			icon = asset_mod_names[inputs_copy.mod].directory
				.. "/graphics/technology/"
				.. subfolder_path
				.. inputs_copy.icon_name
				.. "/"
				.. icon_highlights
				.. "-highlights.png",
			icon_size = inputs_copy.technology_icon_size,
			tint = { 1, 1, 1, 0 },
		}
	end

	---@type data.IconData[]
	local icon_data = { icon_base_layer }

	if icon_layers > 1 then
		table.insert(icon_data, icon_mask_layer)
	end

	if icon_layers > 2 then
		table.insert(icon_data, icon_highlights_layer)
	end

	-- Append icon extras as needed.
	if inputs_copy.technology_icon_extras then
		-- Append icon_extras.
		for n = 1, #inputs_copy.technology_icon_extras do
			table.insert(icon_data, inputs_copy.technology_icon_extras[n])
		end
	end

	---@type DeferrableIconData
	local deferrable_icon = {
		name = name,
		type_name = "technology",
		icon_data = icon_data,
	}

	-- The icon may be assigned again in the data-final-fixes stage.
	local stage
	if inputs_copy.defer_to_data_final_fixes then
		stage = _sprite_utils.defines.stage.data_final_fixes
	elseif inputs_copy.defer_to_data_updates then
		stage = _sprite_utils.defines.stage.data_updates
	end

	if stage then
		_sprite_utils.icons.store_icon_for_deferred_assignment_in_stage(_deferred_icon_store, stage, deferrable_icon)
	else
		_sprite_utils.icons.apply_icon_assignment(deferrable_icon)
	end
end

---@alias LibHack.TechnologyConstant
---| "battery"
---| "braking-force"
---| "capacity"
---| "count"
---| "damage"
---| "follower-count"
---| "ghost"
---| "health"
---| "logistic-slot"
---| "map-zoom"
---| "mining"
---| "mining-productivity"
---| "movement-speed"
---| "range"
---| "speed"

local technology_constants = {
	["battery"] = { icon = "__core__/graphics/icons/technology/constants/constant-battery.png" },
	["braking-force"] = { icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png" },
	["capacity"] = { icon = "__core__/graphics/icons/technology/constants/constant-capacity.png" },
	["count"] = { icon = "__core__/graphics/icons/technology/constants/constant-count.png" },
	["damage"] = { icon = "__core__/graphics/icons/technology/constants/constant-damage.png" },
	["follower-count"] = { icon = "__core__/graphics/icons/technology/constants/constant-follower-count.png" },
	["ghost"] = { icon = "__core__/graphics/icons/technology/constants/constant-time-to-live-ghosts.png" },
	["health"] = { icon = "__core__/graphics/icons/technology/constants/constant-health.png" },
	["logistic-slot"] = { icon = "__core__/graphics/icons/technology/constants/constant-logistic-slot.png" },
	["map-zoom"] = { icon = "__core__/graphics/icons/technology/constants/constant-map-zoom.png" },
	["mining"] = { icon = "__core__/graphics/icons/technology/constants/constant-mining.png" },
	["mining-productivity"] = { icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png" },
	["movement-speed"] = { icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png" },
	["range"] = { icon = "__core__/graphics/icons/technology/constants/constant-range.png" },
	["speed"] = { icon = "__core__/graphics/icons/technology/constants/constant-speed.png" },
}

---Gets the technology effect icon for the given `constant`.
---@param constant LibHack.TechnologyConstant The technology constant the icon represents.
---@param scale? double The scale of the icon.
---@return data.IconData # The effect icon.
---@deprecated
function lib.return_technology_effect_icon(constant, scale)
	---@type data.IconData
	local icon_data = {
		icon = technology_constants[constant].icon,
		icon_size = 128,
		shift = { 50, 50 },
		scale = 0.5,
		floating = true,
	}

	return icon_data
end

---Defines the fields common to every creatable icon.
---@class LibHack.CreatableIconBase
---The path to the folder containing the icon files, relative to the mod's `graphics` folder.
---@field subfolder string
---The size of the square icon, in pixels, e.g. `32` for a 32px by 32px icon.
---
---Mandatory if `icon_size` is not specified outside of `icons`.
---
---[IconData::icon_size](https://lua-api.factorio.com/latest/types/IconData.html#icon_size)
---@field icon_size data.SpriteSizeType
---
---Default `32/icon_size` for items and recipes, and `256/icon_size` for technologies.
---
---Specifies the scale of the icon on the GUI scale. A scale of `2` means that the icon will be two times bigger on
---screen (and thus more pixelated).
---
---[IconData::scale](https://lua-api.factorio.com/latest/types/IconData.html#scale)
---@field scale? double
---
---The shift of the icon layer from the center of the icon. Negative shifts are left and up. Shift values are based on
---the final size (`icon_size * scale`) of the first icon.
---
---[IconData::shift](https://lua-api.factorio.com/latest/types/IconData.html#shift)
---@field shift? data.Vector
---
---The tint to apply to the icon.
---
---[IconData::tint](https://lua-api.factorio.com/latest/types/IconData.html#tint)
---@field tint? data.Color

---Defines a creatable icon in the standard form of a base layer, a mask layer, and a highlights layer.
---@class LibHack.TintedCreatableIcon : LibHack.CreatableIconBase
---
---The prefix of the base icon file, `{icon_base}-base.png`. It is also the prefix of the mask and highlights files when
---`icon_mask` and `icon_highlights` are `nil`.
---@field icon_base string
---
---The prefix of the mask icon file, `{icon_mask}-mask.png`. Default `icon_base`.
---@field icon_mask? string
---
---The prefix of the highlights icon file, `{icon_highlights}-highlights.png`. Default `icon_base`.
---@field icon_highlights? string
---
---The tint to apply to the mask layer.
---@field tint data.Color
---
---The number of layers in the icon. Default `3`.
---@field num_layers? 1|2|3

---Defines a creatable icon with a single layer.
---@class LibHack.FlatCreatableIcon : LibHack.CreatableIconBase
---The name of the icon file, `{icon}.png`.
---@field icon string
---
---The tint of the icon. Default `nil`.
---@field tint? data.Color

---Defines the inputs of `construct_icon`.
---@class LibHack.ConstructIconInputsOld
---The type name of the prototype.
---@field type string
---The assets mod that holds the icon files.
---@field graphics_mod "assets-angels"|"assets-base"|"assets-bobs"|"assets-assorted"
---The folder under the `graphics/icons` folder. Default `nil`.
---@field group? string
---The folder under the `group` folder, such as `group/subgroup`. Default `nil`.
---@field subgroup? string
---When `true`, indicates that `tint` is not applied to the mask layer.
---@field untinted_icon_mask? boolean
---The tint of the mask layer. Default white, `{1, 1, 1, 1}`.
---@field tint? data.Color
---The file name of a single-layer icon, required when `icon_name` is `nil`.
---@field icon_filename? data.FileName
---The size of the icon. Default `64`.
---@field icon_size? data.SpriteSizeType
---The folder and file name prefix of the layered icon, required when `icon_filename` is `nil`.
---@field icon_name? string
---The file name prefix of the base layer within the folder named by `icon_name`. Default `icon_name`.
---@field icon_base? string
---The file name prefix of the mask layer within the folder named by `icon_name`. Default `icon_name`.
---@field icon_mask? string
---The file name prefix of the highlights layer within the folder named by `icon_name`. Default `icon_name`.
---@field icon_highlights? string
---An array of `IconData` objects appended to the icon.
---@field icon_extras? data.IconData[]
---The number of standard-form layers. Default `3` with `icon_name`. Default `1` with `icon_filename`.
---@field icon_layers? 1|2|3
---When `true`, indicates that the icon is stored for assignment at the end of the data-updates stage.
---@field defer_to_data_updates? boolean
---When `true`, indicates that the icon is stored for assignment at the end of the data-final-fixes stage, which
---supersedes `defer_to_data_updates`.
---@field defer_to_data_final_fixes? boolean

---Constructs an icon from the given `inputs`, adds tier labels for the given `tier`, and assigns it to the prototype
---with the given `name`.
---@param name string The name of the prototype.
---@param tier integer The tier of the added labels. An integer between 0 and 6.
---@param inputs LibHack.ConstructIconInputsOld The icon inputs.
---@deprecated
function lib.construct_icon(name, tier, inputs)
	---@type LibHack.ConstructIconInputsOld
	local inputs_copy = util.copy(inputs)

	-- Set defaults.
	inputs_copy.icon_size = inputs.icon_size or 64

	-- Handle compatibility defaults.
	local subfolder_path = ""
	if inputs_copy.group then
		subfolder_path = inputs_copy.group .. "/"
	end
	if inputs_copy.subgroup then
		subfolder_path = subfolder_path .. inputs_copy.subgroup .. "/"
	end

	-- Handle mask tinting defaults.
	---@type data.Color|nil
	local icon_tint = inputs_copy.tint
	if inputs_copy.untinted_icon_mask then
		icon_tint = nil
	elseif not inputs_copy.tint then
		inputs_copy.untinted_icon_mask = true
	end

	-- Handle icon_layers defaults.
	---@type integer
	local icon_layers
	if inputs_copy.icon_filename then
		icon_layers = inputs_copy.icon_layers or 1
	else
		icon_layers = inputs_copy.icon_layers or 3
	end

	-- Some entities have variable bases and masks.
	local icon_base = inputs_copy.icon_base or inputs_copy.icon_name
	local icon_mask = inputs_copy.icon_mask or inputs_copy.icon_name
	local icon_highlights = inputs_copy.icon_highlights or inputs_copy.icon_name

	-- Setup icon layers.
	---@type data.IconData
	local icon_base_layer = {
		icon = inputs_copy.icon_filename
			or asset_mod_names[inputs_copy.graphics_mod].directory
				.. "/graphics/icons/"
				.. subfolder_path
				.. inputs_copy.icon_name
				.. "/"
				.. icon_base
				.. "-base.png",
		icon_size = inputs_copy.icon_size,
	}

	---@type data.IconData, data.IconData
	local icon_mask_layer, icon_highlights_layer
	if icon_layers > 1 then
		icon_mask_layer = {
			icon = asset_mod_names[inputs_copy.graphics_mod].directory
				.. "/graphics/icons/"
				.. subfolder_path
				.. inputs_copy.icon_name
				.. "/"
				.. icon_mask
				.. "-mask.png",
			icon_size = inputs_copy.icon_size,
			tint = icon_tint,
		}

		icon_highlights_layer = {
			icon = asset_mod_names[inputs_copy.graphics_mod].directory
				.. "/graphics/icons/"
				.. subfolder_path
				.. inputs_copy.icon_name
				.. "/"
				.. icon_highlights
				.. "-highlights.png",
			icon_size = inputs_copy.icon_size,
			tint = { 1, 1, 1, 0 },
		}
	end

	---@type data.IconData[]
	local icon_data = { icon_base_layer }

	if icon_layers > 1 then
		table.insert(icon_data, icon_mask_layer)
	end

	if icon_layers > 2 then
		table.insert(icon_data, icon_highlights_layer)
	end

	-- Append icon extras as needed.
	if inputs_copy.icon_extras then
		-- Append icon_extras.
		for n = 1, #inputs_copy.icon_extras do
			table.insert(icon_data, inputs_copy.icon_extras[n])
		end
	end

	local deferrable_icon = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = name,
		type_name = inputs_copy.type or "item",
		icon_data = icon_data,
	})

	-- The icon may be assigned again in the data-final-fixes stage.
	local stage
	if inputs_copy.defer_to_data_final_fixes then
		stage = _sprite_utils.defines.stage.data_final_fixes
	elseif inputs_copy.defer_to_data_updates then
		stage = _sprite_utils.defines.stage.data_updates
	end

	if stage then
		_sprite_utils.icons.store_icon_for_deferred_assignment_in_stage(_deferred_icon_store, stage, deferrable_icon)
	else
		_sprite_utils.icons.apply_icon_assignment(deferrable_icon)
	end
end

---Converts the given directional `animation` to a non-directional animation, for use as a robot death animation.
---@param animation data.RotatedAnimation
---@param shift data.Vector
---@return data.Animation
local function convert_rotated_animation_to_animation(animation, shift)
	---@type data.RotatedAnimation
	local animation_copy = util.copy(animation)
	local layers = animation_copy.layers or { animation_copy }

	for _, layer in pairs(layers) do
		-- Use the direction count as the frame count.
		layer.frame_count = layer.direction_count

		-- Remove the direction count from the returned animation.
		layer.direction_count = nil
		layer.animation_speed = 1
		layer.shift = util.add_shift(layer.shift or { 0, 0 }, shift)
	end

	return animation_copy --[[@as data.Animation]]
end

---Sets the `run_mode` field of a given animation to `"backward"` everywhere it is required.
---@param animation data.Animation
---@return data.Animation
local function get_reversed_animation(animation)
	---@type data.Animation
	local animation_copy = util.copy(animation)

	-- Wrap a single-layer animation in an array of layers.
	local layers = animation_copy.layers or { animation_copy }

	for _, layer in pairs(layers) do
		layer.run_mode = "backward"
	end

	return animation_copy
end

---Creates the particles and animations of the death spiral of the given flying robot `prototype`, and links them to it.
---@param prototype data.CombatRobotPrototype|data.RobotWithLogisticInterfacePrototype The robot prototype.
---@param corpse_name data.EntityID The name of the corpse of the robot.
---@deprecated
function lib.configure_robot_death_animation(prototype, corpse_name)
	local shadow_shift = { -0.75, -0.40 }
	local animation_shift = { 0, 0 }

	local particle_name = "ar-" .. prototype.name .. "-dying-particle"

	local animation = convert_rotated_animation_to_animation(prototype.in_motion or {}, animation_shift)
	local shadow_animation = convert_rotated_animation_to_animation(prototype.shadow_in_motion or {}, shadow_shift)

	---@type data.ParticlePrototype
	local particle = {
		type = "optimized-particle",
		name = particle_name,
		pictures = { animation, get_reversed_animation(animation) },
		shadows = { shadow_animation, get_reversed_animation(shadow_animation) },
		movement_modifier = 0.95,
		life_time = 1000,
		regular_trigger_effect_frequency = 2,
		regular_trigger_effect = {
			{
				type = "create-trivial-smoke",
				smoke_name = "smoke-fast",
				starting_frame_deviation = 5,
				probability = 0.5,
			},
			{
				type = "create-particle",
				particle_name = "spark-particle",
				tail_length = 10,
				tail_length_deviation = 5,
				tail_width = 5,
				probability = 0.2,
				initial_height = 0.2,
				initial_vertical_speed = 0.15,
				initial_vertical_speed_deviation = 0.05,
				speed_from_center = 0.1,
				speed_from_center_deviation = 0.05,
				offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
			},
		},
		ended_on_ground_trigger_effect = {
			type = "create-entity",
			entity_name = corpse_name,
			offsets = { { 0, 0 } },
		},
	}

	data:extend({ particle })

	prototype.dying_trigger_effect = {
		{
			type = "create-particle",
			particle_name = particle_name,
			initial_height = 1.8,
			initial_vertical_speed = 0,
			frame_speed = 1,
			frame_speed_deviation = 0.5,
			speed_from_center = 0,
			speed_from_center_deviation = 0.2,
			offset_deviation = { { -0.01, -0.01 }, { 0.01, 0.01 } },
			offsets = { { 0, 0.5 } },
		},
	}

	if prototype.type == "construction-robot" or prototype.type == "logistic-robot" then
		return
	end

	prototype.destroy_action = {
		type = "direct",
		action_delivery = {
			type = "instant",
			source_effects = {
				type = "create-particle",
				particle_name = particle_name,
				initial_height = 1.8,
				initial_vertical_speed = 0,
				frame_speed = 0.5,
				frame_speed_deviation = 0.5,
				speed_from_center = 0,
				speed_from_center_deviation = 0.1,
				offset_deviation = { { -0.01, -0.01 }, { 0.01, 0.01 } },
				offsets = { { 0, 0.5 } },
			},
		},
	}
end

---Sets the icon store used for deferrable icon assignment.
---@param icon_store Reskins.SpriteUtils.DeferredIconStore The icon store.
---@return LibHack # The library, for chaining.
---@deprecated
function lib.with_icon_store(icon_store)
	_deferred_icon_store = icon_store
	return lib -- Chainable.
end

return lib
