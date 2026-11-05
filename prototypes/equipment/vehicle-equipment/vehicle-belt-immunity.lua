-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not (reskins.bobs and reskins.bobs.triggers.vehicle_equipment.equipment) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

local IconComposition = require("__reskins-sprite-utils__.icon-composition")

local name = "bob-vehicle-belt-immunity-equipment"

-- The icon of the base game has 4 mipmaps.
---@type data.IconData
local icon_datum = { icon = "__base__/graphics/icons/belt-immunity-equipment.png", icon_size = 64 }

_framework.tiers.assign_icons_with_tier_labels("item", {
	[name] = {
		composition = IconComposition:from_icon(icon_datum, nil, nil, 4)
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
	},
})

-- Reskin equipment; fetch the equipment
local equipment = data.raw["belt-immunity-equipment"][name]

-- Check if entity exists, if not, return
if not equipment then
	return
end

-- Reskin equipment
equipment.sprite = {
	filename = "__base__/graphics/equipment/belt-immunity-equipment.png",
	size = 64,
	priority = "medium",
	scale = 0.5,
}
