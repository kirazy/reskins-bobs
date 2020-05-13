-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["vanilla-loaders-hd"] then return end
if settings.startup["reskins-lib-customize-tier-colors"].value == false then return end

-- Set input parameters
local inputs = {
    type = "loader",
    directory = "__vanilla-loaders-hd__",
}

local tier_map = {
    ["basic-loader"]   = {0, 1},
    ["loader"]         = {1, 1},
    ["fast-loader"]    = {2, 2},
    ["express-loader"] = {3, 2},
    ["purple-loader"]  = {4, 2},
    ["green-loader"]   = {5, 2},
}

local color_adjustment = 40/255

-- Reskin entities
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    variant = map[2]

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- Tint adjustment
    adjusted_tint = reskins.lib.adjust_tint(inputs.tint, color_adjustment, 0.82)
    
    -- Retint the mask
    entity.structure.direction_in.sheets[2].tint = adjusted_tint
    entity.structure.direction_in.sheets[2].hr_version.tint = adjusted_tint
    entity.structure.direction_out.sheets[2].tint = adjusted_tint
    entity.structure.direction_out.sheets[2].hr_version.tint = adjusted_tint

    -- Apply belt set
    entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(adjusted_tint, variant)

    -- Label to skip to next iteration
    ::continue::
end