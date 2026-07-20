-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

-- Check to see if reskinning needs to be done.
if mods["classic-beacon"] or not (reskins.bobs and reskins.bobs.triggers.modules.entities) then
	return
end

-- Flag available for Mini-Machines compatibility pass
if reskins.compatibility then
	reskins.compatibility.triggers.minimachines.beacons = true
end

---@param tint Color
---@return RotatedAnimation
local function get_beacon_remnant_animation(tint)
	local BASE_PATH = "__base__/graphics/entity/beacon/remnants/"
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/beacon/remnants/"

	---@type RotatedAnimation
	return {
		layers = {
			{
				filename = BASE_PATH .. "beacon-remnants.png",
				direction_count = 1,
				width = 212,
				height = 206,
				shift = util.by_pixel(1, 5),
				scale = 0.5,
			},
			{
				filename = ASSETS_BASE_PATH .. "beacon-remnants-mask.png",
				direction_count = 1,
				width = 212,
				height = 206,
				shift = util.by_pixel(1, 5),
				tint = tint,
				scale = 0.5,
			},
			{
				filename = ASSETS_BASE_PATH .. "beacon-remnants-highlights.png",
				direction_count = 1,
				width = 212,
				height = 206,
				shift = util.by_pixel(1, 5),
				blend_mode = "additive-soft",
				scale = 0.5,
			},
		},
	}
end

---@param slot_count 2|4|6
---@param tint Color
---@return AnimationElement
local function get_beacon_base_animation_element(slot_count, tint)
	local BASE_PATH = "__base__/graphics/entity/beacon/"
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/beacon/" .. slot_count .. "-slots/"

	---@type AnimationElement
	return {
		render_layer = "floor-mechanics",
		always_draw = true,
		animation = {
			layers = {
				{
					filename = ASSETS_BASE_PATH .. "beacon-" .. slot_count .. "-slots-bottom-base.png",
					width = 212,
					height = 192,
					scale = 0.5,
					shift = util.by_pixel(0.5, 1),
				},
				{
					filename = ASSETS_BASE_PATH .. "beacon-" .. slot_count .. "-slots-bottom-mask.png",
					width = 212,
					height = 192,
					tint = tint,
					shift = util.by_pixel(0.5, 1),
					scale = 0.5,
				},
				{
					filename = ASSETS_BASE_PATH .. "beacon-" .. slot_count .. "-slots-bottom-highlights.png",
					width = 212,
					height = 192,
					blend_mode = "additive-soft",
					shift = util.by_pixel(0.5, 1),
					scale = 0.5,
				},
				{
					filename = BASE_PATH .. "beacon-shadow.png",
					width = 244,
					height = 176,
					draw_as_shadow = true,
					shift = util.by_pixel(12.5, 0.5),
					scale = 0.5,
				},
			},
		},
	}
end

---@param slot_count 2|4|6
---@return AnimationElement
local function get_beacon_antenna_top_animation_element(slot_count)
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/beacon/" .. slot_count .. "-slots/"

	---@type AnimationElement
	return {
		render_layer = "object",
		always_draw = true,
		animation = {
			filename = ASSETS_BASE_PATH .. "beacon-" .. slot_count .. "-slots-top.png",
			width = 96,
			height = 140,
			scale = 0.5,
			repeat_count = 45,
			animation_speed = 0.5,
			shift = util.by_pixel(3, -19),
		},
	}
end

---@param apply_tint boolean
---@return AnimationElement
local function get_beacon_light_animation_element(apply_tint)
	local BASE_PATH = "__base__/graphics/entity/beacon/"

	---@type AnimationElement
	return {
		render_layer = "object",
		apply_tint = apply_tint,
		always_draw = false,
		animation = {
			filename = BASE_PATH .. "beacon-light.png",
			line_length = 9,
			width = 110,
			height = 186,
			frame_count = 45,
			animation_speed = 0.5,
			blend_mode = "additive",
			shift = util.by_pixel(0.5, -18),
			scale = 0.5,
		},
	}
end

---@return AnimationElement
local function get_4_slot_module_overlay()
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/beacon/4-slots/"

	---@type AnimationElement
	return {
		render_layer = "transport-belt-circuit-connector", -- Above modules, below lights
		animation = {
			layers = {
				{
					filename = ASSETS_BASE_PATH .. "beacon-4-slots-bottom-slot-overlay.png",
					width = 212,
					height = 192,
					shift = util.by_pixel(0.5, 1),
					scale = 0.5,
				},
			},
		},
	}
