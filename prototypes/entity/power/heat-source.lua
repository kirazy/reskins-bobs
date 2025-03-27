-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.power.entities) then return end
if not (reskins.bobs and reskins.bobs.triggers.power.heatsources) then return end

-- Set input parameters
local inputs = {
	type = "reactor",
	base_entity_name = "nuclear-reactor",
	mod = "bobs",
	group = "power",
	particles = { ["big"] = 1, ["medium"] = 2 },
	make_remnants = false,
}

local tier_map = {
	["bob-burner-reactor"] = { tier = 1, prog_tier = 3, icon_name = "heat-source-burner", material = "base" },
	["bob-burner-reactor-2"] = { tier = 2, prog_tier = 4, icon_name = "heat-source-burner", material = "silver-aluminum" },
	["bob-burner-reactor-3"] = { tier = 3, prog_tier = 5, icon_name = "heat-source-burner", material = "gold-copper" },
	["bob-fluid-reactor"] = { tier = 1, prog_tier = 3, icon_name = "heat-source-fluid", material = "base" },
	["bob-fluid-reactor-2"] = { tier = 2, prog_tier = 4, icon_name = "heat-source-fluid", material = "silver-aluminum" },
	["bob-fluid-reactor-3"] = { tier = 3, prog_tier = 5, icon_name = "heat-source-fluid", material = "gold-copper" },
}

if reskins.lib.version.is_same_or_newer(mods["bobpower"], "1.1.6") then
	tier_map["bob-burner-reactor"].prog_tier = 2
	tier_map["bob-fluid-reactor"].prog_tier = 2

	tier_map["bob-burner-reactor-2"].material = "aluminum-invar"
	tier_map["bob-burner-reactor-2"].prog_tier = 3
	tier_map["bob-fluid-reactor-2"].material = "aluminum-invar"
	tier_map["bob-fluid-reactor-2"].prog_tier = 3

	tier_map["bob-burner-reactor-3"] = nil
	tier_map["bob-fluid-reactor-3"] = nil
end

---comment
---@param material any
---@return data.Sprite
local function heat_source_base_pipes(material)
	---@type data.Sprite
	local sprite = {
		filename = "__reskins-bobs__/graphics/entity/power/heat-source/heat-source-base-pipes-" .. material .. ".png",
		width = 192,
		height = 192,
		scale = 0.5,
		shift = { -0.03125, -0.1875 },
	}

	return sprite
end

---comment
---@param material any
---@return data.SpriteVariations
local function connect_patches_connected(material)
	---@type data.SpriteVariations
	local sprite = {
		sheet = {
			filename = "__reskins-bobs__/graphics/entity/power/heat-source/reactor-connect-patches-" .. material .. ".png",
			width = 64,
			height = 64,
			variation_count = 12,
			scale = 0.5,
		},
	}

	return sprite
end

---comment
---@param material any
---@return data.SpriteVariations
local function connect_patches_disconnected(material)
	---@type data.SpriteVariations
	local sprite = {
		sheet = {
			filename = "__reskins-bobs__/graphics/entity/power/heat-source/reactor-connect-patches-" .. material .. ".png",
			width = 64,
			height = 64,
			y = 64,
			variation_count = 12,
			scale = 0.5,
		},
	}

	return sprite
end

for name, mapping in pairs(tier_map) do
	---@type data.ReactorPrototype
	local entity = data.raw[inputs.type][name]
	if not entity then goto continue end

	local tier = mapping.tier
	if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then tier = mapping.prog_tier or mapping.tier end

	inputs.icon_name = mapping.icon_name
	inputs.tint = mapping.tint or reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	entity.picture = {
		layers = {
			{
				filename = "__reskins-bobs__/graphics/entity/power/heat-source/heat-source-base.png",
				priority = "high",
				width = 84,
				height = 66,
				scale = 1.5,
				shift = { 0.4375 * 1.5, 0.03125 * 1.5 },
			},
			{
				filename = "__reskins-bobs__/graphics/entity/power/heat-source/heat-source-mask.png",
				priority = "high",
				width = 84,
				height = 66,
				scale = 1.5,
				tint = inputs.tint,
				shift = { 0.4375 * 1.5, 0.03125 * 1.5 },
			},
			{
				filename = "__reskins-bobs__/graphics/entity/power/heat-source/heat-source-highlights.png",
				priority = "high",
				width = 84,
				height = 66,
				scale = 1.5,
				blend_mode = reskins.lib.settings.blend_mode,
				shift = { 0.4375 * 1.5, 0.03125 * 1.5 },
			},
			{
				filename = "__reskins-bobs__/graphics/entity/power/heat-source/heat-source-shadow.png",
				priority = "high",
				width = 84,
				height = 66,
				scale = 1.5,
				draw_as_shadow = true,
				shift = { 0.4375 * 1.5, 0.03125 * 1.5 },
			},
		},
	}

	entity.working_light_picture = {
		filename = "__bobpower__/graphics/burner-reactor/reactor-fire.png",
		priority = "high",
		width = 36,
		height = 19,
		frame_count = 12,
		scale = 1.5,
		draw_as_glow = true,
		shift = { -0.03125 * 1.5, 0.671875 * 1.5 },
	}

	-- Eliminate light
	entity.use_fuel_glow_color = false
	entity.light = { intensity = 0, size = 0, shift = { 0.0, 0.0 }, color = { r = 0, g = 0, b = 0, a = 0 } }
	entity.energy_source.light_flicker = {
		color = { 0, 0, 0 },
		minimum_light_size = 0,
		light_intensity_to_size_coefficient = 0,
	}

	-- Heat pipes
	entity.lower_layer_picture = heat_source_base_pipes(mapping.material)
	entity.connection_patches_connected = connect_patches_connected(mapping.material)
	entity.connection_patches_disconnected = connect_patches_disconnected(mapping.material)

	-- Overlay tinted pipe pictures
	if entity.energy_source.fluid_box then entity.energy_source = util.merge({ entity.energy_source, {
		fluid_box = { pipe_picture = reskins.bobs.assembly_pipe_pictures(inputs.tint) },
	} }) end

	-- Label to skip to next iteration
	::continue::
end
