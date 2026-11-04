-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local GeneratorBurner = require("__reskins-assets-api__.assets.bobs.entities.generator-burner")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end

local TYPE = "burner-generator"
local BASE_ENTITY_NAME = "steam-engine"

---@type data.BurnerGeneratorPrototype
local entity = data.raw[TYPE]["bob-burner-generator"]
if not entity then
	return
end

local tier = 0
local tint = util.color("#26262660")

_lib.create_explosions_and_particles(entity.name, {
	base_entity_name = BASE_ENTITY_NAME,
	type = entity.type,
	tint = tint,
	particles = {
		["big"] = 1,
		["medium"] = 2,
	},
})

entity.corpse = "big-remnants"

local sprite_set = GeneratorBurner.get_sprite_set()
Applicators.apply_sprite_set(entity, sprite_set)

-- Handle smoke
entity.burner = util.copy(entity.burner)
entity.burner.smoke = GeneratorBurner.get_smoke({})

local icon_data = GeneratorBurner.get_icon()
local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
	tier = tier,
	name = entity.name,
	type_name = entity.type,
	icon_data = icon_data,
})
_sprite_utils.icons.apply_icon_assignment(icon_assignment)
