-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobpower"] then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local Boiler = require("__reskins-assets-api__.assets.bobs.technologies.boiler")
local BoilerOil = require("__reskins-assets-api__.assets.bobs.technologies.boiler-oil")
local ElectricEnergyAccumulators =
	require("__reskins-assets-api__.assets.base.technologies.electric-energy-accumulators")
local GeneratorFluid = require("__reskins-assets-api__.assets.bobs.technologies.generator-fluid")
local HeatExchanger = require("__reskins-assets-api__.assets.bobs.technologies.heat-exchanger")
local PowerPoles = require("__reskins-assets-api__.assets.base.technologies.power-poles")
local SolarEnergy = require("__reskins-assets-api__.assets.base.technologies.solar-energy")
local SteamEngine = require("__reskins-assets-api__.assets.bobs.technologies.steam-engine")
local SteamTurbine = require("__reskins-assets-api__.assets.bobs.technologies.steam-turbine")
local Substation = require("__reskins-assets-api__.assets.base.technologies.substation")

-- The `params` of a technology are passed to the creator of its icon, with the tint of its tier or its own `tint`.
local technologies = {
	-- Heat pipes
	-- ["bob-heat-pipe-1"] = {}, -- heat pipes
	-- ["bob-heat-pipe-2"] = {}, -- silver pipes
	-- ["bob-heat-pipe-3"] = {}, -- gold pipes
}

if _framework.settings.get_value("bobmods-power-accumulators") then
	-- Accumulators
	technologies["electric-energy-accumulators"] = { module = ElectricEnergyAccumulators, tier = 1, prog_tier = 2 }
	technologies["bob-electric-energy-accumulators-2"] = { module = ElectricEnergyAccumulators, tier = 2, prog_tier = 3 }
	technologies["bob-electric-energy-accumulators-3"] = { module = ElectricEnergyAccumulators, tier = 3, prog_tier = 4 }
end

if _framework.settings.get_value("bobmods-power-poles") then
	-- Electric poles
	technologies["electric-energy-distribution-1"] = { module = PowerPoles, tier = 1, prog_tier = 2 } -- t2 poles
	technologies["bob-electric-pole-2"] = { module = PowerPoles, tier = 2, prog_tier = 3 } -- t3 poles
	technologies["bob-electric-pole-3"] = { module = PowerPoles, tier = 3, prog_tier = 4 } -- t4 poles
	technologies["bob-electric-pole-4"] = { module = PowerPoles, tier = 4, prog_tier = 5 } -- t5 poles

	technologies["electric-energy-distribution-2"] = { module = Substation, tier = 1, prog_tier = 2 } -- t2 substation
	technologies["bob-electric-substation-2"] = { module = Substation, tier = 2, prog_tier = 3 } -- t3 substation
	technologies["bob-electric-substation-3"] = { module = Substation, tier = 3, prog_tier = 4 } -- t4 substation
	technologies["bob-electric-substation-4"] = { module = Substation, tier = 4, prog_tier = 5 } -- t5 substation
end

if _framework.settings.get_value("bobmods-power-steam") then
	--stylua: ignore start
	-- Boilers
	technologies["bob-boiler-2"] = { module = Boiler, tier = 2 }
	technologies["bob-boiler-3"] = { module = Boiler, tier = 3 }
	technologies["bob-boiler-4"] = { module = Boiler, tier = 4 }
	technologies["bob-boiler-5"] = { module = Boiler, tier = 5 }

	-- Oil boilers
	technologies["bob-oil-boiler-1"] = { module = BoilerOil, tier = 1, prog_tier = 2 }
	technologies["bob-oil-boiler-2"] = { module = BoilerOil, tier = 2, prog_tier = 3 }
	technologies["bob-oil-boiler-3"] = { module = BoilerOil, tier = 3, prog_tier = 4 }
	technologies["bob-oil-boiler-4"] = { module = BoilerOil, tier = 4, prog_tier = 5 }

	-- Heat exchangers
	technologies["bob-heat-exchanger-1"] = { module = HeatExchanger, params = { pipe_material = "base" }, tier = 1, prog_tier = 2 }
	technologies["bob-heat-exchanger-2"] = { module = HeatExchanger, params = { pipe_material = "aluminum-invar" }, tier = 2, prog_tier = 3 }
	technologies["bob-heat-exchanger-3"] = { module = HeatExchanger, params = { pipe_material = "silver-titanium" }, tier = 3, prog_tier = 4 }
	technologies["bob-heat-exchanger-4"] = { module = HeatExchanger, params = { pipe_material = "gold-copper" }, tier = 4, prog_tier = 5 }

	-- Steam engines
	technologies["bob-steam-engine-2"] = { module = SteamEngine, tier = 2 }
	technologies["bob-steam-engine-3"] = { module = SteamEngine, tier = 3 }
	technologies["bob-steam-engine-4"] = { module = SteamEngine, tier = 4 }
	technologies["bob-steam-engine-5"] = { module = SteamEngine, tier = 5 }

	-- Steam turbines
	technologies["bob-steam-turbine-1"] = { module = SteamTurbine, tier = 1, prog_tier = 3 }
	technologies["bob-steam-turbine-2"] = { module = SteamTurbine, tier = 2, prog_tier = 4 }
	technologies["bob-steam-turbine-3"] = { module = SteamTurbine, tier = 3, prog_tier = 5 }
	--stylua: ignore end
end

if _framework.settings.get_value("bobmods-power-fluidgenerator") then
	-- Fluid generators
	technologies["bob-fluid-generator-1"] = { module = GeneratorFluid, tier = 1, prog_tier = 2 }
	technologies["bob-fluid-generator-2"] = { module = GeneratorFluid, tier = 2, prog_tier = 3 }
	technologies["bob-fluid-generator-3"] = { module = GeneratorFluid, tier = 3, prog_tier = 4 }
	--stylua: ignore
	technologies["bob-hydrazine-generator"] = { module = GeneratorFluid, tier = 4, prog_tier = 5, tint = reskins.bobs.hydrazine_tint }
end

if _framework.settings.get_value("bobmods-power-heatsources") then
	-- Heat sources
	-- technologies["bob-fluid-reactor-1"] = {} -- t3 fluid burning heat sources
	-- technologies["bob-fluid-reactor-2"] = {} -- t4 fluid heat source
	-- technologies["bob-fluid-reactor-3"] = {} -- t5
	-- technologies["bob-burner-reactor-1"] = {} -- t3 burner heat sources
	-- technologies["bob-burner-reactor-2"] = {} -- t4 burner
	-- technologies["bob-burner-reactor-3"] = {} -- t5
end

if _framework.settings.get_value("bobmods-power-solar") then
	-- Solar Panels
	technologies["solar-energy"] = { module = SolarEnergy, tier = 1, prog_tier = 2 }
	technologies["bob-solar-energy-2"] = { module = SolarEnergy, tier = 2, prog_tier = 3 }
	technologies["bob-solar-energy-3"] = { module = SolarEnergy, tier = 3, prog_tier = 4 }
end

---@type table<string, TieredIconDefinition>
local definitions = {}

for name, options in pairs(technologies) do
	local params = util.copy(options.params or {})
	params.tint = options.tint or _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition(params) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
