-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.mining.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	icons = require("__reskins-assets-api__.api.icons"),
}
local IconComposition = require("__reskins-sprite-utils__.icon-composition")

local MiningDrill = require("__reskins-assets-api__.assets.bobs.technologies.mining-drill")
local OilGathering = require("__reskins-assets-api__.assets.base.technologies.oil-gathering")

---Gets the definition of the steel axe technology icon of the base game, with the mining constant.
---@return TieredIconDefinition
local function get_steel_axe_definition()
	return {
		composition = IconComposition:from_icon(
			{ icon = "__base__/graphics/technology/steel-axe.png", icon_size = 256 },
			nil,
			"technology"
		):add_symbol(_assets.icons.get_technology_constant(_assets.defines.technology_constant.mining)),
	}
end

-- The `params` of a technology are passed to the creator of its icon, with the tint of its tier.
local technologies = {
	-- Standard Drills
	["bob-drills-2"] = { module = MiningDrill, params = { variant = "standard" }, tier = 2 },
	["bob-drills-3"] = { module = MiningDrill, params = { variant = "standard" }, tier = 3 },
	["bob-drills-4"] = { module = MiningDrill, params = { variant = "standard" }, tier = 4 },
	["bob-drills-5"] = { module = MiningDrill, params = { variant = "standard" }, tier = 5 },

	-- Area Drills
	["bob-area-drills-1"] = { module = MiningDrill, params = { variant = "area" }, tier = 1, prog_tier = 2 },
	["bob-area-drills-2"] = { module = MiningDrill, params = { variant = "area" }, tier = 2, prog_tier = 3 },
	["bob-area-drills-3"] = { module = MiningDrill, params = { variant = "area" }, tier = 3, prog_tier = 4 },
	["bob-area-drills-4"] = { module = MiningDrill, params = { variant = "area" }, tier = 4, prog_tier = 5 },

	-- Oil pumpjacks
	["oil-gathering"] = { module = OilGathering, params = { variant = "base" }, tier = 1, prog_tier = 2 },
	["bob-pumpjacks-2"] = { module = OilGathering, params = { variant = "base" }, tier = 2, prog_tier = 3 },
	["bob-pumpjacks-3"] = { module = OilGathering, params = { variant = "base" }, tier = 3, prog_tier = 4 },
	["bob-pumpjacks-4"] = { module = OilGathering, params = { variant = "base" }, tier = 4, prog_tier = 5 },

	-- Water pumpjacks
	["bob-water-miner-1"] = { module = OilGathering, params = { variant = "water" }, tier = 1 },
	["bob-water-miner-2"] = { module = OilGathering, params = { variant = "water" }, tier = 2 },
	["bob-water-miner-3"] = { module = OilGathering, params = { variant = "water" }, tier = 3 },
	["bob-water-miner-4"] = { module = OilGathering, params = { variant = "water" }, tier = 4 },
}

if mods["aai-industry"] then
	technologies["electric-mining-drill"] = { module = MiningDrill, params = { variant = "standard" }, tier = 1 }
end

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Technology effects
	["steel-axe"] = get_steel_axe_definition(),
	["bob-steel-axe-2"] = get_steel_axe_definition(),
	["bob-steel-axe-3"] = get_steel_axe_definition(),
	["bob-steel-axe-4"] = get_steel_axe_definition(),
	["bob-steel-axe-5"] = get_steel_axe_definition(),
}

for name, options in pairs(technologies) do
	local params = util.copy(options.params)
	params.tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition(params) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