end

---@param tint Color The tint to apply to the overlay.
---@return AnimationElement
local function get_6_slot_module_overlay(tint)
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/beacon/6-slots/"

	---@type AnimationElement
	return {
		render_layer = "transport-belt-circuit-connector", -- Above modules, below lights
		animation = {
			layers = {
				-- Base
				{
					filename = ASSETS_BASE_PATH .. "/beacon-6-slots-bottom-slot-overlay-base.png",
					width = 212,
					height = 192,
					shift = util.by_pixel(0.5, 1),
					scale = 0.5,
				},
				-- Mask
				{
					filename = ASSETS_BASE_PATH .. "beacon-6-slots-bottom-slot-overlay-mask.png",
					width = 212,
					height = 192,
					tint = tint,
					shift = util.by_pixel(0.5, 1),
					scale = 0.5,
				},
				-- Highlights
				{
					filename = ASSETS_BASE_PATH .. "beacon-6-slots-bottom-slot-overlay-highlights.png",
					width = 212,
					height = 192,
					blend_mode = "additive-soft",
					shift = util.by_pixel(0.5, 1),
					scale = 0.5,
				},
			},
		},
	}
end

---@param num_lights 5|8
---@return ModuleSlotCreatorFn
local function get_tiered_module_slot_1_creator_fn(num_lights)
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/beacon/module-slots/" .. num_lights .. "-lights/"

	---@param shift Vector
	---@param secondary_draw_order int8
	---@return BeaconModuleVisualization[]
	return function(shift, secondary_draw_order)
		---@type BeaconModuleVisualization[]
		return {
			{
				has_empty_slot = true,
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-slot-1.png",
					width = 50,
					height = 66,
					line_length = num_lights + 1,
					variation_count = num_lights + 1,
					shift = util.add_shift(util.by_pixel(-16, 14.5), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "primary",
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-mask-box-1.png",
					width = 36,
					height = 32,
					line_length = num_lights,
					variation_count = num_lights,
					shift = util.add_shift(util.by_pixel(-17, 15), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "secondary",
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-mask-lights-1.png",
					width = 26,
					height = 22,
					line_length = num_lights,
					variation_count = num_lights,
					shift = util.add_shift(util.by_pixel(-18.5, 13), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "secondary",
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-lights-1.png",
					width = 56,
					height = 42,
					line_length = num_lights,
					variation_count = num_lights,
					draw_as_light = true,
					shift = util.add_shift(util.by_pixel(-18, 13), shift),
					scale = 0.5,
				},
			},
		}
	end
end

---@param num_lights 5|8
---@return ModuleSlotCreatorFn
local function get_tiered_module_slot_2_creator_fn(num_lights)
	local ASSETS_BASE_PATH = "__reskins-assets-base__/graphics/entity/beacon/module-slots/" .. num_lights .. "-lights/"

	---@param shift Vector
	---@param secondary_draw_order int8
	---@return BeaconModuleVisualization[]
	return function(shift, secondary_draw_order)
		---@type BeaconModuleVisualization[]
		return {
			{
				has_empty_slot = true,
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-slot-2.png",
					width = 46,
					height = 44,
					line_length = num_lights + 1,
					variation_count = num_lights + 1,
					shift = util.add_shift(util.by_pixel(19, -12), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "primary",
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-mask-box-2.png",
					width = 36,
					height = 28,
					line_length = num_lights,
					variation_count = num_lights,
					shift = util.add_shift(util.by_pixel(20.5, -12), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "secondary",
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-mask-lights-2.png",
					width = 24,
					height = 16,
					line_length = num_lights,
					variation_count = num_lights,
					shift = util.add_shift(util.by_pixel(21.5, -15.5), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "secondary",
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BASE_PATH .. "beacon-module-lights-2.png",
					width = 66,
					height = 46,
					line_length = num_lights,
					variation_count = num_lights,
					draw_as_light = true,
					shift = util.add_shift(util.by_pixel(22, -16), shift),
					scale = 0.5,
				},
			},
		}
	end
end

---@param variant "base"|"productivity"|"quality"
---@return ModuleSlotCreatorFn
local function get_god_module_slot_1_creator_fn(variant)
	local ASSETS_BOBS_PATH = "__reskins-assets-bobs__/graphics/entity/beacon/module-slots/god-modules/"

	---@param shift Vector
	---@param secondary_draw_order int8
	---@return BeaconModuleVisualization[]
	return function(shift, secondary_draw_order)
		---@type BeaconModuleVisualization[]
		return {
			{
				has_empty_slot = true,
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. "" .. variant .. "-module-slot-1.png",
					width = 50,
					height = 66,
					line_length = 2,
					variation_count = 2,
					shift = util.add_shift(util.by_pixel(-16, 14.5), shift),
					scale = 0.5,
				},
			},
			{
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. "base-module-mask-box-1.png",
					width = 36,
					height = 32,
					line_length = 1,
					variation_count = 1,
					shift = util.add_shift(util.by_pixel(-17, 15), shift),
					scale = 0.5,
				},
			},
			{
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. "" .. variant .. "-module-mask-lights-1.png",
					width = 26,
					height = 22,
					line_length = 1,
					variation_count = 1,
					shift = util.add_shift(util.by_pixel(-18.5, 13), shift),
					scale = 0.5,
				},
			},
			{
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. "" .. variant .. "-module-lights-1.png",
					width = 56,
					height = 42,
					line_length = 1,
					variation_count = 1,
					draw_as_light = true,
					shift = util.add_shift(util.by_pixel(-18, 13), shift),
					scale = 0.5,
				},
			},
		}
	end
