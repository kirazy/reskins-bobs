-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local ReinforcedWall = require("__reskins-assets-api__.assets.bobs.entities.reinforced-wall")

if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then
	return
end

local entity = data.raw["wall"]["bob-reinforced-wall"]
if not entity then
	return
end

local BASE_ENTITY_NAME = "wall"

local particle_tints = {
	["tiny-stone"] = util.color("#a793bf") --[[@as Color]],
	["small-stone"] = util.color("#a793bf") --[[@as Color]],
	["medium-stone"] = util.color("#9584ab") --[[@as Color]],
}

local particles = {
	["tiny-stone"] = 3,
	["small-stone"] = 2,
	["medium-stone"] = 1,
}

_lib.create_explosion(entity.name, {
	base_entity_name = BASE_ENTITY_NAME,
	type = entity.type,
})

for particle, key in pairs(particles) do
	_lib.create_particle(entity.name, BASE_ENTITY_NAME, _lib.particle_index[particle], key, particle_tints[particle])
end

local corpse = _lib.create_remnant(entity.name, {
	base_entity_name = BASE_ENTITY_NAME,
	type = entity.type,
})

local sprite_set = ReinforcedWall.get_sprite_set()
Applicators.apply_sprite_set(entity, sprite_set)
Applicators.apply_sprite_set(corpse, sprite_set)

local icon_data = ReinforcedWall.get_icon()
local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
	tier = 0,
	name = entity.name,
	type_name = entity.type,
	icon_data = icon_data,
})
_sprite_utils.icons.apply_icon_assignment(icon_assignment)
