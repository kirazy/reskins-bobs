-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local RoboZoneInterface = require("__reskins-assets-api__.assets.bobs.entities.robo-zone-interface")

if not mods["boblogistics"] then
	return
end

local entity = data.raw["roboport"]["bob-logistic-zone-interface"]
if not entity then
	return
end

local sprite_set = RoboZoneInterface.get_sprite_set()
Applicators.apply_sprite_set(entity, sprite_set)

local composition = RoboZoneInterface.get_icon_composition()
local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
	tier = 0,
	name = entity.name,
	type_name = entity.type,
	composition = composition,
})
_sprite_utils.icons.apply_icon_assignment(icon_assignment)
