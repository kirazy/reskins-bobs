-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local PumpAir = require("__reskins-assets-api__.assets.bobs.entities.pump-air")

if not (reskins.bobs and reskins.bobs.triggers.plates.entities) then
	return
end

local entities = {
	["bob-air-pump"] = { tier = 1, prog_tier = 1 },
	["bob-air-pump-2"] = { tier = 2, prog_tier = 2 },
	["bob-air-pump-3"] = { tier = 3, prog_tier = 3 },
	["bob-air-pump-4"] = { tier = 4, prog_tier = 4 },
}

local TYPE = "assembling-machine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = PumpAir.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set, { scale = 0.5 })

	entity.match_animation_speed_to_activity = false

	local composition = PumpAir.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
