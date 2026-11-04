-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Centrifuge = require("__reskins-assets-api__.assets.base.entities.centrifuge")

if not (reskins.bobs and reskins.bobs.triggers.assembly.entities) then
	return
end

-- Flag available for Mini-Machines compatibility pass
if reskins.compatibility then
	reskins.compatibility.triggers.minimachines.centrifuges = true
end

local entities = {
	["centrifuge"] = { tier = 1, prog_tier = 3 },
	["bob-centrifuge-2"] = { tier = 2, prog_tier = 4 },
	["bob-centrifuge-3"] = { tier = 3, prog_tier = 5 },
}

local TYPE = "assembling-machine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	-- Bob's mods tint the glow of the centrifuge by recipe, which the base game does not; the sprite set replaces the
	-- graphics set, so the recipe tints are restored after it is applied.
	local default_recipe_tint = entity.graphics_set and entity.graphics_set.default_recipe_tint

	local sprite_set = Centrifuge.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	if default_recipe_tint then
		entity.graphics_set.default_recipe_tint = default_recipe_tint
		for _, visualisation in pairs(entity.graphics_set.working_visualisations or {}) do
			visualisation.apply_recipe_tint = "primary"
		end
	end

	local icon_data = Centrifuge.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
