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
local EquipmentNightVision = require("__reskins-assets-api__.assets.base.items.equipment-night-vision")
local EquipmentNightVisionSprites = require("__reskins-assets-api__.assets.base.equipment.equipment-night-vision")

local night_vision = {
	["night-vision-equipment"] = { tier = 1, prog_tier = 2 },
	["bob-night-vision-equipment-2"] = { tier = 2, prog_tier = 3 },
	["bob-night-vision-equipment-3"] = { tier = 3, prog_tier = 5 },
}

local TYPE = "night-vision-equipment"

for name, options in pairs(night_vision) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, EquipmentNightVisionSprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = EquipmentNightVision.get_icon_composition({ tint = tint }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