end

---@param variant "base"|"productivity"|"quality"
---@return ModuleSlotCreatorFn
local function get_god_module_slot_2_creator_fn(variant)
	local ASSETS_BOBS_PATH = "__reskins-assets-bobs__/graphics/entity/beacon/module-slots/god-modules/"

	---@param shift Vector
	---@param secondary_draw_order int8
	---@return BeaconModuleVisualization[]
	return function(shift, secondary_draw_order)
		---@type BeaconModuleVisualization[]
		return {
			{
				has_empty_slot = true,
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. variant .. "-module-slot-2.png",
					width = 46,
					height = 44,
					line_length = 2,
					variation_count = 2,
					shift = util.add_shift(util.by_pixel(19, -12), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "none",
				render_layer = "lower-object",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. "base-module-mask-box-2.png",
					width = 36,
					height = 28,
					line_length = 1,
					variation_count = 1,
					shift = util.add_shift(util.by_pixel(20.5, -12), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "none",
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. variant .. "-module-mask-lights-2.png",
					width = 24,
					height = 16,
					line_length = 1,
					variation_count = 1,
					shift = util.add_shift(util.by_pixel(21.5, -15.5), shift),
					scale = 0.5,
				},
			},
			{
				apply_module_tint = "none",
				render_layer = "lower-object-above-shadow",
				secondary_draw_order = secondary_draw_order,
				pictures = {
					filename = ASSETS_BOBS_PATH .. variant .. "-module-lights-2.png",
					width = 66,
					height = 46,
					line_length = 1,
					variation_count = 1,
					draw_as_light = true,
					shift = util.add_shift(util.by_pixel(22, -16), shift),
					scale = 0.5,
				},
			},
		}
	end
end

---@param shift Vector
---@param secondary_draw_order int8
---@return BeaconModuleVisualization[]
local function create_vanilla_module_slot_1(shift, secondary_draw_order)
	local BASE_PATH = "__base__/graphics/entity/beacon/"

	---@type BeaconModuleVisualization[]
	return {
		{
			has_empty_slot = true,
			render_layer = "lower-object",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-slot-1.png",
				width = 50,
				height = 66,
				line_length = 4,
				variation_count = 4,
				shift = util.add_shift(util.by_pixel(-16, 14.5), shift),
				scale = 0.5,
			},
		},
		{
			apply_module_tint = "primary",
			render_layer = "lower-object",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-mask-box-1.png",
				width = 36,
				height = 32,
				line_length = 3,
				variation_count = 3,
				shift = util.add_shift(util.by_pixel(-17, 15), shift),
				scale = 0.5,
			},
		},
		{
			apply_module_tint = "secondary",
			render_layer = "lower-object-above-shadow",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-mask-lights-1.png",
				width = 26,
				height = 12,
				line_length = 3,
				variation_count = 3,
				shift = util.add_shift(util.by_pixel(-18.5, 13), shift),
				scale = 0.5,
			},
		},
		{
			apply_module_tint = "secondary",
			render_layer = "lower-object-above-shadow",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-lights-1.png",
				width = 56,
				height = 42,
				line_length = 3,
				variation_count = 3,
				draw_as_light = true,
				shift = util.add_shift(util.by_pixel(-18, 13), shift),
				scale = 0.5,
			},
		},
	}
