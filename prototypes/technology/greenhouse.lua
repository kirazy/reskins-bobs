-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.greenhouse.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")

---@type table<string, TieredIconDefinition>
local definitions = {
	["bob-fertiliser"] = { composition = Icons.get_fertiliser_icon_composition() },
	["bob-greenhouse"] = { composition = Icons.get_greenhouse_icon_composition() }, -- greenhouse, recipies
}

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
