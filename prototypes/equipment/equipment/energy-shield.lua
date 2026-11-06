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
local EquipmentEnergyShield1 = require("__reskins-assets-api__.assets.base.items.equipment-energy-shield-1")
local EquipmentEnergyShield1Sprites = require("__reskins-assets-api__.assets.base.equipment.equipment-energy-shield-1")

local batteries = {
	["energy-shield-equipment"] = { tier = 1 },
	["energy-shield-mk2-equipment"] = { tier = 2 },
	["bob-energy-shield-mk3-equipment"] = { tier = 3 },
	["bob-energy-shield-mk4-equipment"] = { tier = 4 },
	["bob-energy-shield-mk5-equipment"] = { tier = 5 },
	["bob-energy-shield-mk6-equipment"] = { tier = 6 },
}

local TYPE = "energy-shield-equipment"

for name, options in pairs(batteries) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, EquipmentEnergyShield1Sprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentEnergyShield1.get_icon_composition({ tint = tint }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
