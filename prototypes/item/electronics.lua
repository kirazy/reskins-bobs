-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobelectronics"] then return end

-- Setup inputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "electronics",
    make_icon_pictures = false,
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

local intermediaries = {
    -- Wires
    ["gilded-copper-cable"] = {subfolder = "wires", defer_to_data_final_fixes = true}, -- Angels
    ["tinned-copper-cable"] = {subfolder = "wires", defer_to_data_final_fixes = true}, -- Angels
    ["insulated-cable"] = {subfolder = "wires"},
}

-- Items and recipes shared with other mods within Bob's suite
if not mods["bobplates"] then
    -- Intermediaries
    intermediaries["solder-alloy"] = {folder = "plates", subfolder = "plates", defer_to_data_final_fixes = true} -- Angels
    intermediaries["rubber"] = {folder = "plates", subfolder = "items"}
    intermediaries["resin"] = {folder = "plates", subfolder = "items"}
    intermediaries["ferric-chloride-solution"] = {type = "fluid", folder = "plates", subfolder = "fluids"}

    -- Recipes
    intermediaries["coal-cracking"] = {type = "recipe", folder = "plates", subfolder = "recipes"}
    intermediaries["synthetic-wood"] = {type = "recipe", folder = "plates", subfolder = "recipes"}
    intermediaries["bob-resin-wood"] = {type = "recipe", folder = "plates", subfolder = "recipes"}
    intermediaries["bob-resin-oil"] = {type = "recipe", folder = "plates", subfolder = "recipes"}
end

reskins.lib.create_icons_from_list(intermediaries, inputs)