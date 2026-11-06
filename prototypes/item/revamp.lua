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

local Fluids = require("__reskins-assets-api__.assets.bobs.items.fluids")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")

_framework.tiers.assign_icons_with_tier_labels("fluid", {
	["bob-brine"] = { composition = Fluids.get_brine_icon_composition() },
	["bob-ammoniated-brine"] = { composition = Fluids.get_ammoniated_brine_icon_composition() },
})

_framework.tiers.assign_icons_with_tier_labels("item", {
	["bob-heat-shield-tile"] = { composition = Icons.get_heat_shield_tile_icon_composition() },
})

-- Assign the recipes after the items. A composite recipe reads the icons of the items.
---@type table<string, TieredIconDefinition>
local recipes = {
	["bob-ammonium-chloride-reprocessing"] = {
		sources = {
			{ name = "bob-ammonium-chloride", type_name = "item" },
			{ name = "ammonia", type_name = "fluid", transform = { scale = 0.375, shift = { -10, 11 } } },
			{ name = "bob-calcium-chloride", type_name = "item", transform = { scale = 0.375, shift = { 10, 11 } } },
		},
	},
}

-- Items and recipes shared with other mods within Bob's suite
if not mods["bobplates"] then
	recipes["bob-solid-fuel-from-sour-gas"] = { composition = Icons.get_solid_fuel_from_sour_gas_icon_composition() }
end

_framework.tiers.assign_icons_with_tier_labels("recipe", recipes)
