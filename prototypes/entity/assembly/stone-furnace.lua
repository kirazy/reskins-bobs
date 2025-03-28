-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and (reskins.bobs.triggers.assembly.entities or reskins.bobs.triggers.plates.entities)) then
	return
end

local stone_furnace_map = {
	["stone-furnace"] = { type = "furnace", tint = reskins.bobs.furnace_tint_index.standard },
	["bob-stone-mixing-furnace"] = { type = "assembling-machine", tint = reskins.bobs.furnace_tint_index.mixing },
	["bob-stone-chemical-furnace"] = { type = "assembling-machine", tint = reskins.bobs.furnace_tint_index.chemical, is_chemical = true },
}

local function stone_furnace_entities(furnace, tint)
	return {
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/" .. furnace .. "-base.png",
				priority = "high",
				width = 152,
				height = 152,
				shift = util.by_pixel(0, 1),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/" .. furnace .. "-mask.png",
				priority = "high",
				width = 152,
				height = 152,
				shift = util.by_pixel(0, 1),
				tint = tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/" .. furnace .. "-highlights.png",
				priority = "high",
				width = 152,
				height = 152,
				shift = util.by_pixel(0, 1),
				blend_mode = reskins.lib.settings.blend_mode,
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/shadows/" .. furnace .. "-shadow.png",
				priority = "high",
				width = 176,
				height = 140,
				draw_as_shadow = true,
				shift = util.by_pixel(12, 3),
				scale = 0.5,
			},
		},
	}
end

local function stone_furnace_remnants(furnace, tint, count)
	return {
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/remnants/" .. furnace .. "-remnants-base.png",
				width = 202,
				height = 180,
				line_length = count,
				direction_count = count,
				shift = util.by_pixel(2, 17),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/remnants/" .. furnace .. "-remnants-mask.png",
				width = 202,
				height = 180,
				line_length = count,
				direction_count = count,
				shift = util.by_pixel(2, 17),
				tint = tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/remnants/" .. furnace .. "-remnants-highlights.png",
				width = 202,
				height = 180,
				line_length = count,
				direction_count = count,
				shift = util.by_pixel(2, 17),
				blend_mode = reskins.lib.settings.blend_mode,
				scale = 0.5,
			},
		},
	}
end

local function base_fire_animation()
	return {
		filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
		priority = "extra-high",
		line_length = 8,
		width = 41,
		height = 100,
		frame_count = 48,
		axially_symmetrical = false,
		direction_count = 1,
		shift = util.by_pixel(-0.75, 5.5),
		draw_as_glow = true,
		scale = 0.5,
	}
end

local function working_light_4way(direction)
	local furnace_4way_lights = reskins.lib.sprites.make_4way_animation_from_spritesheet({
		filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/lights/stone-furnace-light-4way.png",
		blend_mode = "additive",
		width = 152,
		height = 172,
		repeat_count = 48,
		shift = util.by_pixel(0, 1),
		draw_as_glow = true,
		scale = 0.5,
	})

	return furnace_4way_lights[direction]
end

local function furnace_ground_light()
	return {
		filename = "__base__/graphics/entity/stone-furnace/stone-furnace-ground-light.png",
		blend_mode = "additive",
		draw_as_light = true,
		width = 116,
		height = 110,
		repeat_count = 48,
		shift = util.by_pixel(-1, 44),
		scale = 0.5,
	}
end

local function working_light_with_fire()
	return {
		layers = {
			base_fire_animation(),
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/stone-furnace/lights/stone-furnace-light.png",
				blend_mode = "additive",
				width = 152,
				height = 172,
				repeat_count = 48,
				shift = util.by_pixel(0, 1),
				draw_as_glow = true,
				scale = 0.5,
			},
		},
	}
end

local function working_light_with_fire_4way(direction)
	return {
		layers = {
			base_fire_animation(),
			working_light_4way(direction),
		},
	}
end

-- Reskin entities, create and assign extra details
for name, map in pairs(stone_furnace_map) do
	local inputs = {
		type = map.type,
		base_entity_name = "stone-furnace",
		directory = reskins.bobs.directory,
		mod = "bobs",
		group = "assembly",
		tint = map.tint,
		particles = { ["medium-stone"] = 2 },
	}

	if reskins.lib.settings.get_value("reskins-bobs-do-furnace-tier-labeling") == true then
		inputs.tier_labels = true
	else
		inputs.tier_labels = false
	end

	---@type data.FurnacePrototype|data.AssemblingMachinePrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	-- Abstract from entity name to sprite sheet name
	inputs.icon_name = map.is_chemical and "stone-chemical-furnace" or "stone-furnace"

	reskins.lib.setup_standard_entity(name, 1, inputs)

	-- Fetch remnant
	local remnant = data.raw["corpse"][name .. "-remnants"]

	-- Reskin remnants and entities
	-- Standard Furnace
	if map.is_chemical then
		remnant.animation = stone_furnace_remnants(inputs.icon_name, inputs.tint, 4)
		entity.graphics_set.animation = reskins.lib.sprites.make_4way_animation_from_spritesheet(stone_furnace_entities(inputs.icon_name, inputs.tint))

		-- Handle working_visualisations
		entity.graphics_set.working_visualisations = {
			-- Furnace and stack lights
			{
				fadeout = true,
				effect = "flicker",
				north_animation = working_light_with_fire_4way("north"),
				east_animation = working_light_4way("east"),
				south_animation = working_light_with_fire_4way("south"),
				west_animation = working_light_with_fire_4way("west"),
			},

			-- Ground light
			{
				fadeout = true,
				effect = "flicker",
				north_animation = furnace_ground_light(),
				south_animation = furnace_ground_light(),
				west_animation = furnace_ground_light(),
			},
		}
	else
		remnant.animation = make_rotated_animation_variations_from_sheet(1, stone_furnace_remnants(inputs.icon_name, inputs.tint, 1))
		entity.graphics_set.animation = stone_furnace_entities(inputs.icon_name, inputs.tint)

		-- Handle working_visualisations
		entity.graphics_set.working_visualisations = {
			-- Furnace and stack lights
			{
				fadeout = true,
				effect = "flicker",
				animation = working_light_with_fire(),
			},

			-- Ground light
			{
				fadeout = true,
				effect = "flicker",
				animation = furnace_ground_light(),
			},
		}
	end

	-- Handle ambient-light
	entity.energy_source.light_flicker = {
		color = { 0, 0, 0 },
		minimum_light_size = 0,
		light_intensity_to_size_coefficient = 0,
	}

	if name ~= "stone-furnace" then
		entity.water_reflection = util.copy(data.raw["furnace"]["stone-furnace"].water_reflection)
	end

	::continue::
end
