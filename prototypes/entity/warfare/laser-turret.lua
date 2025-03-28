-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "electric-turret",
	icon_name = "laser-turret",
	base_entity_name = "laser-turret",
	mod = "bobs",
	group = "warfare",
	particles = { ["medium"] = 2 },
}

local tier_map = {
	["laser-turret"] = { tier = 1 },
	["bob-laser-turret-2"] = { tier = 2, lens_type = "sapphire" },
	["bob-laser-turret-3"] = { tier = 3, lens_type = "emerald" },
	["bob-laser-turret-4"] = { tier = 4, lens_type = "topaz" },
	["bob-laser-turret-5"] = { tier = 5, lens_type = "diamond" },
}

local function turret_extension(parameters)
	return {
		filename = "__base__/graphics/entity/laser-turret/laser-turret-raising.png",
		priority = "medium",
		width = 130,
		height = 126,
		frame_count = parameters.frame_count and parameters.frame_count or 15,
		line_length = parameters.line_length and parameters.line_length or 0,
		run_mode = parameters.run_mode and parameters.run_mode or "forward",
		axially_symmetrical = false,
		direction_count = 4,
		shift = util.by_pixel(0, -32.5),
		scale = 0.5,
	}
end

local function turret_extension_mask(parameters)
	return {
		filename = "__base__/graphics/entity/laser-turret/laser-turret-raising-mask.png",
		flags = { "mask" },
		width = 86,
		height = 80,
		frame_count = parameters.frame_count and parameters.frame_count or 15,
		line_length = parameters.line_length and parameters.line_length or 0,
		run_mode = parameters.run_mode and parameters.run_mode or "forward",
		axially_symmetrical = false,
		apply_runtime_tint = true,
		direction_count = 4,
		shift = util.by_pixel(0, -43),
		scale = 0.5,
	}
end

local function turret_extension_shadow(parameters)
	return {
		filename = "__base__/graphics/entity/laser-turret/laser-turret-raising-shadow.png",
		width = 182,
		height = 96,
		frame_count = parameters.frame_count and parameters.frame_count or 15,
		line_length = parameters.line_length and parameters.line_length or 0,
		run_mode = parameters.run_mode and parameters.run_mode or "forward",
		axially_symmetrical = false,
		direction_count = 4,
		draw_as_shadow = true,
		shift = util.by_pixel(47, 2.5),
		scale = 0.5,
	}
end

local function turret_shooting()
	return {
		filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting.png",
		line_length = 8,
		width = 126,
		height = 120,
		frame_count = 1,
		direction_count = 64,
		shift = util.by_pixel(0, -35),
		scale = 0.5,
	}
end

local function turret_shooting_mask()
	return {
		filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-mask.png",
		flags = { "mask" },
		line_length = 8,
		width = 92,
		height = 80,
		frame_count = 1,
		apply_runtime_tint = true,
		direction_count = 64,
		shift = util.by_pixel(0, -43.5),
		scale = 0.5,
	}
end

local function turret_shooting_shadow()
	return {
		filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-shadow.png",
		line_length = 8,
		width = 170,
		height = 92,
		frame_count = 1,
		direction_count = 64,
		draw_as_shadow = true,
		shift = util.by_pixel(50.5, 2.5),
		scale = 0.5,
	}
end

local function turret_shooting_glow(lens)
	return {
		filename = "__reskins-bobs__/graphics/entity/warfare/beam/" .. lens .. "/" .. lens .. "-laser-turret-shooting-light.png",
		line_length = 8,
		width = 122,
		height = 116,
		frame_count = 1,
		direction_count = 64,
		shift = util.by_pixel(-0.5, -35),
		blend_mode = "additive",
		scale = 0.5,
	}
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
	---@type data.ElectricTurretPrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	local tier = reskins.lib.tiers.get_tier(map)
	inputs.tint = reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Fetch remnant
	local remnant = data.raw["corpse"][name .. "-remnants"]

	-- Reskin remnants
	remnant.animation = make_rotated_animation_variations_from_sheet(3, {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/laser-turret/remnants/laser-turret-remnants.png",
				line_length = 1,
				width = 198,
				height = 194,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(2.5, -2),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/warfare/laser-turret/remnants/laser-turret-remnants-mask.png",
				line_length = 1,
				width = 198,
				height = 194,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(2.5, -2),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/warfare/laser-turret/remnants/laser-turret-remnants-highlights.png",
				line_length = 1,
				width = 198,
				height = 194,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(2.5, -2),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Runtime Mask
			{
				priority = "low",
				filename = "__base__/graphics/entity/laser-turret/remnants/mask/laser-turret-remnants-mask.png",
				width = 114,
				height = 94,
				frame_count = 1,
				apply_runtime_tint = true,
				direction_count = 1,
				shift = util.by_pixel(4, -2.5),
				scale = 0.5,
			},
		},
	})

	-- Reskin entities
	entity.folded_animation = {
		layers = {
			turret_extension({ frame_count = 1, line_length = 1 }),
			turret_extension_mask({ frame_count = 1, line_length = 1 }),
			turret_extension_shadow({ frame_count = 1, line_length = 1 }),
		},
	}

	entity.preparing_animation = {
		layers = {
			turret_extension({}),
			turret_extension_mask({}),
			turret_extension_shadow({}),
		},
	}

	entity.prepared_animation = {
		layers = {
			turret_shooting(),
			turret_shooting_mask(),
			turret_shooting_shadow(),
		},
	}

	if map.lens_type then
		-- Light up laser turret when firing
		entity.energy_glow_animation = turret_shooting_glow(map.lens_type)
		entity.glow_light_intensity = 0.5

		-- Fix laser offset
		entity.attack_parameters.source_direction_count = 64
		entity.attack_parameters.source_offset = { 0, -3.423489 / 4 }
	end

	entity.folding_animation = {
		layers = {
			turret_extension({ run_mode = "backward" }),
			turret_extension_mask({ run_mode = "backward" }),
			turret_extension_shadow({ run_mode = "backward" }),
		},
	}

	entity.graphics_set = {
		base_visualisation = {
			animation = {
				layers = {
					-- Base
					{
						filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
						priority = "high",
						width = 138,
						height = 104,
						direction_count = 1,
						frame_count = 1,
						shift = util.by_pixel(-0.5, 2),
						scale = 0.5,
					},
					-- Mask
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/laser-turret/laser-turret-base-mask.png",
						priority = "high",
						width = 138,
						height = 104,
						direction_count = 1,
						frame_count = 1,
						shift = util.by_pixel(-0.5, 2),
						tint = inputs.tint,
						scale = 0.5,
					},
					-- Highlights
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/laser-turret/laser-turret-base-highlights.png",
						priority = "high",
						width = 138,
						height = 104,
						direction_count = 1,
						frame_count = 1,
						shift = util.by_pixel(-0.5, 2),
						blend_mode = reskins.lib.settings.blend_mode, -- "additive",
						scale = 0.5,
					},
					-- Shadow
					{
						filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
						line_length = 1,
						width = 132,
						height = 82,
						draw_as_shadow = true,
						direction_count = 1,
						frame_count = 1,
						shift = util.by_pixel(6, 3),
						scale = 0.5,
					},
				},
			},
		},
	}

	if name ~= "laser-turret" then
		entity.water_reflection = util.copy(data.raw[inputs.type]["laser-turret"].water_reflection)
	end

	::continue::
end
