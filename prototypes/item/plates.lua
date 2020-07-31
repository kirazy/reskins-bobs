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
local plate_inputs = util.copy(inputs)

local metal_plates = {
    "aluminium-plate",
    "brass-alloy",
    "bronze-alloy",
    "cobalt-plate",
    "cobalt-steel-alloy",
    "copper-tungsten-alloy",
    "gold-plate",
    -- "gunmetal-plate",
    -- "invar-plate",
    "lead-plate",
    "lithium",
    "nickel-plate",
    "nitinol-alloy",
    -- "silicon-plate",
    -- "silver-plate",
    -- "solder-plate",
    -- "steel-plate",
    "tin-plate",
    "titanium-plate",
    -- "tungsten-carbide-plate",
    "tungsten-plate",
    -- "zinc-plate",
    "alien-orange-alloy",
    "alien-blue-alloy",
}

for _, name in pairs(metal_plates) do
    -- Fetch item
    local item = data.raw.item[name]

    -- Check if item exists, if not, skip this iteration
    if not item then goto continue end

    plate_inputs.icon_filename = plate_inputs.directory.."/graphics/icons/plates/plates/"..name..".png"

    reskins.lib.construct_icon(name, 0, plate_inputs)

    if name == "nickel-plate" then
        -- One-off fixes
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