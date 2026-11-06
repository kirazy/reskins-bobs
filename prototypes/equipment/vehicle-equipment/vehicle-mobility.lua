-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not mods["bobvehicleequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

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

local equipment_list = {
	"vehicle-motor",
	"vehicle-engine",
}

-- Reskin the equipment.
for _, icon_name in pairs(equipment_list) do
	local name = "bob-" .. icon_name .. "-equipment"
	local equipment = data.raw["movement-bonus-equipment"][name]
	if not equipment then
		goto continue
	end

	equipment.sprite = {
		filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/" .. icon_name .. "/" .. name .. ".png",
		size = 128,
		priority = "medium",
		scale = 0.5,
	}

	::continue::
end
