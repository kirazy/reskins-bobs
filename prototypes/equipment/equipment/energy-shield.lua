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

local EquipmentEnergyShield1 = require("__reskins-assets-api__.assets.base.items.equipment-energy-shield-1")

local batteries = {
	["energy-shield-equipment"] = { tier = 1 },
	["energy-shield-mk2-equipment"] = { tier = 2 },
	["bob-energy-shield-mk3-equipment"] = { tier = 3 },
	["bob-energy-shield-mk4-equipment"] = { tier = 4 },
	["bob-energy-shield-mk5-equipment"] = { tier = 5 },
	["bob-energy-shield-mk6-equipment"] = { tier = 6 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(batteries) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentEnergyShield1.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(batteries) do
	local equipment = data.raw["energy-shield-equipment"][name]
	if not equipment then
		goto continue
	end

	equipment.sprite = {
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/energy-shield/energy-shield-equipment-base.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/energy-shield/energy-shield-equipment-mask.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/energy-shield/energy-shield-equipment-highlights.png",
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
