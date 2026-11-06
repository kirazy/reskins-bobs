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

local EquipmentVehicleRoboport = require("__reskins-assets-api__.assets.bobs.items.equipment-vehicle-roboport")

local vehicle_roboports = {
	["bob-vehicle-roboport-equipment-1"] = { tier = 1, prog_tier = 2, base = 1 },
	["bob-vehicle-roboport-equipment-2"] = { tier = 2, prog_tier = 3, base = 2 },
	["bob-vehicle-roboport-equipment-3"] = { tier = 3, prog_tier = 4, base = 3 },
	["bob-vehicle-roboport-equipment-4"] = { tier = 4, prog_tier = 5, base = 4 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(vehicle_roboports) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = {
		composition = EquipmentVehicleRoboport.get_icon_composition({ tier = options.base, tint = options.tint })
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
		tier = tier,
	}
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(vehicle_roboports) do
	local equipment = data.raw["roboport-equipment"][name]
	if not equipment then
		goto continue
	end

	local equipment_path = "vehicle-roboport-" .. options.base

	equipment.sprite = {
		layers = {
			-- Base
			{
				--stylua: ignore
				filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-roboport/" .. equipment_path .. "-equipment-base.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-roboport/vehicle-roboport-equipment-mask.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-roboport/vehicle-roboport-equipment-highlights.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
		},
	}

	::continue::
end
