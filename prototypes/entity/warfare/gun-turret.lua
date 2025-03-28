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
	type = "ammo-turret",
	icon_name = "gun-turret",
	base_entity_name = "gun-turret",
	mod = "bobs",
	group = "warfare",
	particles = { ["medium"] = 2 },
}

local tier_map = {
	["gun-turret"] = 1,
	["bob-gun-turret-2"] = 2,
	["bob-gun-turret-3"] = 3,
	["bob-gun-turret-4"] = 4,
	["bob-gun-turret-5"] = 5,
}

-- Image layer functions
local function turret_extension(inputs, parameters)
	return {
		filename = "__base__/graphics/entity/gun-turret/gun-turret-raising.png",
		priority = "medium",
		width = 130,
		height = 126,
		direction_count = 4,
		frame_count = parameters.frame_count or 5,
		line_length = parameters.line_length or 0,
		run_mode = parameters.run_mode or "forward",
		shift = util.by_pixel(0, -26.5),
		axially_symmetrical = false,
		scale = 0.5,
	}
end

local function turret_extension_tint(inputs, parameters)
	return {
		filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-raising-mask.png",
		priority = "medium",
		width = 130,
		height = 126,
		direction_count = 4,
		frame_count = parameters.frame_count or 5,
		line_length = parameters.line_length or 0,
		run_mode = parameters.run_mode or "forward",
		shift = util.by_pixel(0, -26.5),
		tint = inputs.tint,
		axially_symmetrical = false,
		scale = 0.5,
	}
end

local function turret_extension_highlights(inputs, parameters)
	return {
		filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-raising-highlights.png",
		priority = "medium",
		width = 130,
		height = 126,
		direction_count = 4,
		frame_count = parameters.frame_count or 5,
		line_length = parameters.line_length or 0,
		run_mode = parameters.run_mode or "forward",
		shift = util.by_pixel(0, -26.5),
		blend_mode = reskins.lib.settings.blend_mode, -- "additive",
		axially_symmetrical = false,
		scale = 0.5,
	}
end

local function turret_extension_mask(inputs, parameters)
	return {
		filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-mask.png",
		inputs = { "mask" },
		width = 48,
		height = 62,
		direction_count = 4,
		frame_count = parameters.frame_count or 5,
		line_length = parameters.line_length or 0,
		run_mode = parameters.run_mode or "forward",
		shift = util.by_pixel(0, -28),
		axially_symmetrical = false,
		apply_runtime_tint = true,
		scale = 0.5,
	}
end

local function turret_extension_shadow(inputs, parameters)
	return {
		filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-shadow.png",
		width = 250,
		height = 124,
		direction_count = 4,
		frame_count = parameters.frame_count or 5,
		line_length = parameters.line_length or 0,
		run_mode = parameters.run_mode or "forward",
		shift = util.by_pixel(19, 2.5),
		axially_symmetrical = false,
		draw_as_shadow = true,
		scale = 0.5,
	}
end

