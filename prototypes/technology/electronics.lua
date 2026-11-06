-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobelectronics"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")

---@type table<string, TieredIconDefinition>
local technologies = {
	-- solder, solder plate, insulated wire, basic circuit, resistor, tin wire
	-- ["electronics"] = {},

	-- Advanced electronics
	-- ["advanced-electronics"] = {},

	-- FIXME: The icon is gone in 2.0. Bundled from 1.1 for now.
	["bob-advanced-processing-unit"] = { composition = Icons.get_advanced_processing_unit_legacy_icon_composition() },
}

_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
