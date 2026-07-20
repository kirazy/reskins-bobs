-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.SpriteUtils

local _sprites = require("__reskins-sprite-utils__.sprites")
local _utils = require("__reskins-sprite-utils__.utils")

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.mining.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "mining-drill",
	icon_name = "pumpjack",
	base_entity_name = "pumpjack",
	mod = "bobs",
	group = "mining",
	particles = { ["small"] = 3 },
}

local tier_map = {
	["pumpjack"] = { tier = 1, prog_tier = 2 },
	["bob-pumpjack-1"] = { tier = 2, prog_tier = 3 },
	["bob-pumpjack-2"] = { tier = 3, prog_tier = 4 },
	["bob-pumpjack-3"] = { tier = 4, prog_tier = 5 },
	["bob-water-miner-1"] = { tier = 1, is_water_miner = true },
	["bob-water-miner-2"] = { tier = 2, is_water_miner = true },
	["bob-water-miner-3"] = { tier = 3, is_water_miner = true },
	["bob-water-miner-4"] = { tier = 4, is_water_miner = true },
}

-- Rescale pumpjack animation playback speed to something visually appealing
local max_playback = 2 -- Maximum animation playback speed
local min_playback = 0.5 -- Minimum animation playback speed

local pumpjack_speeds = {}
local index = 1

-- Loop through all the pumpjacks, figure out the mining speeds
for name, _ in pairs(tier_map) do
	---@type data.MiningDrillPrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	-- Fetch mining speed
	pumpjack_speeds[index] = data.raw[inputs.type][name].mining_speed
	index = index + 1

	::continue::
end

