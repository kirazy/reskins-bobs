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
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local Battery = require("__reskins-assets-api__.assets.base.items.battery")

-- Batteries
local batteries = {
	["battery"] = { tier = 1, prog_tier = 2, technology = "battery", tint = "ff781f" },
	["bob-battery-2"] = { tier = 2, prog_tier = 3, technology = "bob-battery-2", tint = "41ffdd" },
	["bob-battery-3"] = { tier = 3, prog_tier = 4, technology = "bob-battery-3", tint = "3dff40" },
}

---Gets the technology icon of the battery in the given `tint`.
---@param tint Color The tint of the mask layer.
---@return IconData[]
local function get_technology_icon(tint)
	local path = "__reskins-bobs__/graphics/technology/plates/battery/battery-technology"

	return {
		{ icon = path .. "-base.png", icon_size = 256 },
		{ icon = path .. "-mask.png", icon_size = 256, tint = tint },
		{ icon = path .. "-highlights.png", icon_size = 256, tint = { 1, 1, 1, 0 } },
	}
end

---@type table<string, TieredIconDefinition>
local items = {}

---@type table<string, TieredIconDefinition>
local technologies = {}

for name, map in pairs(batteries) do
	-- Fetch item
	local item = data.raw.item[name]

	-- Check if item exists, if not, skip this iteration
	if not item then
		goto continue
	end

	local tint
	if _framework.settings.get_value("bobmods-colorupdate") then
		tint = _framework.tiers.get_tint(_framework.tiers.get_tier(map))
	else
		tint = util.color(map.tint)
	end

	-- Specify crafting recipe tint
	data.raw["recipe"][name].crafting_machine_tint.primary = tint

	items[name] = { composition = Battery.get_icon_composition({ tint = tint }) }
	technologies[map.technology] = { icon_data = get_technology_icon(tint) }

	::continue::
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
