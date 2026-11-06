-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

if not mods["bobequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentLaserDefense = require("__reskins-assets-api__.assets.base.items.equipment-laser-defense")
local EquipmentLaserDefenseSprites = require("__reskins-assets-api__.assets.base.equipment.equipment-laser-defense")

local laser_defense = {
	["personal-laser-defense-equipment"] = { tier = 1 },
	["bob-personal-laser-defense-equipment-2"] = { tier = 2 },
	["bob-personal-laser-defense-equipment-3"] = { tier = 3 },
	["bob-personal-laser-defense-equipment-4"] = { tier = 4 },
	["bob-personal-laser-defense-equipment-5"] = { tier = 5 },
	["bob-personal-laser-defense-equipment-6"] = { tier = 6 },
}

local TYPE = "active-defense-equipment"

for name, options in pairs(laser_defense) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, EquipmentLaserDefenseSprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentLaserDefense.get_icon_composition({ tint = tint }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
