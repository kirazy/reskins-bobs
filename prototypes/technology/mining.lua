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

-- The icon of each technology is created by its module, in the tint of its tier.
local technologies = {
	-- Standard Drills
	["bob-drills-2"] = { module = MiningDrill, tier = 2 },
	["bob-drills-3"] = { module = MiningDrill, tier = 3 },
	["bob-drills-4"] = { module = MiningDrill, tier = 4 },
	["bob-drills-5"] = { module = MiningDrill, tier = 5 },

	-- Oil pumpjacks
	["oil-gathering"] = { module = OilGathering, tier = 1, prog_tier = 2 },
	["bob-pumpjacks-2"] = { module = OilGathering, tier = 2, prog_tier = 3 },
	["bob-pumpjacks-3"] = { module = OilGathering, tier = 3, prog_tier = 4 },
	["bob-pumpjacks-4"] = { module = OilGathering, tier = 4, prog_tier = 5 },
}

if mods["aai-industry"] then
	technologies["electric-mining-drill"] = { module = MiningDrill, tier = 1 }
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
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition({ tint = tint }) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)

-- The icons of the area drills and the water pumpjacks are assigned from the files of reskins-bobs.

-- Setup standard inputs
local inputs = {
	mod = "bobs",
	group = "mining",
	type = "technology",
	technology_icon_size = 256,
}

---@param tier? integer # The tier of the icon. An integer value from 0 to 6. Default `0`.
---@param prog_tier? integer # The tier of the icon, as determined by the progression map. An integer value from 0 to 6. Default `0`.
---@return CreateIconsFromListOverrides
local function get_area_mining_drill_overrides(tier, prog_tier)
	---@type CreateIconsFromListOverrides
	local override = {
		tier = tier,
		prog_tier = prog_tier,
		icon_name = "mining-drill",
		icon_base = "area-mining-drill",
		technology_icon_size = 128,
	}

	return override
end

---@param tier? integer # The tier of the icon. An integer value from 0 to 6. Default `0`.
---@param prog_tier? integer # The tier of the icon, as determined by the progression map. An integer value from 0 to 6. Default `0`.
---@return CreateIconsFromListOverrides
local function get_water_pumpjack_overrides(tier, prog_tier)
	---@type CreateIconsFromListOverrides
	local override = {
		tier = tier,
		prog_tier = prog_tier,
		icon_name = "pumpjack",
		icon_base = "water-pumpjack",
	}

	return override
end

local legacy_technologies = {
	-- Area Drills
	["bob-area-drills-1"] = get_area_mining_drill_overrides(1, 2),
	["bob-area-drills-2"] = get_area_mining_drill_overrides(2, 3),
	["bob-area-drills-3"] = get_area_mining_drill_overrides(3, 4),
	["bob-area-drills-4"] = get_area_mining_drill_overrides(4, 5),

	-- Water pumpjacks
	["bob-water-miner-1"] = get_water_pumpjack_overrides(1),
	["bob-water-miner-2"] = get_water_pumpjack_overrides(2),
	["bob-water-miner-3"] = get_water_pumpjack_overrides(3),
	["bob-water-miner-4"] = get_water_pumpjack_overrides(4),
}

reskins.internal.create_icons_from_list(legacy_technologies, inputs)
