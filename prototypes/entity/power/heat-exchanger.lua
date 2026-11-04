-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local HeatExchanger = require("__reskins-assets-api__.assets.base.entities.heat-exchanger")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.steam) then
	return
end

local entities = {
	["heat-exchanger"] = {
		tier = 1,
		prog_tier = 2,
		pipe_material = "base",
	},
	["bob-heat-exchanger-2"] = {
		tier = 2,
		prog_tier = 3,
		pipe_material = "aluminum-invar",
	},
	["bob-heat-exchanger-3"] = {
		tier = 3,
		prog_tier = 4,
		pipe_material = "silver-titanium",
	},
	["bob-heat-exchanger-4"] = {
		tier = 4,
		prog_tier = 5,
		pipe_material = "gold-copper",
	},
}

local TYPE = "boiler"
local BASE_ENTITY_NAME = "heat-exchanger"

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
			["big"] = 3,
		},
	})

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	local sprite_set = HeatExchanger.get_sprite_set({
		tint = tint,
		pipe_material = options.pipe_material,
	})
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_data = HeatExchanger.get_icon({
		tint = tint,
		pipe_material = options.pipe_material,
	})
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
