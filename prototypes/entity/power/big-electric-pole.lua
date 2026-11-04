-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local ElectricPoleBig = require("__reskins-assets-api__.assets.base.entities.electric-pole-big")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.poles) then
	return
end

local entities = {
	["big-electric-pole"] = { tier = 1, prog_tier = 2 },
	["bob-big-electric-pole-2"] = { tier = 2, prog_tier = 3 },
	["bob-big-electric-pole-3"] = { tier = 3, prog_tier = 4 },
	["bob-big-electric-pole-4"] = { tier = 4, prog_tier = 5 },
}

local TYPE = "electric-pole"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = ElectricPoleBig.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = ElectricPoleBig.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
