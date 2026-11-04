-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local RoboChargePort = require("__reskins-assets-api__.assets.bobs.entities.robo-charge-port")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

local entities = {
	["bob-robo-charge-port"] = { tier = 1, prog_tier = 2, variant_index = 1, variant = "standard" },
	["bob-robo-charge-port-2"] = { tier = 2, prog_tier = 3, variant_index = 2, variant = "standard" },
	["bob-robo-charge-port-3"] = { tier = 3, prog_tier = 4, variant_index = 3, variant = "standard" },
	["bob-robo-charge-port-4"] = { tier = 4, prog_tier = 5, variant_index = 4, variant = "standard" },
	["bob-robo-charge-port-large"] = { tier = 1, prog_tier = 2, variant_index = 1, variant = "large" },
	["bob-robo-charge-port-large-2"] = { tier = 2, prog_tier = 3, variant_index = 2, variant = "large" },
	["bob-robo-charge-port-large-3"] = { tier = 3, prog_tier = 4, variant_index = 3, variant = "large" },
	["bob-robo-charge-port-large-4"] = { tier = 4, prog_tier = 5, variant_index = 4, variant = "large" },
}

-- The standard charge port has a 2 by 2 grid of pads, and the large charge port has a 3 by 3 grid of pads.
local pad_positions = {
	standard = {
		{ -0.5, -0.5 },
		{ 0.5, -0.5 },
		{ -0.5, 0.5 },
		{ 0.5, 0.5 },
	},
	large = {
		{ -1, 1 },
		{ 0, 1 },
		{ 1, 1 },
		{ -1, 0 },
		{ 0, 0 },
		{ 1, 0 },
		{ -1, -1 },
		{ 0, -1 },
		{ 1, -1 },
	},
}

local TYPE = "roboport"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = RoboChargePort.get_sprite_set({
		tint = tint,
		tier = options.variant_index,
		pad_positions = pad_positions[options.variant],
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local get_icon = options.variant == "large" and RoboChargePort.get_large_icon or RoboChargePort.get_icon
	local icon_data = get_icon({
		tint = tint,
		tier = options.variant_index,
	})
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
