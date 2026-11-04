-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Distillery = require("__reskins-assets-api__.assets.bobs.entities.distillery")

if not mods["bobassembly"] and not mods["bobplates"] then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.assembly.entities) then
	return
end

local entities = {
	["bob-distillery"] = { tier = 1, prog_tier = 1 },
	["bob-distillery-2"] = { tier = 2, prog_tier = 2 },
	["bob-distillery-3"] = { tier = 3, prog_tier = 3 },
	["bob-distillery-4"] = { tier = 4, prog_tier = 4 },
	["bob-distillery-5"] = { tier = 5, prog_tier = 5 },
}

local BASE_ENTITY_NAME = "steel-furnace"

for name, options in pairs(entities) do
	local entity = data.raw["furnace"][name] or data.raw["assembling-machine"][name]
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

	entity.corpse = "medium-remnants"

	local sprite_set = Distillery.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set, { scale = 0.5 })

	local icon_data = Distillery.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
