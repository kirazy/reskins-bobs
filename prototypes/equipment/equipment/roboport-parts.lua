-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

if not mods["bobequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

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

---Maps each category of roboport part to its icon and sprite set creators. A tiered part draws the artwork for the index
---of its tier.
local categories = {
	robot = {
		get_icon_composition = EquipmentVehiclePartRobot.get_icon_composition,
		get_sprite_set = EquipmentVehiclePartRobotSprites.get_sprite_set,
		is_tiered = false,
	},
	chargepad = {
		get_icon_composition = EquipmentVehiclePartChargePad.get_icon_composition,
		get_sprite_set = EquipmentVehiclePartChargePadSprites.get_sprite_set,
		is_tiered = true,
	},
	antenna = {
		get_icon_composition = EquipmentVehiclePartAntenna.get_icon_composition,
		get_sprite_set = EquipmentVehiclePartAntennaSprites.get_sprite_set,
		is_tiered = true,
	},
}

local properties = {
	{ suffix = "", tier = 1, prog_tier = 2 },
	{ suffix = "-2", tier = 2, prog_tier = 3 },
	{ suffix = "-3", tier = 3, prog_tier = 4 },
	{ suffix = "-4", tier = 4, prog_tier = 5 },
}

local TYPE = "roboport-equipment"

for category, part in pairs(categories) do
	for index, options in pairs(properties) do
		local equipment = data.raw[TYPE]["bob-personal-roboport-" .. category .. "-equipment" .. options.suffix]
		if not equipment then
			goto continue
		end

		local tier = _framework.tiers.get_tier(options)
		local params = { tier = part.is_tiered and index or nil, tint = _framework.tiers.get_tint(tier) }

		Applicators.apply_sprite_set(equipment, part.get_sprite_set(params))

		local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
			tier = tier,
			name = equipment.name,
			type_name = "item",
			composition = part.get_icon_composition(params),
		})
		_sprite_utils.icons.apply_icon_assignment(icon_assignment)

		::continue::
	end
end
