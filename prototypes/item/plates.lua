-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.plates.items) then
	return
end

local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	sprites = require("__reskins-assets-api__.api.sprites"),
}
local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local BearingBalls = require("__reskins-assets-api__.assets.bobs.items.bearing-balls")
local Bearings = require("__reskins-assets-api__.assets.bobs.items.bearings")
local Circuits = require("__reskins-assets-api__.assets.bobs.items.circuits")
local Fluids = require("__reskins-assets-api__.assets.bobs.items.fluids")
local FuelCells = require("__reskins-assets-api__.assets.bobs.items.fuel-cells")
local Gears = require("__reskins-assets-api__.assets.bobs.items.gears")
local Gems = require("__reskins-assets-api__.assets.bobs.items.gems")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")
local Isotopes = require("__reskins-assets-api__.assets.bobs.items.isotopes")
local Plates = require("__reskins-assets-api__.assets.bobs.items.plates")

---Gets the definition of the plate for the given `material`.
---@param material string
---@return TieredIconDefinition
local function plate(material)
	return { composition = Plates.get_icon_composition({ material = material }) }
end

---Gets the definition of the alloy for the given `alloy`.
---@param alloy string
---@return TieredIconDefinition
local function alloy(alloy)
	return { composition = Plates.get_alloy_icon_composition({ alloy = alloy }) }
end

---Gets the definition of the given fuel cell `composition`, with the light of a fuel cell in its pictures.
---@param composition IconComposition The icon of the fuel cell.
---@return TieredIconDefinition
local function fuel_cell(composition)
	return {
		composition = composition:add_light(_assets.sprites.get_sprite_light_layer(_assets.defines.light.fuel_cell)),
	}
end

