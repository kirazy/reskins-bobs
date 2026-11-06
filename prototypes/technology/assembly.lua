-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobassembly"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Automation = require("__reskins-assets-api__.assets.base.technologies.automation")
local Centrifuge = require("__reskins-assets-api__.assets.bobs.technologies.centrifuge")
local ChemicalPlant = require("__reskins-assets-api__.assets.bobs.technologies.chemical-plant")
local Distillery = require("__reskins-assets-api__.assets.bobs.technologies.distillery")
local Electrolyser2 = require("__reskins-assets-api__.assets.bobs.technologies.electrolyser-2")
local Electrolyser3 = require("__reskins-assets-api__.assets.bobs.technologies.electrolyser-3")
local Electrolyser4 = require("__reskins-assets-api__.assets.bobs.technologies.electrolyser-4")
local Electrolyser5 = require("__reskins-assets-api__.assets.bobs.technologies.electrolyser-5")
local ElectronicsMachines = require("__reskins-assets-api__.assets.bobs.technologies.electronics-machines")
local OilRefinery = require("__reskins-assets-api__.assets.bobs.technologies.oil-refinery")

-- The icon of each technology is created by its module, in the tint of its tier.
local technologies = {
	-- Assemblers
	["automation"] = { module = Automation, tier = 1 },
	["automation-2"] = { module = Automation, tier = 2 },
	["automation-3"] = { module = Automation, tier = 3 },
	["automation-4"] = { module = Automation, tier = 4 },
	["automation-5"] = { module = Automation, tier = 5 },
	["automation-6"] = { module = Automation, tier = 6 },

	-- Electronics Assemblers
	["bob-electronics-machine-1"] = { module = ElectronicsMachines, tier = 1, prog_tier = 2 },
	["bob-electronics-machine-2"] = { module = ElectronicsMachines, tier = 2, prog_tier = 4 },
	["bob-electronics-machine-3"] = { module = ElectronicsMachines, tier = 3, prog_tier = 6 },

	-- Centrifuges
	["bob-centrifuge-2"] = { module = Centrifuge, tier = 1, prog_tier = 4 },
	["bob-centrifuge-3"] = { module = Centrifuge, tier = 2, prog_tier = 5 },

	-- Electrolysers
	["bob-electrolyser-2"] = { module = Electrolyser2, tier = 2 },
	["bob-electrolyser-3"] = { module = Electrolyser3, tier = 3 },
	["bob-electrolyser-4"] = { module = Electrolyser4, tier = 4 },
	["bob-electrolyser-5"] = { module = Electrolyser5, tier = 5 },

	-- Chemical Plants
	["bob-chemical-plant-2"] = { module = ChemicalPlant, tier = 2, prog_tier = 3 },
	["bob-chemical-plant-3"] = { module = ChemicalPlant, tier = 3, prog_tier = 4 },
	["bob-chemical-plant-4"] = { module = ChemicalPlant, tier = 4, prog_tier = 5 },

	-- Oil Refinery
	-- ["oil-processing"] = {tier = 1, prog_tier = 2} -- refinery 1
	["oil-processing-2"] = { module = OilRefinery, tier = 2, prog_tier = 3 },
	["oil-processing-3"] = { module = OilRefinery, tier = 3, prog_tier = 4 },
	["oil-processing-4"] = { module = OilRefinery, tier = 4, prog_tier = 5 },

	-- Distilleries
	["bob-distillery-2"] = { module = Distillery, tier = 2 },
	["bob-distillery-3"] = { module = Distillery, tier = 3 },
	["bob-distillery-4"] = { module = Distillery, tier = 4 },
	["bob-distillery-5"] = { module = Distillery, tier = 5 },
}

---@type table<string, TieredIconDefinition>
local definitions = {}

for name, options in pairs(technologies) do
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition({ tint = tint }) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
