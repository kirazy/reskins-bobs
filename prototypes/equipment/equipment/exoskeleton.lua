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

local EquipmentExoskeleton = require("__reskins-assets-api__.assets.base.items.equipment-exoskeleton")

local exoskeletons = {
	["exoskeleton-equipment"] = { tier = 1, prog_tier = 2 },
	["bob-exoskeleton-equipment-2"] = { tier = 2, prog_tier = 3 },
	["bob-exoskeleton-equipment-3"] = { tier = 3, prog_tier = 4 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(exoskeletons) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentExoskeleton.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(exoskeletons) do
	local equipment = data.raw["movement-bonus-equipment"][name]
	if not equipment then
		goto continue
	end

	equipment.sprite = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/equipment/exoskeleton-equipment.png",
				width = 128,
				height = 256,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/exoskeleton/exoskeleton-equipment-mask.png",
				width = 128,
				height = 256,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/exoskeleton/exoskeleton-equipment-highlights.png",
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