local function turret_attack(inputs, parameters)
	return {
		layers = {
			-- Base
			{
				width = 132,
				height = 130,
				frame_count = parameters.frame_count and parameters.frame_count or 2,
				axially_symmetrical = false,
				direction_count = 64,
				shift = util.by_pixel(0, -27.5),
				stripes = {
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-1.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-2.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-3.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-4.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
			},
			-- Mask
			{
				width = 132,
				height = 130,
				frame_count = parameters.frame_count and parameters.frame_count or 2,
				axially_symmetrical = false,
				direction_count = 64,
				shift = util.by_pixel(0, -27.5),
				tint = inputs.tint,
				stripes = {
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-1-mask.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-2-mask.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-3-mask.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-4-mask.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
			},
			-- Highlights
			{
				width = 132,
				height = 130,
				frame_count = parameters.frame_count and parameters.frame_count or 2,
				axially_symmetrical = false,
				direction_count = 64,
				shift = util.by_pixel(0, -27.5),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				stripes = {
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-1-highlights.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-2-highlights.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-3-highlights.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/gun-turret-shooting-4-highlights.png",
						width_in_frames = parameters.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
			},
			-- Runtime Mask
			{
				inputs = { "mask" },
				line_length = parameters.frame_count or 2,
				width = 58,
				height = 54,
				frame_count = parameters.frame_count or 2,
				axially_symmetrical = false,
				direction_count = 64,
				shift = util.by_pixel(0, -32.5),
				apply_runtime_tint = true,
				stripes = {
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-1.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-2.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-3.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-4.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
			},
			-- Shadow
			{
				width = 250,
				height = 124,
				frame_count = parameters.frame_count and parameters.frame_count or 2,
				axially_symmetrical = false,
				direction_count = 64,
				shift = util.by_pixel(22, 2.5),
				draw_as_shadow = true,
				stripes = {
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-1.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-2.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-3.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-4.png",
						width_in_frames = parameters.frame_count and parameters.frame_count or 2,
						height_in_frames = 16,
					},
				},
				scale = 0.5,
			},
		},
	}
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
	---@type data.AmmoTurretPrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end
	inputs.tint = reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Fetch remnant
	local remnant = data.raw["corpse"][name .. "-remnants"]

	-- Reskin remnants
	remnant.animation = make_rotated_animation_variations_from_sheet(3, {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/gun-turret/remnants/gun-turret-remnants.png",
				line_length = 1,
				width = 252,
				height = 242,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(3, -1.5),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/remnants/gun-turret-remnants-mask.png",
				line_length = 1,
				width = 252,
				height = 242,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(3, -1.5),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/warfare/gun-turret/remnants/gun-turret-remnants-highlights.png",
				line_length = 1,
				width = 252,
				height = 242,
				frame_count = 1,
				variation_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(3, -1.5),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Runtime Mask
			{
				priority = "low",
				filename = "__base__/graphics/entity/gun-turret/remnants/mask/gun-turret-remnants-mask.png",
				width = 68,
				height = 64,
				frame_count = 1,
				apply_runtime_tint = true,
				direction_count = 1,
				shift = util.by_pixel(-1, -11),
				scale = 0.5,
			},
		},
	})

	-- Reskin entities
	entity.folded_animation = {
		layers = {
			turret_extension(inputs, { frame_count = 1, line_length = 1 }),
			turret_extension_tint(inputs, { frame_count = 1, line_length = 1 }),
			turret_extension_highlights(inputs, { frame_count = 1, line_length = 1 }),
			turret_extension_mask(inputs, { frame_count = 1, line_length = 1 }),
			turret_extension_shadow(inputs, { frame_count = 1, line_length = 1 }),
		},
	}
	entity.preparing_animation = {
		layers = {
			turret_extension(inputs, {}),
			turret_extension_tint(inputs, {}),
			turret_extension_highlights(inputs, {}),
			turret_extension_mask(inputs, {}),
			turret_extension_shadow(inputs, {}),
		},
	}
	entity.prepared_animation = turret_attack(inputs, { frame_count = 1 })
	entity.attacking_animation = turret_attack(inputs, {})
	entity.folding_animation = {
		layers = {
			turret_extension(inputs, { run_mode = "backward" }),
			turret_extension_tint(inputs, { run_mode = "backward" }),
			turret_extension_highlights(inputs, { run_mode = "backward" }),
			turret_extension_mask(inputs, { run_mode = "backward" }),
			turret_extension_shadow(inputs, { run_mode = "backward" }),
		},
	}
	entity.graphics_set = {
		base_visualisation = {
			animation = {
				layers = {
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
						priority = "high",
						width = 150,
						height = 118,
						axially_symmetrical = false,
						direction_count = 1,
						frame_count = 1,
						shift = util.by_pixel(0.5, -1),
						scale = 0.5,
					},
					{
						filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
						inputs = { "mask", "low-object" },
						line_length = 1,
						width = 122,
						height = 102,
						axially_symmetrical = false,
						direction_count = 1,
						frame_count = 1,
						shift = util.by_pixel(0, -4.5),
						apply_runtime_tint = true,
						scale = 0.5,
					},
				},
			},
		},
	}

	if name ~= "gun-turret" then
		entity.water_reflection = util.copy(data.raw[inputs.type]["gun-turret"].water_reflection)
	end

	::continue::
end
