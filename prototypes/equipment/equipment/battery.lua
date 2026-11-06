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
local EquipmentBattery1 = require("__reskins-assets-api__.assets.base.items.equipment-battery-1")
local EquipmentBatterySprites = require("__reskins-assets-api__.assets.base.equipment.equipment-battery")

local batteries = {
	["battery-equipment"] = { tier = 1 },
	["battery-mk2-equipment"] = { tier = 2 },
	["battery-mk3-equipment"] = { tier = 3 },
	["bob-battery-mk4-equipment"] = { tier = 4 },
	["bob-battery-mk5-equipment"] = { tier = 5 },
}

local TYPE = "battery-equipment"

for name, options in pairs(batteries) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, EquipmentBatterySprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentBattery1.get_icon_composition({ tint = tint }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
