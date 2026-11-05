-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local TurretGun = require("__reskins-assets-api__.assets.base.entities.turret-gun")

if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then
	return
end

local entities = {
	["gun-turret"] = { tier = 1 },
	["bob-gun-turret-2"] = { tier = 2 },
	["bob-gun-turret-3"] = { tier = 3 },
	["bob-gun-turret-4"] = { tier = 4 },
	["bob-gun-turret-5"] = { tier = 5 },
}

local TYPE = "ammo-turret"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = TurretGun.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = TurretGun.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
