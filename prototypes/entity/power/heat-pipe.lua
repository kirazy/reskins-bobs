-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local HeatPipe = require("__reskins-assets-api__.assets.base.entities.heat-pipe")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end

local entities = {
	["heat-pipe"] = {
		tier = 1,
		prog_tier = 2,
		pipe_material = "base",
	},
	["bob-heat-pipe-2"] = {
		tier = 2,
		prog_tier = 3,
		pipe_material = "aluminum-invar",
		particle_colors = { "dff5ff", "a99b84" },
	},
	["bob-heat-pipe-3"] = {
		tier = 3,
		prog_tier = 4,
		pipe_material = "silver-titanium",
		particle_colors = { "d4d4d4", "cfd2d4" },
	},
	["bob-heat-pipe-4"] = {
		tier = 4,
		prog_tier = 5,
		pipe_material = "gold-copper",
		particle_colors = { "d6b968", "ff7f3f" },
	},
}

local TYPE = "heat-pipe"
local BASE_ENTITY_NAME = "heat-pipe"

local do_labels = _framework.settings.get_value("reskins-bobs-do-pipe-tier-labeling") == true

-- Reskin entities, create and assign extra details
for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	-- Setup icons
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = do_labels and _framework.tiers.get_tier(options) or 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = HeatPipe.get_icon({ pipe_material = options.pipe_material }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	--- Don't reskin the base pipes
	if name == "heat-pipe" then
		goto continue
	end

	assert(options.particle_colors)

	-- Create particles and explosions
	_lib.create_explosion(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})
	_lib.create_particle(
		entity.name,
		BASE_ENTITY_NAME,
		_lib.particle_index["small"],
		1,
		util.color(options.particle_colors[1])
	)
	_lib.create_particle(
		entity.name,
		BASE_ENTITY_NAME,
		_lib.particle_index["medium"],
		2,
		util.color(options.particle_colors[2])
	)

	-- Create and skin remnants
	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	-- Reskin entities
	local sprite_set = HeatPipe.get_sprite_set({ pipe_material = options.pipe_material })
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	::continue::
end
