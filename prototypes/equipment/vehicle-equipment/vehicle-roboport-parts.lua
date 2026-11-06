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
local EquipmentVehiclePartAntenna = require("__reskins-assets-api__.assets.bobs.items.equipment-vehicle-part-antenna")
local EquipmentVehiclePartAntennaSprites =
	require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-part-antenna")
local EquipmentVehiclePartChargePad =
	require("__reskins-assets-api__.assets.bobs.items.equipment-vehicle-part-charge-pad")
local EquipmentVehiclePartChargePadSprites =
	require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-part-charge-pad")
local EquipmentVehiclePartRobot = require("__reskins-assets-api__.assets.bobs.items.equipment-vehicle-part-robot")
local EquipmentVehiclePartRobotSprites =
	require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-part-robot")

local categories = {
	"robot",
	"chargepad",
	"antenna",
}

local properties = {
	{ suffix = "", tier = 1, prog_tier = 2 },
	{ suffix = "-2", tier = 2, prog_tier = 3 },
	{ suffix = "-3", tier = 3, prog_tier = 4 },
	{ suffix = "-4", tier = 4, prog_tier = 5 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for index, map in pairs(properties) do
	local tier = _framework.tiers.get_tier(map)

	map.tint = _framework.tiers.get_tint(tier)
	items["bob-vehicle-roboport-robot-equipment" .. map.suffix] = {
		composition = EquipmentVehiclePartRobot.get_icon_composition({ tint = map.tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
		tier = tier,
	}
	items["bob-vehicle-roboport-chargepad-equipment" .. map.suffix] = {
		composition = EquipmentVehiclePartChargePad.get_icon_composition({ tier = index, tint = map.tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
		tier = tier,
	}
	items["bob-vehicle-roboport-antenna-equipment" .. map.suffix] = {
		composition = EquipmentVehiclePartAntenna.get_icon_composition({ tier = index, tint = map.tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
		tier = tier,
	}
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for _, category in pairs(categories) do
	for index, map in pairs(properties) do
		local name = "bob-vehicle-roboport-" .. category .. "-equipment" .. map.suffix

		local equipment = data.raw["roboport-equipment"][name]
		if not equipment then
			goto continue
		end

		local sprite_set
		if category == "robot" then
			sprite_set = EquipmentVehiclePartRobotSprites.get_sprite_set({ tint = map.tint })
		elseif category == "chargepad" then
			sprite_set = EquipmentVehiclePartChargePadSprites.get_sprite_set({ tier = index, tint = map.tint })
		else
			sprite_set = EquipmentVehiclePartAntennaSprites.get_sprite_set({ tier = index, tint = map.tint })
		end

		Applicators.apply_sprite_set(equipment, sprite_set)

		::continue::
	end
end