---@type table<string, TieredIconDefinition>
local items = {
	-- Plates
	["bob-aluminium-plate"] = plate("aluminium"),
	["bob-cobalt-plate"] = plate("cobalt"),
	["bob-copper-tungsten-alloy"] = alloy("copper-tungsten"),
	["bob-gold-plate"] = plate("gold"), -- Shared with Angels
	["bob-lead-plate"] = plate("lead"),
	["lithium-plate"] = plate("lithium"),
	["bob-nickel-plate"] = plate("nickel"),
	["bob-silver-plate"] = plate("silver"),
	["bob-solder-alloy"] = alloy("solder"), -- Shared with Bob's Electronics
	["bob-tin-plate"] = plate("tin"),
	["bob-titanium-plate"] = plate("titanium"),
	["tungsten-carbide"] = plate("tungsten-carbide"),
	["tungsten-plate"] = plate("tungsten"),
	["bob-zinc-plate"] = plate("zinc"),
	["bob-alien-orange-alloy"] = alloy("alien-orange"),
	["bob-alien-blue-alloy"] = alloy("alien-blue"),

	-- Bearings
	["bob-cobalt-steel-bearing"] = { composition = Bearings.get_icon_composition({ material = "cobalt-steel" }) },
	["bob-nitinol-bearing"] = { composition = Bearings.get_icon_composition({ material = "nitinol" }) },
	["bob-steel-bearing"] = { composition = Bearings.get_icon_composition({ material = "steel" }) },
	["bob-titanium-bearing"] = { composition = Bearings.get_icon_composition({ material = "titanium" }) },

	-- Bearing Balls
	["bob-cobalt-steel-bearing-ball"] = {
		composition = BearingBalls.get_icon_composition({ material = "cobalt-steel" }),
	},
	["bob-nitinol-bearing-ball"] = { composition = BearingBalls.get_icon_composition({ material = "nitinol" }) },
	["bob-steel-bearing-ball"] = { composition = BearingBalls.get_icon_composition({ material = "steel" }) },
	["bob-titanium-bearing-ball"] = { composition = BearingBalls.get_icon_composition({ material = "titanium" }) },

	-- Gear Wheels
	["bob-brass-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "brass" }) },
	["bob-cobalt-steel-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "cobalt-steel" }) },
	["bob-nitinol-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "nitinol" }) },
	["bob-steel-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "steel" }) },
	["bob-titanium-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "titanium" }) },
	["bob-tungsten-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "tungsten" }) },

	-- Nuclear
	["bob-plutonium-fuel-cell"] = fuel_cell(FuelCells.get_plutonium_fuel_cell_icon_composition()),
	["bob-thorium-fuel-cell"] = fuel_cell(FuelCells.get_thorium_fuel_cell_icon_composition()),
	["bob-thorium-plutonium-fuel-cell"] = fuel_cell(FuelCells.get_thorium_plutonium_fuel_cell_icon_composition()),
	["bob-deuterium-fuel-cell"] = fuel_cell(FuelCells.get_deuterium_fuel_cell_pink_icon_composition()),
	["bob-deuterium-fuel-cell-2"] = fuel_cell(FuelCells.get_deuterium_fuel_cell_2_pink_icon_composition()),
	["bob-depleted-thorium-fuel-cell"] = { composition = FuelCells.get_depleted_thorium_fuel_cell_icon_composition() },
	["bob-depleted-deuterium-fuel-cell"] = {
		composition = FuelCells.get_depleted_deuterium_fuel_cell_pink_icon_composition(),
	},
	["bob-plutonium-239"] = { composition = Isotopes.get_plutonium_239_icon_composition() },
	["bob-thorium-232"] = { composition = Isotopes.get_thorium_232_icon_composition() },

	-- Miscellaneous Items
	["bob-silicon-wafer"] = { composition = Icons.get_silicon_wafer_icon_composition() },
	["bob-silicon-plate"] = { composition = Icons.get_silicon_icon_composition() },
	["bob-glass"] = { composition = Icons.get_glass_icon_composition() },
	["carbon"] = { composition = Icons.get_carbon_icon_composition() },
	["bob-rubber"] = { composition = Icons.get_rubber_icon_composition() }, -- Shared with Bob's Electronics, Angels
	["bob-resin"] = { composition = Icons.get_resin_icon_composition() }, -- Shared with Bob's Electronics
	["bob-enriched-fuel"] = { composition = Icons.get_enriched_fuel_icon_composition() },
	["bob-grinding-wheel"] = { composition = Icons.get_grinding_wheel_icon_composition() },
	["bob-polishing-wheel"] = { composition = Icons.get_polishing_wheel_icon_composition() },
	["bob-polishing-compound"] = { composition = Icons.get_polishing_compound_icon_composition() },

	-- Powders -- TODO: https://github.com/kirazy/reskins-bobs/issues/31 Model and render out powder/particulate icons
	["bob-calcium-chloride"] = { composition = Icons.get_calcium_chloride_icon_composition() },
	["bob-sodium-hydroxide"] = { composition = Icons.get_sodium_hydroxide_icon_composition() },
	-- ["bob-lithium-chloride"] = {subgroup = "powders"}, -- Needs made-for-resolution icon
	-- ["bob-lithium-cobalt-oxide"] = {subgroup = "powders"}, -- Needs made-for-resolution icon
	-- ["bob-lithium-perchlorate"] = {subgroup = "powders"}, -- Needs made-for-resolution icon
	["bob-salt"] = { composition = Icons.get_salt_icon_composition() },
	["bob-silicon-carbide"] = { composition = Icons.get_silicon_carbide_icon_composition() },
	["bob-silicon-nitride"] = { composition = Icons.get_silicon_nitride_icon_composition() },
	-- ["bob-silver-oxide"] = {subgroup = "powders"}, -- Needs made-for-resolution icon

	-- Gemstones
	["bob-ruby-5"] = { composition = Gems.get_ruby_5_icon_composition() },
	["bob-sapphire-5"] = { composition = Gems.get_sapphire_5_icon_composition() },
	["bob-emerald-5"] = { composition = Gems.get_emerald_5_icon_composition() },
	["bob-amethyst-5"] = { composition = Gems.get_amethyst_5_icon_composition() },
	["bob-topaz-5"] = { composition = Gems.get_topaz_5_icon_composition() },
	["bob-diamond-5"] = { composition = Gems.get_diamond_5_icon_composition() },
}

---@type table<string, TieredIconDefinition>
local fluids = {
	["bob-liquid-air"] = { composition = Icons.get_liquid_air_icon_composition() },
	["bob-liquid-fuel"] = { composition = Fluids.get_liquid_fuel_icon_composition() },
	-- Shared with Bob's Electronics
	["bob-ferric-chloride-solution"] = { composition = Fluids.get_ferric_chloride_solution_icon_composition() },
	["bob-alien-acid"] = { composition = Fluids.get_alien_acid_icon_composition() },
	["bob-alien-explosive"] = { composition = Fluids.get_alien_explosive_icon_composition() },
	["bob-alien-fire"] = { composition = Fluids.get_alien_fire_icon_composition() },
	["bob-alien-poison"] = { composition = Fluids.get_alien_poison_icon_composition() },
}

-- Separate so that items and recipes with the same name can be handled differently.
---@type table<string, TieredIconDefinition>
local recipes = {
	-- Plates
	["bob-cobalt-oxide-from-copper"] = { composition = Icons.get_cobalt_oxide_from_copper_icon_composition() },
	["bob-silver-from-lead"] = { composition = Icons.get_silver_from_lead_icon_composition() },

	-- Nuclear
	["bob-thorium-processing"] = { composition = Icons.get_thorium_processing_icon_composition() },
	["bob-thorium-fuel-reprocessing"] = { composition = Icons.get_thorium_fuel_reprocessing_icon_composition() },
	["bob-deuterium-fuel-reprocessing"] = {
		composition = Icons.get_deuterium_fuel_reprocessing_pink_icon_composition(),
	},
	["bobingabout-enrichment-process"] = { composition = Icons.get_bobingabout_enrichment_process_icon_composition() },

	-- Solid Fuels
	["bob-solid-fuel-from-hydrogen"] = { composition = Icons.get_solid_fuel_from_hydrogen_icon_composition() },
	-- Shared with Bob's Revamp
	["bob-solid-fuel-from-sour-gas"] = { composition = Icons.get_solid_fuel_from_sour_gas_icon_composition() },
	["bob-enriched-fuel"] = { composition = Icons.get_enriched_fuel_from_light_oil_icon_composition() },
	["bob-enriched-fuel-from-hydrazine"] = {
		composition = Icons.get_enriched_fuel_from_hydrazine_icon_composition(),
	},

	-- Chemicals and Fluids
	-- ["sulfuric-nitric-acid"] = {type = "recipe", subgroup = "recipes"},
	-- ["pure-water"] = {type = "recipe", subgroup = "recipes"},
	-- ["pure-water-from-lithia"] = {type = "recipe", subgroup = "recipes"},
	["bob-coal-cracking"] = { composition = Icons.get_coal_cracking_icon_composition() }, -- Shared with Bob's Electronics
	["bob-petroleum-gas-cracking"] = { composition = Icons.get_petroleum_gas_cracking_icon_composition() },

	-- Wood
	["bob-resin-wood"] = { composition = Icons.get_resin_wood_icon_composition() }, -- Shared with Bob's Electronics
	["bob-resin-oil"] = { composition = Icons.get_resin_oil_icon_composition() }, -- Shared with Bob's Electronics
	-- Shared with Bob's Electronics
	["bob-synthetic-wood"] = { composition = Icons.get_synthetic_wood_icon_composition() },
}

-- Handle deuterium color
local is_deuterium_blue = _framework.settings.get_value("bobmods-plates-bluedeuterium") == true

if is_deuterium_blue then
	items["bob-deuterium-fuel-cell"] = fuel_cell(FuelCells.get_deuterium_fuel_cell_blue_icon_composition())
	items["bob-deuterium-fuel-cell-2"] = fuel_cell(FuelCells.get_deuterium_fuel_cell_2_blue_icon_composition())
	items["bob-depleted-deuterium-fuel-cell"] = {
		composition = FuelCells.get_depleted_deuterium_fuel_cell_blue_icon_composition(),
	}
end

-- Handle deuterium's default process color
if is_deuterium_blue then
	recipes["bob-deuterium-fuel-reprocessing"] = {
		composition = Icons.get_deuterium_fuel_reprocessing_blue_icon_composition(),
	}
end

-- Advanced processing unit absent Bob's Electronics
if not mods["bobelectronics"] then
	items["bob-advanced-processing-unit"] = { composition = Circuits.get_advanced_processing_unit_icon_composition() }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
_framework.tiers.assign_icons_with_tier_labels("fluid", fluids)
_framework.tiers.assign_icons_with_tier_labels("recipe", recipes)

-- One-off fixes
if data.raw.item["bob-nickel-plate"] then
	_sprite_utils.icons.clear_icon_from_named_prototype("bob-nickel-plate", "recipe")
end
if data.raw.fluid["bob-liquid-air"] then
	_sprite_utils.icons.clear_icon_from_named_prototype("bob-liquid-air", "recipe")
end
if data.raw.item["bob-lead-oxide"] then
	_sprite_utils.icons.clear_icon_from_named_prototype("bob-lead-oxide-2", "recipe")
end