-- Determine max and min mining speeds
table.sort(pumpjack_speeds)
local max_speed = pumpjack_speeds[#pumpjack_speeds] or 0.5
local min_speed = pumpjack_speeds[1] or 0.5

---@param tint data.Color
---@param is_water_miner boolean? When `true`, uses the water pumpjack base sprite, otherwise, uses the pumpjack base sprite.
---@return data.RotatedAnimation
local function get_remnant_animation(tint, is_water_miner)
	---@type data.RotatedAnimation
	local remnant_animation = {
		layers = {
			-- Base
			{
				filename = is_water_miner
						and "__reskins-bobs__/graphics/entity/mining/pumpjack/remnants/water-pumpjack-remnants-base.png"
					or "__base__/graphics/entity/pumpjack/remnants/pumpjack-remnants.png",
				width = 274,
				height = 284,
				direction_count = 1,
				shift = util.by_pixel(0, 3.5),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/mining/pumpjack/remnants/pumpjack-remnants-mask.png",
				width = 274,
				height = 284,
				direction_count = 1,
				shift = util.by_pixel(0, 3.5),
				tint = tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/mining/pumpjack/remnants/pumpjack-remnants-highlights.png",
				width = 274,
				height = 284,
				direction_count = 1,
				shift = util.by_pixel(0, 3.5),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
		},
	}

	return remnant_animation
end

---@param animation_speed float|nil
---@return Animation[]
local function pumpjack_shadow_animation(animation_speed)
	---@type Animation[]
	return {
		{
			priority = "high",
			filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
			animation_speed = animation_speed or 0.5,
			draw_as_shadow = true,
			line_length = 8,
			width = 292,
			height = 78,
			frame_count = 40,
			scale = 0.5,
			shift = util.by_pixel(17.75, 14.5),
		},
	}
end

---@param tint data.Color|nil
---@param animation_speed float|nil
---@return Animation[]
local function pumpjack_accent_animation(tint, animation_speed)
	---@type Animation[]
	return {
		{
			priority = "high",
			filename = "__reskins-assets-base__/graphics/entity/pumpjack/pumpjack-horsehead-accent-mask.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			tint = tint,
			shift = util.by_pixel(-4.5, -29),
		},
		{
			priority = "high",
			filename = "__reskins-assets-base__/graphics/entity/pumpjack/pumpjack-horsehead-accent-highlights.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			shift = util.by_pixel(-4.5, -29),
			blend_mode = reskins.lib.settings.blend_mode, -- "additive",
		},
	}
end

---@param tint data.Color|nil
---@param animation_speed float|nil
---@return Animation[]
local function pumpjack_stripe_animation(tint, animation_speed)
	---@type Animation[]
	return {
		{
			priority = "high",
			filename = "__reskins-assets-base__/graphics/entity/pumpjack/pumpjack-horsehead-stripe-mask.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			tint = tint,
			shift = util.by_pixel(-4.5, -29),
		},
		{
			priority = "high",
			filename = "__reskins-assets-base__/graphics/entity/pumpjack/pumpjack-horsehead-stripe-highlights.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			shift = util.by_pixel(-4.5, -29),
			blend_mode = reskins.lib.settings.blend_mode, -- "additive",
		},
	}
end

---@param tint data.Color|nil
---@param animation_speed float|nil
---@return Animation[]
local function pumpjack_tintable_base_animation(tint, animation_speed)
	---@type Animation[]
	return {
		{
			priority = "high",
			filename = "__reskins-assets-base__/graphics/entity/pumpjack/pumpjack-tintable-horsehead.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			shift = util.by_pixel(-4.5, -29),
		},
		{
			priority = "high",
			filename = "__reskins-assets-base__/graphics/entity/pumpjack/pumpjack-tintable-horsehead-mask.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			tint = tint,
			shift = util.by_pixel(-4.5, -29),
		},
		{
			priority = "high",
			filename = "__reskins-assets-base__/graphics/entity/pumpjack/pumpjack-tintable-horsehead-highlights.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			shift = util.by_pixel(-4.5, -29),
			blend_mode = reskins.lib.settings.blend_mode, -- "additive",
		},
	}
end

---@param animation_speed float|nil
---@return Animation[]
local function pumpjack_base_animation(animation_speed)
	---@type Animation[]
	return {
		{
			priority = "high",
			filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
			animation_speed = animation_speed or 0.5,
			scale = 0.5,
			line_length = 8,
			width = 206,
			height = 172,
			frame_count = 40,
			shift = util.by_pixel(-4.5, -29),
		},
	}
end

---@param is_flipped boolean?
---@return Animation[]
local function pumpjack_base_visualisations(is_flipped)
	local BASE_PATH = "__base__/graphics/entity/pumpjack/"
	local flipped = is_flipped and "-flipped" or ""
	---@type Animation[]
	return {
		{
			filename = BASE_PATH .. "pumpjack-base" .. flipped .. ".png",
			priority = "extra-high",
			width = 261,
			height = 273,
			shift = util.by_pixel(-2.25, -4.75),
			scale = 0.5,
		},
		{
			filename = BASE_PATH .. "pumpjack-base" .. flipped .. "-shadow.png",
			width = 261,
			height = 273,
			scale = 0.5,
			draw_as_shadow = true,
			shift = util.by_pixel(-2, -5),
		},
	}
end

---@param is_flipped boolean?
---@return Animation[]
local function pumpjack_tintable_base_visualisations(tint, is_flipped)
	local BASE_PATH = "__base__/graphics/entity/pumpjack/"
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/pumpjack/"
	local flipped = is_flipped and "-flipped" or ""
	---@type Animation[]
	return {
		{
			filename = ASSETS_BASE_PATH .. "pumpjack-tintable-base" .. flipped .. ".png",
			priority = "extra-high",
			width = 261,
			height = 273,
			shift = util.by_pixel(-2.25, -4.75),
			scale = 0.5,
		},
		{
			filename = ASSETS_BASE_PATH .. "pumpjack-tintable-base-mask" .. flipped .. ".png",
			priority = "extra-high",
			width = 261,
			height = 273,
			tint = tint,
			shift = util.by_pixel(-2.25, -4.75),
			scale = 0.5,
		},
		{
			filename = ASSETS_BASE_PATH .. "pumpjack-tintable-base-highlights" .. flipped .. ".png",
			priority = "extra-high",
			width = 261,
			height = 273,
			blend_mode = "additive-soft",
			shift = util.by_pixel(-2.25, -4.75),
			scale = 0.5,
		},
		{
			filename = BASE_PATH .. "pumpjack-base" .. flipped .. "-shadow.png",
			width = 261,
			height = 273,
			scale = 0.5,
			draw_as_shadow = true,
			shift = util.by_pixel(-2, -5),
		},
	}
end

---@param is_flipped boolean?
---@return Animation[]
local function pumpjack_accent_visualisations(tint, is_flipped)
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/pumpjack/"
	local flipped = is_flipped and "-flipped" or ""
	---@type Animation[]
	return {
		{
			filename = ASSETS_BASE_PATH .. "pumpjack-base-accent-mask" .. flipped .. ".png",
			priority = "extra-high",
			width = 261,
			height = 273,
			tint = tint,
			shift = util.by_pixel(-2.25, -4.75),
			scale = 0.5,
		},
		{
			filename = ASSETS_BASE_PATH .. "pumpjack-base-accent-highlights" .. flipped .. ".png",
			priority = "extra-high",
			width = 261,
			height = 273,
			blend_mode = "additive-soft",
			shift = util.by_pixel(-2.25, -4.75),
			scale = 0.5,
		},
	}
end

-- Reskin entities, create and assign extra details
local WATER_TINT = util.color("#3083bf") --[[@as Color]]
local WATER_ACCENT_TINT = util.color("#ff8533") --[[@as Color]]

for name, map in pairs(tier_map) do
	---@type MiningDrillPrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end
	local tier = reskins.lib.tiers.get_tier(map)
	inputs.tint = reskins.lib.tiers.get_tint(tier)

	-- Setup icon base details
	if map.is_water_miner then
		inputs.icon_base = "water-pumpjack"
	else
		inputs.icon_base = "pumpjack"
	end

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Calculate new animation speed
	local animation_speed
	if max_speed - min_speed == 0 then
		animation_speed = entity.mining_speed
	else
		animation_speed = (
			((entity.mining_speed / (max_speed - min_speed)) - (min_speed / (max_speed - min_speed))) * max_playback
		) + ((max_speed / (max_speed - min_speed)) - (entity.mining_speed / (max_speed - min_speed))) * min_playback
	end

	-- Reskin base particles if we're a water pump
	if map.is_water_miner then
		reskins.lib.create_particle(name, inputs.base_entity_name, reskins.lib.particle_index["big"], 1, WATER_TINT)
		reskins.lib.create_particle(name, inputs.base_entity_name, reskins.lib.particle_index["medium"], 2, WATER_TINT)
	end

	-- Fetch remnants
	local remnant = data.raw["corpse"][name .. "-remnants"]

	-- Reskin remnants
	local remnant_animation = get_remnant_animation(inputs.tint, map.is_water_miner)
	remnant.animation = make_rotated_animation_variations_from_sheet(2, remnant_animation)

	-- Reskin entities
	if map.is_water_miner then
		local animation = {
			north = {
				layers = _utils.array_concat(
					pumpjack_tintable_base_animation(WATER_TINT, animation_speed),
					pumpjack_stripe_animation(inputs.tint, animation_speed),
					pumpjack_accent_animation(WATER_ACCENT_TINT, animation_speed),
					pumpjack_shadow_animation(animation_speed)
				),
			},
		}

		entity.graphics_set = {
			animation = animation,
			working_visualisations = {
				_sprites.make_4way_working_visualisations_from_spritesheet({
					always_draw = true,
					secondary_draw_order = -1,
					animation = {
						layers = _utils.array_concat(
							pumpjack_tintable_base_visualisations(WATER_TINT, false),
							pumpjack_accent_visualisations(WATER_ACCENT_TINT, false)
						),
					},
				}),
			},
		}
		entity.graphics_set_flipped = {
			animation = animation,
			working_visualisations = {
				_sprites.make_4way_working_visualisations_from_spritesheet({
					always_draw = true,
					secondary_draw_order = -1,
					animation = {
						layers = _utils.array_concat(
							pumpjack_tintable_base_visualisations(WATER_TINT, true),
							pumpjack_accent_visualisations(WATER_ACCENT_TINT, true)
						),
					},
				}),
			},
		}
	else
		local animation = {
			north = {
				layers = _utils.array_concat(
					pumpjack_base_animation(animation_speed),
					pumpjack_stripe_animation(inputs.tint, animation_speed),
					pumpjack_shadow_animation(animation_speed)
				),
			},
		}

		entity.graphics_set = {
			animation = animation,
			working_visualisations = {
				_sprites.make_4way_working_visualisations_from_spritesheet({
					always_draw = true,
					secondary_draw_order = -1,
					animation = {
						layers = pumpjack_base_visualisations(false),
					},
				}),
			},
		}
		entity.graphics_set_flipped = {
			animation = animation,
			working_visualisations = {
				_sprites.make_4way_working_visualisations_from_spritesheet({
					always_draw = true,
					secondary_draw_order = -1,
					animation = {
						layers = pumpjack_base_visualisations(true),
					},
				}),
			},
		}
	end

	::continue::
end
