-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }
local _assets = {
	icons = require("__reskins-assets-api__.api.icons"),
	defines = require("__reskins-assets-api__.api.defines"),
}

local Applicators = require("__reskins-assets-api__.api.applicators")
local FluidWagon = require("__reskins-assets-api__.assets.base.entities.train-fluid-wagon")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end
if _framework.settings.get_value("bobmods-logistics-trains") == false then
	return
end

local entities = {
	["fluid-wagon"] = { tier = 1, prog_tier = 2 },
	["bob-fluid-wagon-2"] = { tier = 2, prog_tier = 3 },
	["bob-fluid-wagon-3"] = { tier = 3, prog_tier = 4 },
	["bob-armoured-fluid-wagon"] = { tier = 1, prog_tier = 3, is_armoured = true },
	["bob-armoured-fluid-wagon-2"] = { tier = 2, prog_tier = 4, is_armoured = true },
}

local TYPE = "fluid-wagon"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	Applicators.apply_sprite_set(entity, FluidWagon.get_sprite_set({ tint = tint }))

	local composition = FluidWagon.get_icon_composition({ tint = tint })
	if options.is_armoured then
		composition = composition:add_symbol(_assets.icons.get_symbol(_assets.defines.symbol.shield, tint))
	end

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
