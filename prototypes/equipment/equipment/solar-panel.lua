-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentSolarPanel = require("__reskins-assets-api__.assets.base.items.equipment-solar-panel")
local EquipmentSolarPanelSprites = require("__reskins-assets-api__.assets.base.equipment.equipment-solar-panel")

local solar_panels = {
	["solar-panel-equipment"] = { tier = 1, prog_tier = 2 },
	["bob-solar-panel-equipment-2"] = { tier = 2, prog_tier = 3 },
	["bob-solar-panel-equipment-3"] = { tier = 3, prog_tier = 4 },
	["bob-solar-panel-equipment-4"] = { tier = 4, prog_tier = 5 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(solar_panels) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentSolarPanel.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(solar_panels) do
	local equipment = data.raw["solar-panel-equipment"][name]
	if not equipment then
		goto continue
	end

	Applicators.apply_sprite_set(equipment, EquipmentSolarPanelSprites.get_sprite_set({ tint = options.tint }))

	::continue::
end
