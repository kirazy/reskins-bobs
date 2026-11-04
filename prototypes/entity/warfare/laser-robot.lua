-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local LaserRobot = require("__reskins-assets-api__.assets.bobs.entities.robot-laser")

if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then
	return
end

local entity = data.raw["combat-robot"]["bob-laser-robot-entity"]
if not entity then
	return
end

_lib.create_explosions_and_particles(entity.name, {
	base_entity_name = "defender-robot",
	type = entity.type,
	tint = util.color("#7f4eca"),
	particles = {
		["small"] = 3,
	},
})

local corpse = _lib.create_remnant(entity.name, {
	base_entity_name = "defender",
	type = entity.type,
})

-- Robots generate this indirectly.
entity.corpse = nil

local sprite_set = LaserRobot.get_sprite_set()
Applicators.apply_sprite_set(entity, sprite_set)
Applicators.apply_sprite_set(corpse, sprite_set)

_lib.configure_robot_death_animation(entity, corpse.name)

local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
	tier = 0,
	name = entity.name,
	type_name = entity.type,
	icon_data = LaserRobot.get_icon(),
})

_sprite_utils.icons.apply_icon_assignment(icon_assignment)
