-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobrevamp"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")

---@type table<string, TieredIconDefinition>
local definitions = {
	-- ["pumpjack"] = {group = "mining", tier = 1}, -- pumpjack 1

	-- ["solid-fuel"] = {}, -- Solid fuels! all of the, black/white
	-- ["hydrazine"] = {}, -- Hydrazine, enriched fuel block from hydrazine
	-- ["rtg"] = {}, -- radio thermoelec gen, fluids, powders
	["bob-heat-shield"] = { composition = Icons.get_heat_shield_icon_composition() }, -- also need to do item, heat-shield-tile
}

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
