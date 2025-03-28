-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.steam) then
	return
end

-- Set input parameters
local inputs = {
	type = "boiler",
	base_entity_name = "boiler",
	mod = "bobs",
	group = "power",
	particles = { ["big"] = 3 },
}

local tier_map = {
	["boiler"] = { 1, 1 },
	["bob-boiler-2"] = { 2, 2 },
	["bob-boiler-3"] = { 3, 3 },
	["bob-boiler-4"] = { 4, 4 },
	["bob-boiler-5"] = { 5, 5 },
	["bob-oil-boiler"] = { 1, 2, true },
	["bob-oil-boiler-2"] = { 2, 3, true },
	["bob-oil-boiler-3"] = { 3, 4, true },
	["bob-oil-boiler-4"] = { 4, 5, true },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
	---@type data.BoilerPrototype
	local entity = data.raw[inputs.type][name]

	-- Check if entity exists, if not, skip this iteration
	if not entity then
		goto continue
	end

	-- Parse map
	local tier = map[1]
	if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
		tier = map[2]
	end
	local has_fluids = map[3]

	-- Determine what tint we're using
	inputs.tint = reskins.lib.tiers.get_tint(tier)

	-- Setup icon details
	if has_fluids == true then
		inputs.icon_name = "oil-boiler"
	else
		inputs.icon_name = "boiler"
	end

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Fetch remnant
	local remnant = data.raw["corpse"][name .. "-remnants"]

	-- Reskin remnants
	remnant.animation = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/boiler/remnants/boiler-remnants.png",
				line_length = 1,
				width = 274,
				height = 220,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 4,
				shift = util.by_pixel(-0.5, -3),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/remnants/boiler-remnants-mask.png",
				line_length = 1,
				width = 274,
				height = 220,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 4,
				shift = util.by_pixel(-0.5, -3),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/remnants/boiler-remnants-highlights.png",
				line_length = 1,
				width = 274,
				height = 220,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 4,
				shift = util.by_pixel(-0.5, -3),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
		},
	}

	-- Reskin entities
	entity.pictures.north.structure = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/boiler/boiler-N-idle.png",
				priority = "extra-high",
				width = 269,
				height = 221,
				shift = util.by_pixel(-1.25, 5.25),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-N-idle-mask.png",
				priority = "extra-high",
				width = 269,
				height = 221,
				shift = util.by_pixel(-1.25, 5.25),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-N-idle-highlights.png",
				priority = "extra-high",
				width = 269,
				height = 221,
				shift = util.by_pixel(-1.25, 5.25),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
				priority = "extra-high",
				width = 274,
				height = 164,
				scale = 0.5,
				shift = util.by_pixel(20.5, 9),
				draw_as_shadow = true,
			},
		},
	}

	entity.pictures.east.structure = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/boiler/boiler-E-idle.png",
				priority = "extra-high",
				width = 216,
				height = 301,
				shift = util.by_pixel(-3, 1.25),
				scale = 0.5,
			},
			-- Color mask
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-E-idle-mask.png",
				priority = "extra-high",
				width = 216,
				height = 301,
				shift = util.by_pixel(-3, 1.25),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-E-idle-highlights.png",
				priority = "extra-high",
				width = 216,
				height = 301,
				shift = util.by_pixel(-3, 1.25),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
				priority = "extra-high",
				width = 184,
				height = 194,
				scale = 0.5,
				shift = util.by_pixel(30, 9.5),
				draw_as_shadow = true,
			},
		},
	}

	entity.pictures.south.structure = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/boiler/boiler-S-idle.png",
				priority = "extra-high",
				width = 260,
				height = 192,
				shift = util.by_pixel(4, 13),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-S-idle-mask.png",
				priority = "extra-high",
				width = 260,
				height = 192,
				shift = util.by_pixel(4, 13),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-S-idle-highlights.png",
				priority = "extra-high",
				width = 260,
				height = 192,
				shift = util.by_pixel(4, 13),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
				priority = "extra-high",
				width = 311,
				height = 131,
				scale = 0.5,
				shift = util.by_pixel(29.75, 15.75),
				draw_as_shadow = true,
			},
		},
	}

	entity.pictures.west.structure = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/boiler/boiler-W-idle.png",
				priority = "extra-high",
				width = 196,
				height = 273,
				shift = util.by_pixel(1.5, 7.75),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-W-idle-mask.png",
				priority = "extra-high",
				width = 196,
				height = 273,
				shift = util.by_pixel(1.5, 7.75),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/power/boiler/boiler-W-idle-highlights.png",
				priority = "extra-high",
				width = 196,
				height = 273,
				shift = util.by_pixel(1.5, 7.75),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
				priority = "extra-high",
				width = 206,
				height = 218,
				scale = 0.5,
				shift = util.by_pixel(19.5, 6.5),
				draw_as_shadow = true,
			},
		},
	}

	-- Handle ambient-light
	entity.energy_source.light_flicker = {
		color = { 0, 0, 0 },
		minimum_light_size = 0,
		light_intensity_to_size_coefficient = 0,
	}

	-- Handle pipes
	if has_fluids then
		entity.energy_source.fluid_box.pipe_covers = pipecoverspictures()
		entity.energy_source.fluid_box.pipe_picture = reskins.bobs.assembly_pipe_pictures(inputs.tint)
	end

	-- Label to skip to next iteration
	::continue::
end
