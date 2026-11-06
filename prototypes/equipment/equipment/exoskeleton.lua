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
local EquipmentExoskeleton = require("__reskins-assets-api__.assets.base.items.equipment-exoskeleton")
local EquipmentExoskeletonSprites = require("__reskins-assets-api__.assets.base.equipment.equipment-exoskeleton")

local exoskeletons = {
	["exoskeleton-equipment"] = { tier = 1, prog_tier = 2 },
	["bob-exoskeleton-equipment-2"] = { tier = 2, prog_tier = 3 },
	["bob-exoskeleton-equipment-3"] = { tier = 3, prog_tier = 4 },
}

local TYPE = "movement-bonus-equipment"

for name, options in pairs(exoskeletons) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, EquipmentExoskeletonSprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentExoskeleton.get_icon_composition({ tint = tint }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
