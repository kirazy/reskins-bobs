-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not mods["bobvehicleequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local EquipmentBeltImmunity = require("__reskins-assets-api__.assets.base.equipment.equipment-belt-immunity")

local name = "bob-vehicle-belt-immunity-equipment"

_framework.tiers.assign_icons_with_tier_labels("item", {
	[name] = {
		composition = EquipmentBeltImmunity.get_icon_composition()
			:add(_assets.icons.equipment_background_group, _assets.icons.get_equipment_background_layer("utility"))
			:outline(),
	},
})

local equipment = data.raw["belt-immunity-equipment"][name]
if equipment then
	Applicators.apply_sprite_set(equipment, EquipmentBeltImmunity.get_sprite_set())
end
