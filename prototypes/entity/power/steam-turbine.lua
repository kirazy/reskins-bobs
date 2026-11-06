-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local SteamTurbine = require("__reskins-assets-api__.assets.base.entities.steam-turbine")

if not mods["bobpower"] then
	return
end
if not _framework.settings.get_value("bobmods-power-steam") then
	return
end

local entities = {
	["steam-turbine"] = { tier = 1, prog_tier = 3 },
	["bob-steam-turbine-2"] = { tier = 2, prog_tier = 4 },
	["bob-steam-turbine-3"] = { tier = 3, prog_tier = 5 },
}

local TYPE = "generator"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = SteamTurbine.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = SteamTurbine.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
