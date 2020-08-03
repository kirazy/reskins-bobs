-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobgreenhouse"] then return end

-- Setup inputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "greenhouse",
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

local intermediaries = {
    ["seedling"] = {subfolder = "items"},
    ["fertiliser"] = {subfolder = "items"},
    ["wood-pellets"] = {subfolder = "items"},
    ["bob-basic-greenhouse-cycle"] = {type = "recipe", subfolder = "recipes"},
    ["bob-advanced-greenhouse-cycle"] = {type = "recipe", subfolder = "recipes"},
}

reskins.lib.create_icons_from_list(intermediaries, inputs)