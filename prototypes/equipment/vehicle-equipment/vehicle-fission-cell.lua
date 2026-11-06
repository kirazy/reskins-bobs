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

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(fusion_cells) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = {
		composition = EquipmentVehicleFissionCell.get_icon_composition({ tint = options.tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("energy"))
			:outline(),
		tier = tier,
	}
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(fusion_cells) do
	local equipment = data.raw["generator-equipment"][name]
	if not equipment then
		goto continue
	end

	Applicators.apply_sprite_set(equipment, EquipmentVehicleFissionCellSprites.get_sprite_set({ tint = options.tint }))

	::continue::
end
