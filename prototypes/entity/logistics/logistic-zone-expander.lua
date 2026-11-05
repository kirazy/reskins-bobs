-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local RoboZoneExpander = require("__reskins-assets-api__.assets.bobs.entities.robo-zone-expander")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

local entities = {
	["bob-logistic-zone-expander"] = { tier = 1, prog_tier = 2, variant_index = 1 },
	["bob-logistic-zone-expander-2"] = { tier = 2, prog_tier = 3, variant_index = 2 },
	["bob-logistic-zone-expander-3"] = { tier = 3, prog_tier = 4, variant_index = 3 },
	["bob-logistic-zone-expander-4"] = { tier = 4, prog_tier = 5, variant_index = 4 },
}

local TYPE = "roboport"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = RoboZoneExpander.get_sprite_set({ tint = tint, tier = options.variant_index })
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = RoboZoneExpander.get_icon_composition({ tint = tint, tier = options.variant_index })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
