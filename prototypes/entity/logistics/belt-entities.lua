-- Copyright (c) 2025 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = {
	icons = require("__reskins-sprite-utils__.icons"),
	belt_animation_sets = require("__reskins-sprite-utils__.belt-animation-sets"),
}

local _defines = require("__reskins-assets-api__.api.defines")
local Applicators = require("__reskins-assets-api__.api.applicators")
local TransportBelt = require("__reskins-assets-api__.assets.base.entities.transport-belt")
local UndergroundBelt = require("__reskins-assets-api__.assets.base.entities.underground-belt")
local Splitter = require("__reskins-assets-api__.assets.base.entities.splitter")

if not mods["boblogistics"] then
	return
end

local reskin_base_entities = _framework.settings.get_value("reskins-framework-use-custom-tier-colors") == true
local basic_belt_color = _framework.settings.get_value("reskins-bobs-do-basic-belts-separately") == true
		and _framework.settings.get_value("reskins-bobs-basic-belts-color") --[[@as Color]]
	or nil

-- Bob's mods name the turbo belts `bob-turbo-*` before Bob's Library 2.1.0, and `turbo-*` from 2.1.0.
local turbo_prefix = data.raw["transport-belt"]["bob-turbo-transport-belt"] and "bob-turbo" or "turbo"

-- The transport belt, underground belt, and splitter of each tier. The entities of the base game are reskinned only
-- when the tier colors are customized, and are otherwise given tier labels.
local belt_tiers = {
	{
		transport_belt = "bob-basic-transport-belt",
		underground_belt = "bob-basic-underground-belt",
		splitter = "bob-basic-splitter",
		tier = 0,
		tint = basic_belt_color,
	},
	{
		transport_belt = "transport-belt",
		underground_belt = "underground-belt",
		splitter = "splitter",
		tier = 1,
		is_base = true,
	},
	{
		transport_belt = "fast-transport-belt",
		underground_belt = "fast-underground-belt",
		splitter = "fast-splitter",
		tier = 2,
		is_base = true,
	},
	{
		transport_belt = "express-transport-belt",
		underground_belt = "express-underground-belt",
		splitter = "express-splitter",
		tier = 3,
		is_base = true,
	},
	{
		transport_belt = turbo_prefix .. "-transport-belt",
		underground_belt = turbo_prefix .. "-underground-belt",
		splitter = turbo_prefix .. "-splitter",
		tier = 4,
	},
	{
		transport_belt = "bob-ultimate-transport-belt",
		underground_belt = "bob-ultimate-underground-belt",
		splitter = "bob-ultimate-splitter",
		tier = 5,
	},
}

for _, belt_tier in pairs(belt_tiers) do
	local belt = data.raw["transport-belt"][belt_tier.transport_belt]
	if not belt then
		goto continue
	end

	local underground = data.raw["underground-belt"][belt_tier.underground_belt]
	local splitter = data.raw["splitter"][belt_tier.splitter]

	if belt_tier.is_base and not reskin_base_entities then
		for _, entity in pairs({ belt, underground, splitter }) do
			_framework.tiers.add_tier_labels_to_prototype(belt_tier.tier, entity)
		end

		goto continue
	end

	local tint = belt_tier.tint or _framework.tiers.get_tint(belt_tier.tier)
	local params = { tint = tint, belt_sprite = _defines.get_belt_sprites(belt.speed) }

	-- Find the entities that use the belt animation set of the belt before it is replaced.
	local users = _sprite_utils.belt_animation_sets.find_belt_animation_set_users(belt)

	Applicators.apply_sprite_set(belt, TransportBelt.get_sprite_set(params))
	_sprite_utils.belt_animation_sets.set_belt_animation_set(users, belt.belt_animation_set)

	local entities = {
		{ belt, TransportBelt },
		{ underground, UndergroundBelt },
		{ splitter, Splitter },
	}

	for _, pair in pairs(entities) do
		local entity, module = pair[1], pair[2]
		if entity then
			if entity ~= belt then
				Applicators.apply_sprite_set(entity, module.get_sprite_set(params))
			end

			local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
				tier = belt_tier.tier,
				name = entity.name,
				type_name = entity.type,
				icon_data = module.get_icon({ tint = tint }),
			})
			_sprite_utils.icons.apply_icon_assignment(icon_assignment)
		end
	end

	::continue::
end
