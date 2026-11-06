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
local EquipmentBattery1 = require("__reskins-assets-api__.assets.base.items.equipment-battery-1")
local EquipmentBatterySprites = require("__reskins-assets-api__.assets.base.equipment.equipment-battery")

local batteries = {
	["battery-equipment"] = { tier = 1 },
	["battery-mk2-equipment"] = { tier = 2 },
	["battery-mk3-equipment"] = { tier = 3 },
	["bob-battery-mk4-equipment"] = { tier = 4 },
	["bob-battery-mk5-equipment"] = { tier = 5 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(batteries) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentBattery1.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(batteries) do
	local equipment = data.raw["battery-equipment"][name]
	if not equipment then
		goto continue
	end

	Applicators.apply_sprite_set(equipment, EquipmentBatterySprites.get_sprite_set({ tint = options.tint }))

	::continue::
end
