-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobplates"] then return end

-- Setup inputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "plates",
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

local intermediaries = {
    ----------------------------------------------------------------------------------------------------
    -- Intermediaries
    ----------------------------------------------------------------------------------------------------
    -- Plates
    ["aluminium-plate"] = {subfolder = "plates"},
    ["brass-alloy"] = {subfolder = "plates"},
    ["bronze-alloy"] = {subfolder = "plates"},
    ["cobalt-plate"] = {subfolder = "plates"},
    ["cobalt-steel-alloy"] = {subfolder = "plates"},
    ["copper-tungsten-alloy"] = {subfolder = "plates"},
    ["gold-plate"] = {subfolder = "plates"},
    ["gunmetal-alloy"] = {subfolder = "plates"},
    ["invar-alloy"] = {subfolder = "plates"},
    ["lead-plate"] = {subfolder = "plates"},
    ["lithium"] = {subfolder = "plates"},
    ["nickel-plate"] = {subfolder = "plates"},
    ["nitinol-alloy"] = {subfolder = "plates"},
    -- ["silicon-plate"] = {subfolder = "plates"},
    ["silver-plate"] = {subfolder = "plates"},
    ["solder-alloy"] = {subfolder = "plates"}, -- Shared with Bob's Electronics
    ["tin-plate"] = {subfolder = "plates"},
    ["titanium-plate"] = {subfolder = "plates"},
    ["tungsten-carbide"] = {subfolder = "plates"},
    ["tungsten-plate"] = {subfolder = "plates"},
    ["zinc-plate"] = {subfolder = "plates"},
    ["alien-orange-alloy"] = {subfolder = "plates"},
    ["alien-blue-alloy"] = {subfolder = "plates"},

    -- Bearings
    ["ceramic-bearing"] = {subfolder = "bearings"},
    ["cobalt-steel-bearing"] = {subfolder = "bearings"},
    ["nitinol-bearing"] = {subfolder = "bearings"},
    ["steel-bearing"] = {subfolder = "bearings"},
    ["titanium-bearing"] = {subfolder = "bearings"},

    -- Bearing Balls
    ["ceramic-bearing-ball"] = {subfolder = "bearing-balls"},
    ["cobalt-steel-bearing-ball"] = {subfolder = "bearing-balls"},
    ["nitinol-bearing-ball"] = {subfolder = "bearing-balls"},
    ["steel-bearing-ball"] = {subfolder = "bearing-balls"},
    ["titanium-bearing-ball"] = {subfolder = "bearing-balls"},
    
    -- Gear Wheels
    ["brass-gear-wheel"] = {subfolder = "gears"},
    ["cobalt-steel-gear-wheel"] = {subfolder = "gears"},
    ["nitinol-gear-wheel"] = {subfolder = "gears"},
    ["steel-gear-wheel"] = {subfolder = "gears"},
    ["titanium-gear-wheel"] = {subfolder = "gears"},
    ["tungsten-gear-wheel"] = {subfolder = "gears"},

    -- Nuclear
    ["plutonium-fuel-cell"] = {subfolder = "nuclear"},
    ["thorium-fuel-cell"] = {subfolder = "nuclear"},
    ["thorium-plutonium-fuel-cell"] = {subfolder = "nuclear"},
    ["deuterium-fuel-cell"] = {subfolder = "nuclear", image = "deuterium-fuel-cell-pink"},
    ["used-up-thorium-fuel-cell"] = {subfolder = "nuclear"},
    ["used-up-deuterium-fuel-cell"] = {subfolder = "nuclear", image = "used-up-deuterium-fuel-cell-pink"},
    ["plutonium-239"] = {subfolder = "nuclear"},
    ["thorium-232"] = {subfolder = "nuclear"},

    -- Fluids
    ["liquid-fuel"] = {type = "fluid", subfolder = "fluids"},
    ["ferric-chloride-solution"] = {type = "fluid", subfolder = "fluids"}, -- Shared with Bob's Electronics
    ["lithia-water"] = {type = "fluid", subfolder = "fluids"}, -- Shared with Bob's Ores
    ["alien-acid"] = {type = "fluid", subfolder = "fluids"},
    ["alien-explosive"] = {type = "fluid", subfolder = "fluids"},
    ["alien-fire"] = {type = "fluid", subfolder = "fluids"},
    ["alien-poison"] = {type = "fluid", subfolder = "fluids"},

    -- Miscellaneous Items
    ["glass"] = {subfolder = "items"},
    ["carbon"] = {subfolder = "items"},
    ["rubber"] = {subfolder = "items"}, -- Shared with Bob's Electronics
    ["resin"] = {subfolder = "items"}, -- Shared with Bob's Electronics
    ["enriched-fuel"] = {subfolder = "items"},

    ----------------------------------------------------------------------------------------------------
    -- Recipes
    ----------------------------------------------------------------------------------------------------
    -- Plates
    ["cobalt-oxide-from-copper"] = {type = "recipe", subfolder = "recipes"},
    ["silver-from-lead"] = {type = "recipe", subfolder = "recipes"},

    -- Nuclear
    ["thorium-processing"] = {type = "recipe", subfolder = "recipes"},
    ["thorium-fuel-reprocessing"] = {type = "recipe", subfolder = "recipes", image = "thorium-nuclear-fuel-reprocessing"},
    ["deuterium-fuel-reprocessing"] = {type = "recipe", subfolder = "recipes", image = "deuterium-nuclear-fuel-reprocessing-pink"},
    ["bobingabout-enrichment-process"] = {type = "recipe", subfolder = "recipes"},

    -- Solid Fuels
    ["solid-fuel-from-hydrogen"] = {type = "recipe", subfolder = "recipes"},
    ["solid-fuel-from-sour-gas"] = {type = "recipe", subfolder = "recipes"}, -- Shared with Bob's Revamp
    ["enriched-fuel-from-hydrazine"] = {type = "recipe", subfolder = "recipes"},
    ["enriched-fuel-from-liquid-fuel"] = {type = "recipe", subfolder = "recipes"},

    -- Chemicals and Fluids
    -- ["sulfuric-nitric-acid"] = {type = "recipe", subfolder = "recipes"},
    -- ["pure-water"] = {type = "recipe", subfolder = "recipes"},
    -- ["pure-water-from-lithia"] = {type = "recipe", subfolder = "recipes"},
    ["coal-cracking"] = {type = "recipe", subfolder = "recipes"}, -- Shared with Bob's Electronics
    ["petroleum-gas-cracking"] = {type = "recipe", subfolder = "recipes"},

    -- Wood
    ["bob-resin-wood"] = {type = "recipe", subfolder = "recipes"}, -- Shared with Bob's Electronics
    ["bob-resin-oil"] = {type = "recipe", subfolder = "recipes"}, -- Shared with Bob's Electronics
    ["synthetic-wood"] = {type = "recipe", subfolder = "recipes"}, -- Shared with Bob's Electronics
}