end

---@param shift Vector
---@param secondary_draw_order int8
---@return BeaconModuleVisualization[]
local function create_vanilla_module_slot_2(shift, secondary_draw_order)
	local BASE_PATH = "__base__/graphics/entity/beacon/"

	---@type BeaconModuleVisualization[]
	return {
		{
			has_empty_slot = true,
			render_layer = "lower-object",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-slot-2.png",
				width = 46,
				height = 44,
				line_length = 4,
				variation_count = 4,
				shift = util.add_shift(util.by_pixel(19, -12), shift),
				scale = 0.5,
			},
		},
		{
			apply_module_tint = "primary",
			render_layer = "lower-object",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-mask-box-2.png",
				width = 36,
				height = 26,
				line_length = 3,
				variation_count = 3,
				shift = util.add_shift(util.by_pixel(20.5, -12), shift),
				scale = 0.5,
			},
		},
		{
			apply_module_tint = "secondary",
			render_layer = "lower-object-above-shadow",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-mask-lights-2.png",
				width = 24,
				height = 14,
				line_length = 3,
				variation_count = 3,
				shift = util.add_shift(util.by_pixel(22, -15.5), shift),
				scale = 0.5,
			},
		},
		{
			apply_module_tint = "secondary",
			render_layer = "lower-object-above-shadow",
			secondary_draw_order = secondary_draw_order,
			pictures = {
				filename = BASE_PATH .. "beacon-module-lights-2.png",
				width = 66,
				height = 46,
				line_length = 3,
				variation_count = 3,
				draw_as_light = true,
				shift = util.add_shift(util.by_pixel(22, -16), shift),
				scale = 0.5,
			},
		},
	}
end

-- Set input parameters
local inputs = {
	type = "beacon",
	icon_name = "beacon",
	base_entity_name = "beacon",
	mod = "bobs",
	group = "modules",
	particles = { ["small"] = 3 },
}

local tier_map = {
	["beacon"] = { tier = 1, prog_tier = 3 },
	["bob-beacon-2"] = { tier = 2, prog_tier = 4 },
	["bob-beacon-3"] = { tier = 3, prog_tier = 5 },
}

local supported_module_slots = {
	[2] = 2,
	[4] = 4,
	[6] = 6,
}

