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
	icon_name = "heat-exchanger",
	base_entity_name = "heat-exchanger",
	mod = "bobs",
	group = "power",
	particles = { ["big"] = 3 },
}

local tier_map = {
	["heat-exchanger"] = { tier = 1, prog_tier = 2, material = "base" },
	["bob-heat-exchanger-2"] = { tier = 2, prog_tier = 3, material = "aluminum-invar" },
	["bob-heat-exchanger-3"] = { tier = 3, prog_tier = 4, material = "silver-titanium" },
	["bob-heat-exchanger-4"] = { tier = 4, prog_tier = 5, material = "gold-copper" },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
	---@type data.BoilerPrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	local tier = reskins.lib.tiers.get_tier(map)
	inputs.tint = reskins.lib.tiers.get_tint(tier)

	-- Setup icon details
	inputs.icon_base = "heat-exchanger-" .. map.material

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Fetch remnant
	local remnant = data.raw["corpse"][name .. "-remnants"]

	-- Reskin remnants
	remnant.animation = {
		layers = {
			-- Base
			{
				filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/remnants/heat-exchanger-remnants-base.png",
				width = 272,
				height = 262,
				direction_count = 4,
				shift = util.by_pixel(0.5, 8),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/remnants/heat-exchanger-remnants-mask.png",
				width = 272,
				height = 262,
				direction_count = 4,
				shift = util.by_pixel(0.5, 8),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/remnants/heat-exchanger-remnants-highlights.png",
				width = 272,
				height = 262,
				direction_count = 4,
				shift = util.by_pixel(0.5, 8),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Pipes
			{
				--stylua: ignore
				filename = "__reskins-bobs__/graphics/entity/power/heat-exchanger/heat-pipes/" .. map.material .. "/heatex-remnants.png",
				width = 272,
				height = 262,
				direction_count = 4,
				shift = util.by_pixel(0.5, 8),
				scale = 0.5,
			},
		},
	}

	entity.pictures = {
		north = {
			structure = {
				layers = {
					-- Base
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-north-idle-base.png",
						priority = "extra-high",
						width = 269,
						height = 221,
						shift = util.by_pixel(-1.25, 5.25),
						scale = 0.5,
					},
					-- Mask
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-north-idle-mask.png",
						priority = "extra-high",
						width = 269,
						height = 221,
						shift = util.by_pixel(-1.25, 5.25),
						tint = inputs.tint,
						scale = 0.5,
					},
					-- Highlights
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-north-idle-highlights.png",
						priority = "extra-high",
						width = 269,
						height = 221,
						shift = util.by_pixel(-1.25, 5.25),
						blend_mode = reskins.lib.settings.blend_mode, -- "additive",
						scale = 0.5,
					},
					-- Pipes
					{
						--stylua: ignore
						filename = "__reskins-bobs__/graphics/entity/power/heat-exchanger/heat-pipes/" .. map.material .. "/heatex-N-idle.png",
						priority = "extra-high",
						width = 269,
						height = 221,
						shift = util.by_pixel(-1.25, 5.25),
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
			},
		},
		east = {
			structure = {
				layers = {
					-- Base
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-east-idle-base.png",
						priority = "extra-high",
						width = 211,
						height = 301,
						shift = util.by_pixel(-1.75, 1.25),
						scale = 0.5,
					},
					-- Mask
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-east-idle-mask.png",
						priority = "extra-high",
						width = 211,
						height = 301,
						shift = util.by_pixel(-1.75, 1.25),
						tint = inputs.tint,
						scale = 0.5,
					},
					-- Highlights
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-east-idle-highlights.png",
						priority = "extra-high",
						width = 211,
						height = 301,
						shift = util.by_pixel(-1.75, 1.25),
						blend_mode = reskins.lib.settings.blend_mode, -- "additive",
						scale = 0.5,
					},
					-- Pipes
					{
						--stylua: ignore
						filename = "__reskins-bobs__/graphics/entity/power/heat-exchanger/heat-pipes/" .. map.material .. "/heatex-E-idle.png",
						priority = "extra-high",
						width = 211,
						height = 301,
						shift = util.by_pixel(-1.75, 1.25),
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
			},
		},
		south = {
			structure = {
				layers = {
					-- Base
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-south-idle-base.png",
						priority = "extra-high",
						width = 260,
						height = 201,
						shift = util.by_pixel(4, 10.75),
						scale = 0.5,
					},
					-- Mask
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-south-idle-mask.png",
						priority = "extra-high",
						width = 260,
						height = 201,
						shift = util.by_pixel(4, 10.75),
						tint = inputs.tint,
						scale = 0.5,
					},
					-- Highlights
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-south-idle-highlights.png",
						priority = "extra-high",
						width = 260,
						height = 201,
						shift = util.by_pixel(4, 10.75),
						blend_mode = reskins.lib.settings.blend_mode, -- "additive",
						scale = 0.5,
					},
					-- Pipes
					{
						--stylua: ignore
						filename = "__reskins-bobs__/graphics/entity/power/heat-exchanger/heat-pipes/" .. map.material .. "/heatex-S-idle.png",
						priority = "extra-high",
						width = 260,
						height = 201,
						shift = util.by_pixel(4, 10.75),
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
			},
		},
		west = {
			structure = {
				layers = {
					-- Base
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-west-idle-base.png",
						priority = "extra-high",
						width = 196,
						height = 273,
						shift = util.by_pixel(1.5, 7.75),
						scale = 0.5,
					},
					-- Mask
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-west-idle-mask.png",
						priority = "extra-high",
						width = 196,
						height = 273,
						shift = util.by_pixel(1.5, 7.75),
						tint = inputs.tint,
						scale = 0.5,
					},
					-- Highlights
					{
						filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-exchanger-west-idle-highlights.png",
						priority = "extra-high",
						width = 196,
						height = 273,
						shift = util.by_pixel(1.5, 7.75),
						blend_mode = reskins.lib.settings.blend_mode, -- "additive",
						scale = 0.5,
					},
					-- Pipes
					{
						--stylua: ignore
						filename = "__reskins-bobs__/graphics/entity/power/heat-exchanger/heat-pipes/" .. map.material .. "/heatex-W-idle.png",
						priority = "extra-high",
						width = 196,
						height = 273,
						shift = util.by_pixel(1.5, 7.75),
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
			},
		},
	}

	entity.energy_source.pipe_covers = reskins.lib.sprites.make_4way_animation_from_spritesheet({
		--stylua: ignore
		filename = "__reskins-bobs__/graphics/entity/power/heat-exchanger/heat-pipes/" .. map.material .. "/heatex-endings.png",
		width = 64,
		height = 64,
		direction_count = 4,
		scale = 0.5,
	})

	entity.energy_source.heat_pipe_covers =
		reskins.lib.sprites.make_4way_animation_from_spritesheet(apply_heat_pipe_glow({
			filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-pipes/base/heat-pipe-endings-heated.png",
			width = 64,
			height = 64,
			direction_count = 4,
			scale = 0.5,
		}))

	entity.energy_source.heat_picture = {
		north = apply_heat_pipe_glow({
			filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-pipes/base/heat-pipe-north-heated.png",
			priority = "extra-high",
			width = 44,
			height = 96,
			shift = util.by_pixel(-0.5, 8.5),
			scale = 0.5,
		}),
		east = apply_heat_pipe_glow({
			filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-pipes/base/heat-pipe-east-heated.png",
			priority = "extra-high",
			width = 80,
			height = 80,
			shift = util.by_pixel(-21, -13),
			scale = 0.5,
		}),
		south = apply_heat_pipe_glow({
			filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-pipes/base/heat-pipe-south-heated.png",
			priority = "extra-high",
			width = 28,
			height = 40,
			shift = util.by_pixel(-1, -30),
			scale = 0.5,
		}),
		west = apply_heat_pipe_glow({
			filename = "__reskins-assets-base__/graphics/entity/heat-exchanger/heat-pipes/base/heat-pipe-west-heated.png",
			priority = "extra-high",
			width = 64,
			height = 76,
			shift = util.by_pixel(23, -13),
			scale = 0.5,
		}),
	}

	entity.water_reflection = {
		pictures = {
			filename = "__base__/graphics/entity/boiler/boiler-reflection.png",
			priority = "extra-high",
			width = 28,
			height = 32,
			shift = util.by_pixel(5, 30),
			variation_count = 4,
			scale = 5,
		},
		rotate = false,
		orientation_to_variation = true,
	}

	::continue::
end
