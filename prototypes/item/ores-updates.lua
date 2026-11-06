-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobores"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Fluids = require("__reskins-assets-api__.assets.bobs.items.fluids")

-- Items and recipes shared with other mods within Bob's suite
if not mods["bobplates"] then
	_framework.tiers.assign_icons_with_tier_labels("fluid", {
		["bob-lithia-water"] = { composition = Fluids.get_lithia_water_icon_composition() }, -- Angels
	})
end
