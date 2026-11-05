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

local EquipmentNightVision = require("__reskins-assets-api__.assets.base.items.equipment-night-vision")

local night_vision = {
	["night-vision-equipment"] = { tier = 1, prog_tier = 2 },
	["bob-night-vision-equipment-2"] = { tier = 2, prog_tier = 3 },
	["bob-night-vision-equipment-3"] = { tier = 3, prog_tier = 5 },
}

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(night_vision) do
	local tier = _framework.tiers.get_tier(options)

	options.tint = _framework.tiers.get_tint(tier)
	items[name] = { composition = EquipmentNightVision.get_icon_composition({ tint = options.tint }), tier = tier }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Reskin the equipment.
for name, options in pairs(night_vision) do
	local equipment = data.raw["night-vision-equipment"][name]
	if not equipment then
		goto continue
	end

	equipment.sprite = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/equipment/night-vision-equipment.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/night-vision/night-vision-equipment-mask.png",
				size = 128,
				priority = "medium",
				flags = { "no-crop" },
				tint = options.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/equipment/equipment/night-vision/night-vision-equipment-highlights.png",
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
