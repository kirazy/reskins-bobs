-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.greenhouse.items) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")

_framework.tiers.assign_icons_with_tier_labels("item", {
	["bob-seedling"] = { composition = Icons.get_seedling_icon_composition() },
	["bob-fertiliser"] = { composition = Icons.get_fertiliser_icon_composition() },
	["bob-wood-pellets"] = { composition = Icons.get_wood_pellets_icon_composition() },
})

_framework.tiers.assign_icons_with_tier_labels("recipe", {
	["bob-basic-greenhouse-cycle"] = { composition = Icons.get_basic_greenhouse_cycle_icon_composition() },
	["bob-advanced-greenhouse-cycle"] = { composition = Icons.get_advanced_greenhouse_cycle_icon_composition() },
})
