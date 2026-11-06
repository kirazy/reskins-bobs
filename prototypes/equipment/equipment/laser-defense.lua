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

local EquipmentLaserDefense = require("__reskins-assets-api__.assets.base.items.equipment-laser-defense")

local laser_defense = {
	["personal-laser-defense-equipment"] = { tier = 1 },
	["bob-personal-laser-defense-equipment-2"] = { tier = 2 },
	["bob-personal-laser-defense-equipment-3"] = { tier = 3 },
	["bob-personal-laser-defense-equipment-4"] = { tier = 4 },
	["bob-personal-laser-defense-equipment-5"] = { tier = 5 },
	["bob-personal-laser-defense-equipment-6"] = { tier = 6 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(laser_defense) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentLaserDefense.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(laser_defense) do
	local equipment = data.raw["active-defense-equipment"][name]
	if not equipment then
		goto continue
	end

	equipment.sprite = {
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/laser-defense/laser-defense-equipment-base.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/laser-defense/laser-defense-equipment-mask.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/laser-defense/laser-defense-equipment-highlights.png",
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
