-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not mods["bobvehicleequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentVehicleEngineSprites = require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-engine")
local EquipmentVehicleMotorSprites = require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-motor")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")

local mobility = {
	["bob-vehicle-engine-equipment"] = {
		get_icon_composition = Icons.get_vehicle_engine_icon_composition,
		get_sprite_set = EquipmentVehicleEngineSprites.get_sprite_set,
	},
	["bob-vehicle-motor-equipment"] = {
		get_icon_composition = Icons.get_vehicle_motor_icon_composition,
		get_sprite_set = EquipmentVehicleMotorSprites.get_sprite_set,
	},
}

local TYPE = "movement-bonus-equipment"

for name, options in pairs(mobility) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	Applicators.apply_sprite_set(equipment, options.get_sprite_set())

	local composition = options.get_icon_composition()
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		name = equipment.name,
		type_name = "item",
		composition = composition
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
