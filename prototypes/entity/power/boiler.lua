-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }
local _pipe_pictures = require("__reskins-assets-api__.assets.base.entities.pipe-pictures")
local _defines = require("__reskins-assets-api__.api.defines")

local Applicators = require("__reskins-assets-api__.api.applicators")
local Boiler = require("__reskins-assets-api__.assets.base.entities.boiler")
local AssemblingMachine = require("__reskins-assets-api__.assets.assorted.entities.assembling-machine-original")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.steam) then
	return
end

local entities = {
	["boiler"] = { tier = 1, prog_tier = 1, get_icon = Boiler.get_icon },
	["bob-boiler-2"] = { tier = 2, prog_tier = 2, get_icon = Boiler.get_icon },
	["bob-boiler-3"] = { tier = 3, prog_tier = 3, get_icon = Boiler.get_icon },
	["bob-boiler-4"] = { tier = 4, prog_tier = 4, get_icon = Boiler.get_icon },
	["bob-boiler-5"] = { tier = 5, prog_tier = 5, get_icon = Boiler.get_icon },
	["bob-oil-boiler"] = { tier = 1, prog_tier = 2, get_icon = Boiler.get_fluid_icon },
	["bob-oil-boiler-2"] = { tier = 2, prog_tier = 3, get_icon = Boiler.get_fluid_icon },
	["bob-oil-boiler-3"] = { tier = 3, prog_tier = 4, get_icon = Boiler.get_fluid_icon },
	["bob-oil-boiler-4"] = { tier = 4, prog_tier = 5, get_icon = Boiler.get_fluid_icon },
}

local TYPE = "boiler"
local BASE_ENTITY_NAME = "boiler"

---@param entity BoilerPrototype
local function strip_light_emissions(entity)
	-- Overwrite any Bob-specific light behavior
	entity.energy_source.light_flicker = {
		color = { 0, 0, 0 },
		minimum_light_size = 0,
		light_intensity_to_size_coefficient = 0,
	}
end

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	strip_light_emissions(entity)

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

	local sprite_set = Boiler.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	if entity.energy_source.fluid_box then
		entity.energy_source.fluid_box.pipe_covers = _pipe_pictures.pipe_covers(_defines.pipe_material.iron)
		entity.energy_source.fluid_box.pipe_picture = AssemblingMachine.get_pipe_pictures({ tint = tint })
	end

	local icon_data = options.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
