-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobplates"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")

-- Angel's Petrochem replaces nuclear fuel reprocessing with a recipe and icon of its own.
if mods["angelspetrochem"] then
	return
end

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Bob's Plates sets the icon of nuclear fuel reprocessing in data-updates.
	["nuclear-fuel-reprocessing"] = { composition = Icons.get_nuclear_fuel_reprocessing_icon_composition() },
}

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
