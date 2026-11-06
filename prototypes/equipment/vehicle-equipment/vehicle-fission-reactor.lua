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
local EquipmentFissionReactor = require("__reskins-assets-api__.assets.bobs.items.equipment-fission-reactor")
local EquipmentVehicleFissionReactorSprites =
	require("__reskins-assets-api__.assets.bobs.equipment.equipment-vehicle-fission-reactor")

local fission_reactors = {
	["bob-vehicle-fission-reactor-equipment-1"] = { tier = 1 },
	["bob-vehicle-fission-reactor-equipment-2"] = { tier = 2 },
	["bob-vehicle-fission-reactor-equipment-3"] = { tier = 3 },
	["bob-vehicle-fission-reactor-equipment-4"] = { tier = 4 },
	["bob-vehicle-fission-reactor-equipment-5"] = { tier = 5 },
	["bob-vehicle-fission-reactor-equipment-6"] = { tier = 6 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(fission_reactors) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = {
		composition = EquipmentFissionReactor.get_icon_composition({ tint = options.tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("energy"))
			:outline(),
		tier = tier,
	}
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(fission_reactors) do
	local equipment = data.raw["generator-equipment"][name]
	if not equipment then
		goto continue
	end

	Applicators.apply_sprite_set(equipment, EquipmentVehicleFissionReactorSprites.get_sprite_set({ tint = options.tint }))

	::continue::
end
