-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.plates.technologies) then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local FluidHandling = require("__reskins-assets-api__.assets.base.technologies.fluid-handling")
local FurnaceElectric = require("__reskins-assets-api__.assets.bobs.technologies.furnace-electric")
local FurnaceElectricChemical = require("__reskins-assets-api__.assets.bobs.technologies.furnace-electric-chemical")
local FurnaceElectricChemicalMixing =
	require("__reskins-assets-api__.assets.bobs.technologies.furnace-electric-chemical-mixing")
local FurnaceElectricMixing = require("__reskins-assets-api__.assets.bobs.technologies.furnace-electric-mixing")
local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")
local SteelProcessing = require("__reskins-assets-api__.assets.bobs.technologies.steel-processing")
local WaterBore = require("__reskins-assets-api__.assets.bobs.technologies.water-bore")

---Gets the definition of the alien research technology icon of the given `color`, from the files of reskins-bobs.
---@param color string
---@return TieredIconDefinition
local function get_alien_research_definition(color)
	return {
		icon_datum = {
			icon = "__reskins-bobs__/graphics/technology/plates/alien/bob-alien-" .. color .. "-research.png",
			icon_size = 256,
		},
	}
end

---Gets the air compressor technology icon in the given `tint`, from the files of reskins-bobs.
---@param tint Color
---@return IconData[]
local function get_air_compressor_icon_data(tint)
	local path = "__reskins-bobs__/graphics/technology/plates/air-compressor/air-compressor-technology-"

	return {
		{ icon = path .. "base.png", icon_size = 128 },
		{ icon = path .. "mask.png", icon_size = 128, tint = tint },
		{ icon = path .. "highlights.png", icon_size = 128, tint = { 1, 1, 1, 0 } },
	}
end

-- The icon of each technology is created by its module, in the tint of its tier or in its own `tint`.
local technologies = {
	-- Furnaces
	["advanced-material-processing-2"] = { module = FurnaceElectric, tint = util.color("#ffb700") },
	["advanced-material-processing-3"] = { module = FurnaceElectric, tier = 4 },
	["advanced-material-processing-4"] = { module = FurnaceElectric, tier = 5 },
	["bob-electric-chemical-furnace"] = { module = FurnaceElectricChemical, tint = util.color("#e50000") },
	["bob-electric-mixing-furnace"] = { module = FurnaceElectricMixing, tint = util.color("#00bfff") },
	["bob-multi-purpose-furnace-1"] = { module = FurnaceElectricChemicalMixing, tier = 4 },
	["bob-multi-purpose-furnace-2"] = { module = FurnaceElectricChemicalMixing, tier = 5 },

	-- Barreling pumps
	["bob-water-bore-1"] = { module = WaterBore, tier = 1, prog_tier = 2 },
	["bob-water-bore-2"] = { module = WaterBore, tier = 2, prog_tier = 3 },
	["bob-water-bore-3"] = { module = WaterBore, tier = 3, prog_tier = 4 },
	["bob-water-bore-4"] = { module = WaterBore, tier = 4, prog_tier = 5 },

	-- Fluid Handling
	["fluid-handling"] = { module = FluidHandling, tier = 1, prog_tier = 2 },
	["bob-fluid-handling-2"] = { module = FluidHandling, tier = 2, prog_tier = 3 },
	["bob-fluid-handling-3"] = { module = FluidHandling, tier = 3, prog_tier = 4 },
	["bob-fluid-handling-4"] = { module = FluidHandling, tier = 4, prog_tier = 5 },
}

