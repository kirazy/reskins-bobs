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
local EquipmentNightVision = require("__reskins-assets-api__.assets.base.items.equipment-night-vision")
local EquipmentNightVisionSprites = require("__reskins-assets-api__.assets.base.equipment.equipment-night-vision")

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

	Applicators.apply_sprite_set(equipment, EquipmentNightVisionSprites.get_sprite_set({ tint = options.tint }))

	::continue::
end
