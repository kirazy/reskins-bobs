-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

if not mods["bobvehicleequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentVehiclePlasmaTurret = require("__reskins-assets-api__.assets.bobs.items.equipment-vehicle-plasma-turret")
local EquipmentVehiclePlasmaTurretSprites =
	require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-plasma-turret")

local plasma_turret = {
	["bob-vehicle-big-turret-equipment-1"] = { tier = 1, prog_tier = 3 },
	["bob-vehicle-big-turret-equipment-2"] = { tier = 2, prog_tier = 4 },
	["bob-vehicle-big-turret-equipment-3"] = { tier = 3, prog_tier = 5 },
	["bob-vehicle-big-turret-equipment-4"] = { tier = 4, prog_tier = 6 },
}

local TYPE = "active-defense-equipment"

for name, options in pairs(plasma_turret) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, EquipmentVehiclePlasmaTurretSprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentVehiclePlasmaTurret.get_icon_composition({ tint = tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("offense"))
			:outline(),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
