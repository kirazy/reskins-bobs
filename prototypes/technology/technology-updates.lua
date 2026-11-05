-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if mods["ScienceCostTweakerM"] then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.technology.technologies) then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local SciencePack = require("__reskins-assets-api__.assets.base.technologies.science-pack")

---Gets the definition of the technology icon of the base game with the given `name`.
---@param name string The name of the file in `__base__/graphics/technology`, without its extension.
---@return TieredIconDefinition
local function base_icon(name)
	return { icon_datum = { icon = "__base__/graphics/technology/" .. name .. ".png", icon_size = 256 } }
end

---Gets the definition of the science pack technology icon in the given `tint`.
---@param tint Color
---@return TieredIconDefinition
local function science_pack(tint)
	return { composition = SciencePack.get_icon_composition({ tint = tint }) }
end

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Science Packs
	["bob-advanced-logistic-science-pack"] = science_pack(util.color("#de00a3")),
}

-- Color overhaul for science packs
if _framework.settings.get_value("bobmods-tech-colorupdate") == true then
	if _framework.settings.get_value("reskins-lib-customize-tier-colors") == true then
		definitions["automation-science-pack"] = science_pack(_framework.tiers.get_tint(1))
		definitions["logistic-science-pack"] = science_pack(_framework.tiers.get_tint(2))
		definitions["chemical-science-pack"] = science_pack(_framework.tiers.get_tint(3))
		definitions["production-science-pack"] = science_pack(_framework.tiers.get_tint(4))
		definitions["utility-science-pack"] = science_pack(_framework.tiers.get_tint(5))
	else
		definitions["automation-science-pack"] = base_icon("utility-science-pack")
		definitions["logistic-science-pack"] = base_icon("automation-science-pack")
		definitions["chemical-science-pack"] = base_icon("chemical-science-pack")
		definitions["production-science-pack"] = base_icon("production-science-pack")
		definitions["utility-science-pack"] = base_icon("logistic-science-pack")
	end
else
	definitions["automation-science-pack"] = base_icon("automation-science-pack")
	definitions["logistic-science-pack"] = base_icon("logistic-science-pack")
	definitions["chemical-science-pack"] = base_icon("chemical-science-pack")
	definitions["production-science-pack"] = base_icon("production-science-pack")
	definitions["utility-science-pack"] = base_icon("utility-science-pack")
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
