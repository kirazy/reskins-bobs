-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] and not mods["bobplates"] then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.assembly.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "furnace",
	icon_name = "distillery",
	base_entity_name = "steel-furnace",
	mod = "bobs",
	group = "assembly",
	particles = { ["medium"] = 2 },
	make_remnants = false,
}

local tier_map = {
	["bob-distillery"] = 1,
	["bob-distillery-2"] = 2,
	["bob-distillery-3"] = 3,
	["bob-distillery-4"] = 4,
	["bob-distillery-5"] = 5,
}

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
	---@type data.FurnacePrototype
	local entity = data.raw[inputs.type][name]

	-- Check if entity exists, if not, skip this iteration
	if not entity then
		goto continue
	end

	-- Determine what tint we're using
	inputs.tint = reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Reskin entity
	entity.graphics_set.animation = reskins.lib.sprites.make_4way_animation_from_spritesheet({
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/distillery-base.png",
				width = 148,
				height = 192,
				frame_count = 1,
				shift = util.by_pixel(0, 0),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/distillery-mask.png",
				width = 148,
				height = 192,
				frame_count = 1,
				shift = util.by_pixel(0, 0),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/distillery-highlights.png",
				width = 148,
				height = 192,
				frame_count = 1,
				shift = util.by_pixel(0, 0),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/distillery-shadow.png",
				width = 192,
				height = 134,
				frame_count = 1,
				shift = util.by_pixel(16, 1.5),
				draw_as_shadow = true,
				scale = 0.5,
			},
		},
	})

	-- Handle Working Visualization
	entity.graphics_set.working_visualisations = {
		{
			effect = "uranium-glow",
			fadeout = true,
			north_position = util.by_pixel(-7.5, -9),
			east_position = util.by_pixel(10, -9),
			south_position = util.by_pixel(8, 3.5),
			west_position = util.by_pixel(-10, 3),
			north_animation = {
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/lights/distillery-light-north.png",
				width = 66,
				height = 62,
				shift = util.by_pixel(0, 0),
				draw_as_glow = true,
				scale = 0.5,
			},
			east_animation = {
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/lights/distillery-light-east.png",
				width = 68,
				height = 60,
				shift = util.by_pixel(0, 0),
				draw_as_glow = true,
				scale = 0.5,
			},
			south_animation = {
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/lights/distillery-light-south.png",
				width = 66,
				height = 64,
				shift = util.by_pixel(0, 0),
				draw_as_glow = true,
				scale = 0.5,
			},
			west_animation = {
				filename = "__reskins-bobs__/graphics/entity/assembly/distillery/lights/distillery-light-west.png",
				width = 66,
				height = 58,
				shift = util.by_pixel(0, 0),
				draw_as_glow = true,
				scale = 0.5,
			},
		},
	}

	entity.water_reflection = {
		pictures = {
			filename = "__reskins-bobs__/graphics/entity/assembly/distillery/distillery-reflection.png",
			priority = "extra-high",
			width = 28,
			height = 36,
			shift = util.by_pixel(10 / 3, 35),
			variation_count = 4,
			scale = 10 / 3,
		},
		rotate = false,
		orientation_to_variation = true,
	}

	-- Label to skip to next iteration
	::continue::
end
