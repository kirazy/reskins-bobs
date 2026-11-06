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
local EquipmentVehicleFissionCell = require("__reskins-assets-api__.assets.bobs.items.equipment-vehicle-fission-cell")
local EquipmentVehicleFissionCellSprites =
	require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-fission-cell")

local fusion_cells = {
	["bob-vehicle-fission-cell-equipment-1"] = { tier = 1 },
	["bob-vehicle-fission-cell-equipment-2"] = { tier = 2 },
	["bob-vehicle-fission-cell-equipment-3"] = { tier = 3 },
	["bob-vehicle-fission-cell-equipment-4"] = { tier = 4 },
	["bob-vehicle-fission-cell-equipment-5"] = { tier = 5 },
	["bob-vehicle-fission-cell-equipment-6"] = { tier = 6 },
}

local TYPE = "generator-equipment"

for name, options in pairs(fusion_cells) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, EquipmentVehicleFissionCellSprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentVehicleFissionCell.get_icon_composition({ tint = tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("energy"))
			:outline(),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
