-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobmining"] then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

---@type table<string, TieredIconDefinition>
local definitions = {
	-- ["bob-long-inserters-1"] = {},
	-- ["bob-long-inserters-2"] = {},
	-- ["bob-near-inserters"] = {},
	-- ["bob-more-inserters-1"] = {},
	-- ["bob-more-inserters-2"] = {},
}

-- For non-overhaul condition, long-handed inserters are unlocked by this technology
if _framework.settings.get_value("bobmods-logistics-inserteroverhaul") ~= true then
	-- technologies["long-inserters-1"] = nil
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
