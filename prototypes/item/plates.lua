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

-- Metal plates
local intermediaries_inputs = util.copy(inputs)

local intermediaries = {
    -- Plates
    ["aluminium-plate"] = "plates",
    ["brass-alloy"] = "plates",
    ["bronze-alloy"] = "plates",
    ["cobalt-plate"] = "plates",
    ["cobalt-steel-alloy"] = "plates",
    ["copper-tungsten-alloy"] = "plates",
    ["gold-plate"] = "plates",
    ["gunmetal-alloy"] = "plates",
    ["invar-alloy"] = "plates",
    ["lead-plate"] = "plates",
    ["lithium"] = "plates",
    ["nickel-plate"] = "plates",
    ["nitinol-alloy"] = "plates",
    -- ["silicon-plate"] = "plates",
    ["silver-plate"] = "plates",
    ["solder-alloy"] = "plates",
    ["tin-plate"] = "plates",
    ["titanium-plate"] = "plates",
    ["tungsten-carbide"] = "plates",
    ["tungsten-plate"] = "plates",
    ["zinc-plate"] = "plates",
    ["alien-orange-alloy"] = "plates",
    ["alien-blue-alloy"] = "plates",

    -- Bearings
    ["ceramic-bearing"] = "bearings",
    ["cobalt-steel-bearing"] = "bearings",
    ["nitinol-bearing"] = "bearings",
    ["steel-bearing"] = "bearings",
    ["titanium-bearing"] = "bearings",

    -- Bearing Balls
    ["ceramic-bearing-ball"] = "bearing-balls",
    ["cobalt-steel-bearing-ball"] = "bearing-balls",
    ["nitinol-bearing-ball"] = "bearing-balls",
    ["steel-bearing-ball"] = "bearing-balls",
    ["titanium-bearing-ball"] = "bearing-balls",
    
    -- Gear Wheels
    ["brass-gear-wheel"] = "gears",
    ["cobalt-steel-gear-wheel"] = "gears",
    ["nitinol-gear-wheel"] = "gears",
    ["steel-gear-wheel"] = "gears",
    ["titanium-gear-wheel"] = "gears",
    ["tungsten-gear-wheel"] = "gears",
}

for name, subfolder in pairs(intermediaries) do
    -- Fetch item
    local item = data.raw.item[name]

    -- Check if item exists, if not, skip this iteration
    if not item then goto continue end

    intermediaries_inputs.icon_filename = intermediaries_inputs.directory.."/graphics/icons/plates/"..subfolder.."/"..name..".png"

    reskins.lib.construct_icon(name, 0, intermediaries_inputs)

    -- One-off fixes
    if name == "nickel-plate" then
        
        data.raw.recipe["bob-nickel-plate"].icon = nil
        data.raw.recipe["bob-nickel-plate"].icon_size = nil
        data.raw.recipe["bob-nickel-plate"].icon_mipmaps = nil
        data.raw.recipe["bob-nickel-plate"].icons = nil
    end

    -- Label to skip to next iteration
    ::continue::
end

local dual_product_recipes = {
    ["cobalt-oxide-from-copper"] = {"copper-plate", "cobalt-oxide"},
    ["silver-from-lead"] = {"lead-plate", "silver-ore"},
}