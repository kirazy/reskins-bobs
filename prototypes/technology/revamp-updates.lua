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

local ChemicalPlant = require("__reskins-assets-api__.assets.bobs.technologies.chemical-plant")

-- The icon of each technology is created by its module, in the tint of its tier.
local technologies = {
	-- Chemical plant
	["bob-chemical-plant"] = { module = ChemicalPlant, tier = 1, prog_tier = 2 },
}

---@type table<string, TieredIconDefinition>
local definitions = {}

for name, options in pairs(technologies) do
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition({ tint = tint }) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
