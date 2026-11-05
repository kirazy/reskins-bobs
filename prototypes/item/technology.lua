-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if mods["ScienceCostTweakerM"] then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.technology.items) then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local AlienSciencePacks = require("__reskins-assets-api__.assets.bobs.items.alien-science-packs")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")
local SciencePack = require("__reskins-assets-api__.assets.base.items.science-pack")

---@type table<string, TieredIconDefinition>
local items = {
	["bob-advanced-logistic-science-pack"] = {
		composition = Icons.get_science_pack_advanced_logistic_icon_composition(),
	},
}

-- Color overhaul for science packs
if
	_framework.settings.get_value("bobmods-tech-colorupdate") == true
	and _framework.settings.get_value("reskins-lib-customize-tier-colors") == true
then
	for name, tier in pairs({
		["automation-science-pack"] = 1,
		["logistic-science-pack"] = 2,
		["chemical-science-pack"] = 3,
		["production-science-pack"] = 4,
		["utility-science-pack"] = 5,
	}) do
		items[name] = {
			composition = SciencePack.get_icon_composition({
				tint = _framework.tiers.get_tint(_framework.tiers.get_tier(tier)),
			}),
		}
	end
end

-- Alien science packs
if _framework.settings.get_value("bobmods-enemies-enablenewartifacts") == true then
	items["bob-alien-science-pack"] = { composition = AlienSciencePacks.get_alien_science_pack_icon_composition() }
	items["bob-alien-science-pack-blue"] = {
		composition = AlienSciencePacks.get_alien_science_pack_blue_icon_composition(),
	}
	items["bob-alien-science-pack-orange"] = {
		composition = AlienSciencePacks.get_alien_science_pack_orange_icon_composition(),
	}
	items["bob-alien-science-pack-purple"] = {
		composition = AlienSciencePacks.get_alien_science_pack_purple_icon_composition(),
	}
	items["bob-alien-science-pack-yellow"] = {
		composition = AlienSciencePacks.get_alien_science_pack_yellow_icon_composition(),
	}
	items["bob-alien-science-pack-green"] = {
		composition = AlienSciencePacks.get_alien_science_pack_green_icon_composition(),
	}
	items["bob-alien-science-pack-red"] = {
		composition = AlienSciencePacks.get_alien_science_pack_red_icon_composition(),
	}
	items["bob-science-pack-gold"] = { composition = Icons.get_science_pack_gold_icon_composition() }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
