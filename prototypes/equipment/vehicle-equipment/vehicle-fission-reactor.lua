-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.vehicle_equipment.equipment) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

local EquipmentFissionReactor = require("__reskins-assets-api__.assets.bobs.items.equipment-fission-reactor")

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

	equipment.sprite = {
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-fission-reactor/vehicle-fission-reactor-equipment-base.png",
				width = 128,
				height = 256,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-fission-reactor/vehicle-fission-reactor-equipment-mask.png",
				width = 128,
				height = 256,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-fission-reactor/vehicle-fission-reactor-equipment-highlights.png",
				width = 128,
				height = 256,
				priority = "medium",
				flags = { "no-crop" },
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
		},
	}

	::continue::
end
