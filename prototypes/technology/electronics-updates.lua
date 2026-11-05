-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.electronics.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.base.technologies.icons")

---@type table<string, TieredIconDefinition>
local technologies = {
	-- FIXME: The icon is gone in 2.0. Bundled from 1.1 for now.
	["processing-unit"] = { composition = Icons.get_electronics_original_icon_composition() },
}

_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
