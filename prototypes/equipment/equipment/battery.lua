-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.equipment.equipment) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local EquipmentBattery1 = require("__reskins-assets-api__.assets.base.items.equipment-battery-1")

local batteries = {
	["battery-equipment"] = { tier = 1 },
	["battery-mk2-equipment"] = { tier = 2 },
	["battery-mk3-equipment"] = { tier = 3 },
	["bob-battery-mk4-equipment"] = { tier = 4 },
	["bob-battery-mk5-equipment"] = { tier = 5 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(batteries) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentBattery1.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(batteries) do
	local equipment = data.raw["battery-equipment"][name]
	if not equipment then
		goto continue
	end

	---@type data.Sprite
	equipment.sprite = {
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/battery/battery-equipment-base.png",
				width = 64,
				height = 128,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/battery/battery-equipment-mask.png",
				width = 64,
				height = 128,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/battery/battery-equipment-highlights.png",
				width = 64,
				height = 128,
				priority = "medium",
				flags = { "no-crop" },
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
		},
	}

	::continue::
end
