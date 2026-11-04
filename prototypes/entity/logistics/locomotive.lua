-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }
local _assets = {
	icons = require("__reskins-assets-api__.api.icons"),
	defines = require("__reskins-assets-api__.api.defines"),
}

local Locomotive = require("__reskins-assets-api__.assets.base.entities.train-locomotive")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end
if _framework.settings.get_value("bobmods-logistics-trains") == false then
	return
end

local entities = {
	["locomotive"] = { tier = 1, prog_tier = 2 },
	["bob-locomotive-2"] = { tier = 2, prog_tier = 3 },
	["bob-locomotive-3"] = { tier = 3, prog_tier = 4 },
	["bob-armoured-locomotive"] = { tier = 1, prog_tier = 3, is_armoured = true },
	["bob-armoured-locomotive-2"] = { tier = 2, prog_tier = 4, is_armoured = true },
}

local TYPE = "locomotive"
local BASE_ENTITY_NAME = "locomotive"

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

	_lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	local composition = Locomotive.get_icon_composition({ tint = tint })
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
