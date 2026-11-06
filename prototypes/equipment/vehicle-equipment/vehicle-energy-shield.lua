-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobvehicleequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentEnergyShield2 = require("__reskins-assets-api__.assets.base.items.equipment-energy-shield-2")
local EquipmentEnergyShield2Sprites = require("__reskins-assets-api__.assets.base.equipment.equipment-energy-shield-2")

local vehicle_shield = {
	["bob-vehicle-shield-equipment-1"] = { tier = 1 },
	["bob-vehicle-shield-equipment-2"] = { tier = 2 },
	["bob-vehicle-shield-equipment-3"] = { tier = 3 },
	["bob-vehicle-shield-equipment-4"] = { tier = 4 },
	["bob-vehicle-shield-equipment-5"] = { tier = 5 },
	["bob-vehicle-shield-equipment-6"] = { tier = 6 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(vehicle_shield) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = {
		composition = EquipmentEnergyShield2.get_icon_composition({ tint = options.tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("defense"))
			:outline(),
		tier = tier,
	}
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(vehicle_shield) do
	local equipment = data.raw["energy-shield-equipment"][name]
	if not equipment then
		goto continue
	end

	Applicators.apply_sprite_set(equipment, EquipmentEnergyShield2Sprites.get_sprite_set({ tint = options.tint }))

	::continue::
end
