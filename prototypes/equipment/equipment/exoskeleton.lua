-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentExoskeleton = require("__reskins-assets-api__.assets.base.items.equipment-exoskeleton")
local EquipmentExoskeletonSprites = require("__reskins-assets-api__.assets.base.equipment.equipment-exoskeleton")

local exoskeletons = {
	["exoskeleton-equipment"] = { tier = 1, prog_tier = 2 },
	["bob-exoskeleton-equipment-2"] = { tier = 2, prog_tier = 3 },
	["bob-exoskeleton-equipment-3"] = { tier = 3, prog_tier = 4 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(exoskeletons) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentExoskeleton.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(exoskeletons) do
	local equipment = data.raw["movement-bonus-equipment"][name]
	if not equipment then
		goto continue
	end

	Applicators.apply_sprite_set(equipment, EquipmentExoskeletonSprites.get_sprite_set({ tint = options.tint }))

	::continue::
end