-- Handle deuterium color
if reskins.lib.setting("bobmods-plates-bluedeuterium") == true then 
    intermediaries["deuterium-fuel-cell"].image = "deuterium-fuel-cell-blue"
    intermediaries["used-up-deuterium-fuel-cell"].image = "used-up-deuterium-fuel-cell-blue"
end

-- Handle nuclear update
if reskins.lib.setting("bobmods-plates-nuclearupdate") == true then
    intermediaries["nuclear-fuel-reprocessing"] = {type = "recipe", subfolder = "recipes", defer_to_data_updates = true}

    -- Handle deuterium's default process color
    if reskins.lib.setting("bobmods-plates-bluedeuterium") == true then
        intermediaries["deuterium-fuel-reprocessing"].image = "deuterium-nuclear-fuel-reprocessing-blue"
    end
else
    intermediaries["thorium-fuel-reprocessing"].image = "thorium-nuclear-fuel-reprocessing-alternate"

    -- Handle deuterium's alternate process color
    if reskins.lib.setting("bobmods-plates-bluedeuterium") == true then
        intermediaries["deuterium-fuel-reprocessing"].image = "deuterium-nuclear-fuel-reprocessing-alternate-blue"
    else
        intermediaries["deuterium-fuel-reprocessing"].image = "deuterium-nuclear-fuel-reprocessing-alternate-pink"
    end
    
end

reskins.lib.create_icons_from_list(intermediaries, inputs)

-- One-off fixes
if data.raw.item["nickel-plate"] then
    reskins.lib.clear_icon_specification("bob-nickel-plate", "recipe")
end