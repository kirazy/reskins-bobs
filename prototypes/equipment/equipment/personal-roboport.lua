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

local EquipmentPersonalRoboport1 = require("__reskins-assets-api__.assets.base.items.equipment-personal-roboport-1")
local EquipmentPersonalRoboport2 = require("__reskins-assets-api__.assets.base.items.equipment-personal-roboport-2")

local personal_roboports = {
	["personal-roboport-equipment"] = { module = EquipmentPersonalRoboport1, tier = 1, prog_tier = 2, base = 1 },
	["personal-roboport-mk2-equipment"] = { module = EquipmentPersonalRoboport1, tier = 2, prog_tier = 3, base = 1 },
	["bob-personal-roboport-mk3-equipment"] = { module = EquipmentPersonalRoboport2, tier = 3, prog_tier = 4, base = 2 },
	["bob-personal-roboport-mk4-equipment"] = { module = EquipmentPersonalRoboport2, tier = 4, prog_tier = 5, base = 2 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(personal_roboports) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = options.module.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(personal_roboports) do
	local equipment = data.raw["roboport-equipment"][name]
	if not equipment then
		goto continue
	end

	local equipment_path = "personal-roboport-" .. options.base

	equipment.sprite = {
		layers = {
			-- Base
			{
				--stylua: ignore
				filename = "__reskins-bobs__/graphics/equipment/equipment/personal-roboport/" .. equipment_path .. "-equipment-base.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				--stylua: ignore
				filename = "__reskins-bobs__/graphics/equipment/equipment/personal-roboport/" .. equipment_path .. "-equipment-mask.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				--stylua: ignore
				filename = "__reskins-bobs__/graphics/equipment/equipment/personal-roboport/" .. equipment_path .. "-equipment-highlights.png",
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
