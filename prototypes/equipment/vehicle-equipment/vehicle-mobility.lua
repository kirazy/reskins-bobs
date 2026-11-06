-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not mods["bobvehicleequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentVehicleEngineSprites = require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-engine")
local EquipmentVehicleMotorSprites = require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-motor")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")

_framework.tiers.assign_icons_with_tier_labels("item", {
	["bob-vehicle-engine-equipment"] = {
		composition = Icons.get_vehicle_engine_icon_composition()
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
	},
	["bob-vehicle-motor-equipment"] = {
		composition = Icons.get_vehicle_motor_icon_composition()
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
	},
})

local sprites = {
	["bob-vehicle-engine-equipment"] = EquipmentVehicleEngineSprites,
	["bob-vehicle-motor-equipment"] = EquipmentVehicleMotorSprites,
}

-- Reskin the equipment.
for name, module in pairs(sprites) do
	local equipment = data.raw["movement-bonus-equipment"][name]
	if equipment then
		Applicators.apply_sprite_set(equipment, module.get_sprite_set())
	end
end
