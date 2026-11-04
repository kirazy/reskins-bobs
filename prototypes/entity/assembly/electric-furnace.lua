-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local FurnaceElectric = require("__reskins-assets-api__.assets.base.entities.furnace-electric")

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and (reskins.bobs.triggers.assembly.entities or reskins.bobs.triggers.plates.entities)) then
	return
end

-- Flag available for Mini-Machines compatibility pass
if reskins.compatibility then
	reskins.compatibility.triggers.minimachines.furnaces = true
end

local entities = {
	-- Standard furnaces
	["electric-furnace"] = {
		type = "furnace",
		variant = "standard",
		tier = 3,
		tint = reskins.bobs.furnace_tint_index.standard,
	},
	["bob-electric-furnace-2"] = {
		type = "furnace",
		variant = "standard",
		tier = 4,
	},
	["bob-electric-furnace-3"] = {
		type = "furnace",
		variant = "standard",
		tier = 5,
	},
	-- Mixing furnace
	["bob-electric-mixing-furnace"] = {
		type = "assembling-machine",
		variant = "mixing",
		tier = 3,
		tint = reskins.bobs.furnace_tint_index.mixing,
	},
	-- Chemical furnace
	["bob-electric-chemical-furnace"] = {
		type = "assembling-machine",
		variant = "chemical",
		tier = 3,
		tint = reskins.bobs.furnace_tint_index.chemical,
	},
	-- Chemical mixing furnaces
	["bob-electric-chemical-mixing-furnace"] = {
		type = "assembling-machine",
		variant = "chemical-mixing",
		tier = 4,
	},
	["bob-electric-chemical-mixing-furnace-2"] = {
		type = "assembling-machine",
		variant = "chemical-mixing",
		tier = 5,
	},
}

-- Angel's Compatibility
if mods["angelssmelting"] then
	-- Use metal-mixing sprites to be consistent with new "Filtering Furnace" progression
	entities["bob-electric-chemical-mixing-furnace"].variant = "mixing"
	entities["bob-electric-chemical-mixing-furnace-2"].variant = "mixing"
end

local BASE_ENTITY_NAME = "electric-furnace"

for name, options in pairs(entities) do
	local entity = data.raw[options.type][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = options.tint or _framework.tiers.get_tint(tier)

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
		tint = tint,
		particles = {
			["big"] = 1,
			["medium"] = 2,
		},
	})

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	local sprite_set = FurnaceElectric.get_sprite_set({
		tint = tint,
		variant = options.variant,
	})
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	entity.fluid_boxes_off_when_no_fluid_recipe = true

	local icon_data = FurnaceElectric.get_icon({
		tint = tint,
		variant = options.variant,
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
