-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local TurretLaser = require("__reskins-assets-api__.assets.base.entities.turret-laser")

if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then
	return
end

local entities = {
	["laser-turret"] = { tier = 1 },
	["bob-laser-turret-2"] = { tier = 2, lens = "sapphire" },
	["bob-laser-turret-3"] = { tier = 3, lens = "emerald" },
	["bob-laser-turret-4"] = { tier = 4, lens = "topaz" },
	["bob-laser-turret-5"] = { tier = 5, lens = "diamond" },
}

local TYPE = "electric-turret"
local BASE_ENTITY_NAME = "laser-turret"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
		tint = tint,
		particles = {
			["medium"] = 2,
		},
	})

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	local sprite_set = TurretLaser.get_sprite_set({ tint = tint, lens = options.lens })
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_data = TurretLaser.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
