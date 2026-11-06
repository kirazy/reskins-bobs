-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.plates.items) then
	return
end

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
}

local Battery = require("__reskins-assets-api__.assets.base.items.battery")
local BatteryTechnology = require("__reskins-assets-api__.assets.base.technologies.battery")

-- Batteries
local batteries = {
	["battery"] = { technology = "battery", tint = "ff781f" },
	["bob-battery-2"] = { technology = "bob-battery-2", tint = "41ffdd" },
	["bob-battery-3"] = { technology = "bob-battery-3", tint = "3dff40" },
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

	local tint = util.color(map.tint)

	data.raw["recipe"][name].crafting_machine_tint.primary = tint

	items[name] = { composition = Battery.get_icon_composition({ tint = tint }) }
	technologies[map.technology] = { icon_data = BatteryTechnology.get_icon({ tint = tint }) }

	::continue::
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
