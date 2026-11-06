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
local EquipmentPersonalRoboport1 = require("__reskins-assets-api__.assets.base.items.equipment-personal-roboport-1")
local EquipmentPersonalRoboport1Sprites =
	require("__reskins-assets-api__.assets.base.equipment.equipment-personal-roboport-1")
local EquipmentPersonalRoboport2 = require("__reskins-assets-api__.assets.base.items.equipment-personal-roboport-2")
local EquipmentPersonalRoboport2Sprites =
	require("__reskins-assets-api__.assets.base.equipment.equipment-personal-roboport-2")

local personal_roboports = {
	["personal-roboport-equipment"] = {
		module = EquipmentPersonalRoboport1,
		sprites = EquipmentPersonalRoboport1Sprites,
		tier = 1,
		prog_tier = 2,
	},
	["personal-roboport-mk2-equipment"] = {
		module = EquipmentPersonalRoboport1,
		sprites = EquipmentPersonalRoboport1Sprites,
		tier = 2,
		prog_tier = 3,
	},
	["bob-personal-roboport-mk3-equipment"] = {
		module = EquipmentPersonalRoboport2,
		sprites = EquipmentPersonalRoboport2Sprites,
		tier = 3,
		prog_tier = 4,
	},
	["bob-personal-roboport-mk4-equipment"] = {
		module = EquipmentPersonalRoboport2,
		sprites = EquipmentPersonalRoboport2Sprites,
		tier = 4,
		prog_tier = 5,
	},
}

local TYPE = "roboport-equipment"

for name, options in pairs(personal_roboports) do
	local equipment = data.raw[TYPE][name]
	if not equipment then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(equipment, options.sprites.get_sprite_set({ tint = tint }))

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = equipment.name,
		type_name = "item",
		composition = options.module.get_icon_composition({ tint = tint }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
