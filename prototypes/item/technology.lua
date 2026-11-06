-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if mods["ScienceCostTweakerM"] then
	return
end
if not mods["bobtech"] then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local AlienSciencePacks = require("__reskins-assets-api__.assets.bobs.items.alien-science-packs")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")

---@type table<string, TieredIconDefinition>
local items = {
	["bob-advanced-logistic-science-pack"] = {
		composition = Icons.get_science_pack_advanced_logistic_icon_composition(),
	},
}

-- Alien science packs
if _framework.settings.get_value("bobmods-enemies-enablenewartifacts") == true then
	items["bob-alien-science-pack"] = { composition = AlienSciencePacks.get_icon_composition({ color = "pink" }) }
	items["bob-alien-science-pack-blue"] = {
		composition = AlienSciencePacks.get_icon_composition({ color = "blue" }),
	}
	items["bob-alien-science-pack-orange"] = {
		composition = AlienSciencePacks.get_icon_composition({ color = "orange" }),
	}
	items["bob-alien-science-pack-purple"] = {
		composition = AlienSciencePacks.get_icon_composition({ color = "purple" }),
	}
	items["bob-alien-science-pack-yellow"] = {
		composition = AlienSciencePacks.get_icon_composition({ color = "yellow" }),
	}
	items["bob-alien-science-pack-green"] = {
		composition = AlienSciencePacks.get_icon_composition({ color = "green" }),
	}
	items["bob-alien-science-pack-red"] = {
		composition = AlienSciencePacks.get_icon_composition({ color = "red" }),
	}
	items["bob-science-pack-gold"] = { composition = Icons.get_science_pack_gold_icon_composition() }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