---@param module_visualisations? BeaconModuleVisualizations[]
---@param ... string
local function without_art_styles(module_visualisations, ...)
	local art_styles = {}
	for _, art_style in pairs({ ... }) do
		art_styles[art_style] = true
	end

	---@type BeaconModuleVisualizations[]
	local clean_visualisations = {}
	for _, visualisation in pairs(module_visualisations or {}) do
		if not art_styles[visualisation.art_style] then
			clean_visualisations[#clean_visualisations + 1] = visualisation
		end
	end

	return clean_visualisations
end

---Creates the visualization layers for one module slot, shifted by `shift` when provided.
---@alias ModuleSlotCreatorFn fun(shift: Vector, secondary_draw_order: int8): BeaconModuleVisualization[]

---Positional shifts for the slot 1/slot 2 pairs, by supported module slot count.
---@type table<2|4|6, { slot_1: Vector?, slot_2: Vector? }[]>
local shifts_by_slot_count = {
	[2] = {
		{},
	},
	[4] = {
		-- Shifted left and up, below other module slot
		{
			slot_1 = util.by_pixel(-3, -2.5),
			slot_2 = util.by_pixel(-8.5, -5.5),
		},
		-- Shifted right and down, above other module slot
		{
			slot_1 = util.by_pixel(12, 5),
			slot_2 = util.by_pixel(2, 5),
		},
	},
	[6] = {
		-- Shifted left/right and up, below all
		{
			slot_1 = util.by_pixel(-10.5, -11),
			slot_2 = util.by_pixel(7.5, -2),
		},
		-- Shifted left, down/up, middle
		{
			slot_1 = util.by_pixel(-1.5, 7),
			slot_2 = util.by_pixel(-11, -6.5),
		},
		-- Shifted right and down, above all
		{
			slot_1 = util.by_pixel(17, 3),
			slot_2 = util.by_pixel(4.5, 8),
		},
	},
}

---@param slot_count 2|4|6
---@param create_slot_1 ModuleSlotCreatorFn
---@param create_slot_2 ModuleSlotCreatorFn
---@return BeaconModuleVisualization[][]
local function create_module_slots(slot_count, create_slot_1, create_slot_2)
	---@type BeaconModuleVisualization[][]
	local visualisations = {}
	for secondary_draw_order, shifts in pairs(shifts_by_slot_count[slot_count]) do
		visualisations[#visualisations + 1] = create_slot_1(shifts.slot_1 or { 0, 0 }, secondary_draw_order)
		visualisations[#visualisations + 1] = create_slot_2(shifts.slot_2 or { 0, 0 }, secondary_draw_order)
	end

	return visualisations
end

for name, map in pairs(tier_map) do
	local beacon = data.raw[inputs.type][name]
	if not beacon then
		goto continue
	end

	local tier = reskins.lib.tiers.get_tier(map)
	inputs.tint = reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	local remnant = data.raw["corpse"][name .. "-remnants"]
	local remnant_animation = get_beacon_remnant_animation(inputs.tint)
	remnant.animation = make_rotated_animation_variations_from_sheet(2, remnant_animation)

	local slot_count = supported_module_slots[beacon.module_slots] or 2

	beacon.graphics_set = {
		module_icons_suppressed = true,
		animation_progress = 1,
		module_tint_mode = "mix",
		no_modules_tint = { 1, 0, 0 },
		random_animation_offset = true,
		apply_module_tint = "secondary",

		animation_list = {
			get_beacon_base_animation_element(slot_count, inputs.tint),
			get_beacon_antenna_top_animation_element(slot_count),
			get_beacon_light_animation_element(true),
			get_beacon_light_animation_element(false), -- Brighten the light, consistent with base implementation.
		},

		--Ensure that any other art styles than those handled here are retained.
		module_visualisations = beacon.graphics_set and without_art_styles(
			beacon.graphics_set.module_visualisations,
			"vanilla",
			"bob-5-lights",
			"bob-god-base",
			"bob-god-productivity",
			"bob-god-quality"
		) or {} --[[@as (BeaconModuleVisualizations[])]],
	}

	---@cast beacon.graphics_set.animation_list -?
	local animation_list = beacon.graphics_set.animation_list
	if slot_count == 4 then
		animation_list[#animation_list + 1] = get_4_slot_module_overlay()
	elseif slot_count == 6 then
		animation_list[#animation_list + 1] = get_6_slot_module_overlay(inputs.tint)
	end

	---@cast beacon.graphics_set.module_visualisations -?
	local module_visualisations = beacon.graphics_set.module_visualisations
	module_visualisations[#module_visualisations + 1] = {
		art_style = "vanilla",
		use_for_empty_slots = true,
		--stylua: ignore
		slots = create_module_slots(
			slot_count,
			create_vanilla_module_slot_1,
			create_vanilla_module_slot_2
		),
	}

	module_visualisations[#module_visualisations + 1] = {
		art_style = "bob-5-lights",
		slots = create_module_slots(
			slot_count,
			get_tiered_module_slot_1_creator_fn(5),
			get_tiered_module_slot_2_creator_fn(5)
		),
	}
	module_visualisations[#module_visualisations + 1] = {
		art_style = "bob-god-base",
		slots = create_module_slots(
			slot_count,
			get_god_module_slot_1_creator_fn("base"),
			get_god_module_slot_2_creator_fn("base")
		),
	}
	module_visualisations[#module_visualisations + 1] = {
		art_style = "bob-god-productivity",
		slots = create_module_slots(
			slot_count,
			get_god_module_slot_1_creator_fn("productivity"),
			get_god_module_slot_2_creator_fn("productivity")
		),
	}
	module_visualisations[#module_visualisations + 1] = {
		art_style = "bob-god-quality",
		slots = create_module_slots(
			slot_count,
			get_god_module_slot_1_creator_fn("quality"),
			get_god_module_slot_2_creator_fn("quality")
		),
	}

	::continue::
end
