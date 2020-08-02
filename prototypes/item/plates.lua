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
    ["solder-alloy"] = {subfolder = "plates"},
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

    -- Miscellaneous
    ["glass"] = {subfolder = "intermediaries"},
    ["carbon"] = {subfolder = "intermediaries"},
    ["rubber"] = {subfolder = "intermediaries"},
    ["resin"] = {subfolder = "intermediaries"},
    ["enriched-fuel"] = {subfolder = "fuels"},
    ["liquid-fuel"] = {subfolder = "fluids", type = "fluid"},

    ----------------------------------------------------------------------------------------------------
    -- Recipes
    ----------------------------------------------------------------------------------------------------
    -- Plates
    ["cobalt-oxide-from-copper"] = {type = "recipe", subfolder = "plates"},
    ["silver-from-lead"] = {type = "recipe", subfolder = "plates"},

    -- Nuclear
    ["thorium-processing"] = {type = "recipe", subfolder = "nuclear"},
    ["thorium-fuel-reprocessing"] = {type = "recipe", subfolder = "nuclear", image = "thorium-nuclear-fuel-reprocessing"},
    ["deuterium-fuel-reprocessing"] = {type = "recipe", subfolder = "nuclear", image = "deuterium-nuclear-fuel-reprocessing-pink"},
    ["bobingabout-enrichment-process"] = {type = "recipe", subfolder = "nuclear"},

    -- Solid Fuels
    ["solid-fuel-from-hydrogen"] = {type = "recipe", subfolder = "fuels"},
    ["solid-fuel-from-sour-gas"] = {type = "recipe", subfolder = "fuels"},
    ["enriched-fuel-from-hydrazine"] = {type = "recipe", subfolder = "fuels"},
    ["enriched-fuel-from-liquid-fuel"] = {type = "recipe", subfolder = "fuels"},

    -- Miscellaneous
    ["bob-resin-wood"] = {type = "recipe", subfolder = "intermediaries"},
    ["bob-resin-oil"] = {type = "recipe", subfolder = "intermediaries"},
}

-- Handle deuterium color
if reskins.lib.setting("bobmods-plates-bluedeuterium") == true then 
    intermediaries["deuterium-fuel-cell"].image = "deuterium-fuel-cell-blue"
    intermediaries["used-up-deuterium-fuel-cell"].image = "used-up-deuterium-fuel-cell-blue"
end

-- Handle nuclear update
if reskins.lib.setting("bobmods-plates-nuclearupdate") == true then
    intermediaries["nuclear-fuel-reprocessing"] = {type = "recipe", subfolder = "nuclear"}

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

for name, map in pairs(intermediaries) do
    -- Fetch intermediary
    local intermediary = data.raw.item[name]
    if map.type then
        intermediary = data.raw[map.type][name]
    end

    -- Check if intermediary exists, if not, skip this iteration
    if not intermediary then goto continue end

    -- Parse map
    local image = map.image or name
    inputs.type = map.type or nil

    inputs.icon_filename = inputs.directory.."/graphics/icons/plates/"..map.subfolder.."/"..image..".png"

    reskins.lib.construct_icon(name, 0, inputs)

    -- One-off fixes
    if name == "nickel-plate" then
        reskins.lib.clear_icon_specification("bob-nickel-plate", "recipe")
    end

    -- Label to skip to next iteration
    ::continue::
end