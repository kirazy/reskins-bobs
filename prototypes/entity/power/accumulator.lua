-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Accumulator = require("__reskins-assets-api__.assets.base.entities.accumulator")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.accumulators) then
	return
end

local variant_to_letter_map = {
	["high-capacity"] = "H",
	["slow"] = "S",
	["fast"] = "F",
}

local entities = {
	["accumulator"] = {
		tier = 1,
		prog_tier = 2,
		variant = "high-capacity",
		get_icon = Accumulator.get_high_capacity_icon,
	},
	["bob-large-accumulator-2"] = {
		tier = 2,
		prog_tier = 3,
		variant = "high-capacity",
		get_icon = Accumulator.get_high_capacity_icon,
	},
	["bob-large-accumulator-3"] = {
		tier = 3,
		prog_tier = 4,
		variant = "high-capacity",
		get_icon = Accumulator.get_high_capacity_icon,
	},
	["bob-slow-accumulator"] = {
		tier = 1,
		prog_tier = 2,
		variant = "slow",
		get_icon = Accumulator.get_slow_icon,
	},
	["bob-slow-accumulator-2"] = {
		tier = 2,
		prog_tier = 3,
		variant = "slow",
		get_icon = Accumulator.get_slow_icon,
	},
	["bob-slow-accumulator-3"] = {
		tier = 3,
		prog_tier = 4,
		variant = "slow",
		get_icon = Accumulator.get_slow_icon,
	},
	["bob-fast-accumulator"] = {
		tier = 1,
		prog_tier = 2,
		variant = "fast",
		get_icon = Accumulator.get_fast_icon,
	},
	["bob-fast-accumulator-2"] = {
		tier = 2,
		prog_tier = 3,
		variant = "fast",
		get_icon = Accumulator.get_fast_icon,
	},
	["bob-fast-accumulator-3"] = {
		tier = 3,
		prog_tier = 4,
		variant = "fast",
		get_icon = Accumulator.get_fast_icon,
	},
}

local TYPE = "accumulator"
local BASE_ENTITY_NAME = "accumulator"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
		tint = tint,
		particles = {
			["medium"] = 2,
			["small"] = 3,
		},
	})

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	local sprite_set = Accumulator.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_data = _sprite_utils.icons.compose_icons(
		"default",
		options.get_icon({ tint = tint }),
		_assets.icons.get_letter(variant_to_letter_map[options.variant], tint)
	)
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
