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
local EquipmentVehicleRoboport = require("__reskins-assets-api__.assets.bobs.items.equipment-vehicle-roboport")
local EquipmentVehicleRoboportSprites =
	require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-roboport")

local vehicle_roboports = {
	["bob-vehicle-roboport-equipment-1"] = { tier = 1, prog_tier = 2, base = 1 },
	["bob-vehicle-roboport-equipment-2"] = { tier = 2, prog_tier = 3, base = 2 },
	["bob-vehicle-roboport-equipment-3"] = { tier = 3, prog_tier = 4, base = 3 },
	["bob-vehicle-roboport-equipment-4"] = { tier = 4, prog_tier = 5, base = 4 },
}

local TYPE = "roboport-equipment"

for name, options in pairs(vehicle_roboports) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(
		equipment,
		EquipmentVehicleRoboportSprites.get_sprite_set({ tier = options.base, tint = tint })
	)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentVehicleRoboport.get_icon_composition({ tier = options.base, tint = tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