-- Air compressors
local air_compressors = {
	["bob-air-compressor-1"] = { tier = 1, prog_tier = 2 },
	["bob-air-compressor-2"] = { tier = 2, prog_tier = 3 },
	["bob-air-compressor-3"] = { tier = 3, prog_tier = 4 },
	["bob-air-compressor-4"] = { tier = 4, prog_tier = 5 },
}

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Nuclear
	-- ["uranium-processing"] = {}, -- uranium proc, centrifuge t3
	["bob-thorium-fuel-reprocessing"] = { composition = Icons.get_thorium_fuel_reprocessing_icon_composition() },
	["bobingabout-enrichment-process"] = { composition = Icons.get_bobingabout_enrichment_process_icon_composition() },

	["bob-plutonium-fuel-cell"] = { composition = Icons.get_plutonium_fuel_cell_icon_composition() },
	["bob-thorium-plutonium-fuel-cell"] = { composition = Icons.get_thorium_plutonium_fuel_cell_icon_composition() },
	["bob-deuterium-fuel-cell-2"] = { composition = Icons.get_deuterium_fuel_cell_2_icon_composition() },

	-- Furnaces
	["bob-chemical-processing-1"] = { composition = Icons.get_chemical_processing_1_icon_composition() },
	["advanced-material-processing"] = { composition = Icons.get_advanced_material_processing_icon_composition() },
	["bob-steel-mixing-furnace"] = { composition = Icons.get_steel_mixing_furnace_icon_composition() },
	["bob-fluid-mixing-furnace"] = { composition = Icons.get_fluid_mixing_furnace_icon_composition() },
	["bob-steel-chemical-furnace"] = { composition = Icons.get_steel_chemical_furnace_icon_composition() },
	["bob-fluid-chemical-furnace"] = { composition = Icons.get_fluid_chemical_furnace_icon_composition() },

	-- Assorted processes
	-- ["plastics"] = {}, -- Plastic, plastic pipes
	-- ["advanced-oil-processing"] = {}, -- oil recipes
	["bob-grinding"] = { composition = Icons.get_grinding_icon_composition() },
	["bob-polishing"] = { composition = Icons.get_polishing_icon_composition() },
	["bob-electrolysis-1"] = { composition = Icons.get_electrolysis_icon_composition() },
	["bob-electrolysis-2"] = { composition = Icons.get_electrolysis_icon_composition() },
	["bob-void-fluid"] = { composition = Icons.get_void_fluid_icon_composition() },

	-- raw gems
	["bob-gem-processing-1"] = { composition = Icons.get_gem_processing_1_icon_composition() },

	-- cut gems
	["bob-gem-processing-2"] = { composition = Icons.get_gem_processing_2_icon_composition() },

	-- polished gems
	["bob-gem-processing-3"] = { composition = Icons.get_gem_processing_3_icon_composition() },

	-- Plate processing
	-- alumina, aluminium plate
	["bob-aluminium-processing"] = { composition = Icons.get_aluminium_processing_icon_composition() },

	-- gold plate
	["bob-gold-processing"] = { composition = Icons.get_gold_processing_icon_composition() },

	-- zinc plate, brass, gunmetal, brass gear, brass pipes, brass chest
	["bob-zinc-processing"] = { composition = Icons.get_zinc_processing_icon_composition() },

	-- nickel plate
	["bob-nickel-processing"] = { composition = Icons.get_nickel_processing_icon_composition() },

	-- vanilla fine as is
	["steel-processing"] = { composition = SteelProcessing.get_steel_processing_icon_composition() },

	-- silicon boule, wager, powder
	["bob-silicon-processing"] = { composition = Icons.get_silicon_processing_icon_composition() },

	-- invar plate
	["bob-invar-processing"] = { composition = Icons.get_invar_processing_icon_composition() },

	-- lead plate, lead oxide
	["bob-lead-processing"] = { composition = Icons.get_lead_processing_icon_composition() },

	-- cobalt oxide, cobalt plate, copper plate from cobalt, cobalt steel plate, gear, bearing, ball bearing
	["bob-cobalt-processing"] = { composition = Icons.get_cobalt_processing_icon_composition() },

	-- nitinol plate, gear, bearing, ball,. pipes
	["bob-nitinol-processing"] = { composition = Icons.get_nitinol_processing_icon_composition() },

	-- titanium plate, gear, ball, bearing, pipes, chest
	["bob-titanium-processing"] = { composition = SteelProcessing.get_titanium_processing_icon_composition() },

	-- tungsten plate, gear, pipe, acid, oxide, powdered
	-- copper-tungsten, tungsten carbide, c-tun-pipes (Bob's mods 2.1+)
	["bob-tungsten-processing"] = { composition = SteelProcessing.get_tungsten_processing_icon_composition() },

	["bob-alloy-processing"] = { composition = Icons.get_alloy_processing_icon_composition() },

	-- silicon nitride, ceramic bearing, ball bearing, pipes
	["bob-ceramics"] = { composition = Icons.get_ceramics_icon_composition() },

	-- Chemicals and fluids processing

	-- hydro chloride, calcium, ferric chloride, limestone, carbon dioxide,
	["bob-chemical-processing-2"] = { composition = Icons.get_chemical_processing_2_icon_composition() },

	-- lithium, lithium chloride, perchlorate, sodium chlorate, perchlorate, (Bob's revamp does something to this?)
	["bob-lithium-processing"] = { composition = Icons.get_lithium_processing_icon_composition() },

	-- gas cans
	["bob-gas-canisters"] = { composition = Icons.get_gas_canisters_icon_composition() },

	-- fluids: nitrogen, nitrogen-dioxide, nitric acid, ammonia, nitric oxide, hydrogen peroxide
	-- ["nitrogen-processing"] = {}, -- Molecule.

	-- heavy water
	-- ["heavy-water-processing"] = {}, -- Molecule.

	-- heavy water electrolysis
	-- ["deuterium-processing"] = {}, -- Molecule.

	-- sulfur, sulfuric acid, sulfur-dioxide, hydrogen-sulfide, hydrogen-peroxide, petroleum-gas
	-- ["sulfur-processing"] = {}, -- Leave as is.

	-- glycerol, nitroglycerin, sulfuric and nitric acid
	-- ["nitroglycerin-processing"] = {}, -- Part of warfare.

	-- Alien plates
	["bob-alien-blue-research"] = get_alien_research_definition("blue"),
	["bob-alien-orange-research"] = get_alien_research_definition("orange"),
	["bob-alien-purple-research"] = get_alien_research_definition("purple"),
	["bob-alien-yellow-research"] = get_alien_research_definition("yellow"),
	["bob-alien-green-research"] = get_alien_research_definition("green"),
	["bob-alien-red-research"] = get_alien_research_definition("red"),
}

-- Handle deuterium's default process color
if _framework.settings.get_value("bobmods-plates-bluedeuterium") == true then
	definitions["bob-deuterium-fuel-reprocessing"] =
		{ composition = Icons.get_deuterium_fuel_reprocessing_blue_icon_composition() }
else
	definitions["bob-deuterium-fuel-reprocessing"] =
		{ composition = Icons.get_deuterium_fuel_reprocessing_pink_icon_composition() }
end

-- Angel's Compatibility
if mods["angelssmelting"] then
	-- Use metal-mixing sprites to be consistent with new "Filtering Furnace" progression
	technologies["bob-multi-purpose-furnace-1"].module = FurnaceElectricMixing
	technologies["bob-multi-purpose-furnace-2"].module = FurnaceElectricMixing
end

for name, options in pairs(technologies) do
	local tint = options.tint or _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition({ tint = tint }) }
end

for name, options in pairs(air_compressors) do
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { icon_data = get_air_compressor_icon_data(tint) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)

-- Prefer the technology icon added for bobelectronics
if not mods["bobelectronics"] then
	---@type CreateIconsFromListInputs
	local inputs = {
		mod = "bobs",
		group = "plates",
		type = "technology",
		flat_icon = true,
	}

	reskins.internal.create_icons_from_list({
		["bob-advanced-processing-unit"] = {
			subgroup = "processing-steps",
			technology_icon_size = 256,
		},
	}, inputs)
end
