-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobmodules"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Beacons
	-- FIXME These techs do not have sprite support yet.
	-- ["effect-transmission"] = {tier = 1, prog_tier = 3},   -- t3 beacon
	-- ["effect-transmission-2"] = {tier = 2, prog_tier = 4}, -- t4 beacon
	-- ["effect-transmission-3"] = {tier = 3, prog_tier = 5}, -- t5 beacon
}

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
