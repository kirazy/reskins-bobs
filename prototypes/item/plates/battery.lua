-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobplates"] then
	return
end

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
}

local Battery = require("__reskins-assets-api__.assets.base.items.battery")
local BatteryTechnology = require("__reskins-assets-api__.assets.base.technologies.battery")

-- Batteries
local batteries = {
	["battery"] = { technology = "battery", tint = util.color("#ff781f") },
	["bob-battery-2"] = { technology = "bob-battery-2", tint = util.color("#41ffdd") },
	["bob-battery-3"] = { technology = "bob-battery-3", tint = util.color("#3dff40") },
}

---@type table<string, TieredIconDefinition>
local items = {}

---@type table<string, TieredIconDefinition>
local technologies = {}

for name, map in pairs(batteries) do
	local item = data.raw.item[name]
	if not item then
		goto continue
	end

	local recipe = data.raw.recipe[name]
	if recipe then
		recipe.crafting_machine_tint = recipe.crafting_machine_tint or {}
		recipe.crafting_machine_tint.primary = map.tint
	end

	items[name] = { composition = Battery.get_icon_composition({ tint = map.tint }) }
	technologies[map.technology] = { icon_data = BatteryTechnology.get_icon({ tint = map.tint }) }

	::continue::
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
