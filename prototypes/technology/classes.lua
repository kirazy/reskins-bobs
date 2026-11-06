-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobclasses"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

---@type table<string, TieredIconDefinition>
local definitions = {
	-- ["builder-body"] = {}, -- builder (hamme,r wrench, screwdriver icon)
	-- ["builder-body-2"] = {},
	-- ["fighter-body"] = {}, -- guns
	-- ["fighter-body-2"] = {},
	-- ["miner-body"] = {}, -- pickaxe
	-- ["miner-body-2"] = {},
	-- ["bodies"] = {}, -- generic body
	-- ["bodies-2"] = {}, -- generic 2x, parts
	-- ["engineer-body"] = {},
	-- ["prospector-body"] = {},
}

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
