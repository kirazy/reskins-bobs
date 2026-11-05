-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local ArtilleryWagon = require("__reskins-assets-api__.assets.base.entities.train-artillery-wagon")

if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then
	return
end

local entities = {
	["artillery-wagon"] = { tier = 1, prog_tier = 3 },
	["bob-artillery-wagon-2"] = { tier = 2, prog_tier = 4 },
	["bob-artillery-wagon-3"] = { tier = 3, prog_tier = 5 },
}

local TYPE = "artillery-wagon"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(entity, ArtilleryWagon.get_sprite_set({ tint = tint }))

	local composition = ArtilleryWagon.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
