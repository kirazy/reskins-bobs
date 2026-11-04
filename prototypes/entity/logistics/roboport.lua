-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Roboport = require("__reskins-assets-api__.assets.base.entities.roboport")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "roboport",
	icon_name = "roboport",
	base_entity_name = "roboport",
	mod = "bobs",
	group = "logistics",
	particles = { ["medium"] = 2 },
}

local entities = {
	["roboport"] = { tier = 1, prog_tier = 2, variant_index = 1 },
	["bob-roboport-2"] = { tier = 2, prog_tier = 3, variant_index = 2 },
	["bob-roboport-3"] = { tier = 3, prog_tier = 4, variant_index = 3 },
	["bob-roboport-4"] = { tier = 4, prog_tier = 5, variant_index = 4 },
}

local TYPE = "roboport"
local BASE_ENTITY_NAME = "roboport"

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

	local sprite_set = Roboport.get_sprite_set({
		tint = tint,
		antenna_variant = options.variant_index,
		door_variant = options.variant_index,
	})
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_data = Roboport.get_tier_icon({
		tint = tint,
		tier = options.variant_index,
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
