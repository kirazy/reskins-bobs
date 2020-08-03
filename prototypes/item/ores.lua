-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobores"] then return end

-- Setup inputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "ores",
    make_icon_pictures = false,
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

local intermediaries = {}

-- Items and recipes shared with other mods within Bob's suite
if not mods["bobplates"] then
    -- Intermediaries
    intermediaries["lithia-water"] = {type = "fluid", folder = "plates", subfolder = "fluids", defer_to_data_updates = true} -- Angels
end

reskins.lib.create_icons_from_list(intermediaries, inputs)