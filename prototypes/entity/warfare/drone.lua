-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Drone = require("__reskins-assets-api__.assets.bobs.entities.drone")

if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then
	return
end

local entities = {
	["bob-robot-gun-drone"] = {
		tint = util.color("#f2f230") --[[@as Color]],
		rotation_speed = 0.015,
		attack_parameters = {
			projectile_center = { 0, 5 },
			projectile_creation_distance = 0.2,
		},
	},
	["bob-robot-laser-drone"] = {
		tint = util.color("#30f271") --[[@as Color]],
		rotation_speed = 0.015,
		attack_parameters = {
			source_offset = { 0, -0.5 },
		},
	},
	["bob-robot-flamethrower-drone"] = {
		tint = util.color("#f25730") --[[@as Color]],
		rotation_speed = 0.015,
		attack_parameters = {
			gun_center_shift = { 0, -0.5 },
		},
	},
	["bob-robot-plasma-drone"] = {
		tint = util.color("#30a5f2") --[[@as Color]],
		rotation_speed = 0.007,
		attack_parameters = {
			projectile_center = { 0, -0.5 },
			projectile_creation_distance = 0,
		},
	},
}

local TYPE = "unit"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	---@diagnostic disable-next-line: assign-type-mismatch
	entity.attack_parameters = util.merge({ entity.attack_parameters, options.attack_parameters })
	entity.rotation_speed = options.rotation_speed

	local sprite_set = Drone.get_sprite_set({ tint = options.tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = Drone.get_icon_composition({ tint = options.tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
