-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["vanilla-loaders-hd"] then return end
if settings.startup["reskins-lib-customize-tier-colors"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "loader",
    directory = "__vanilla-loaders-hd__",
}

local tier_map =
{
    ["basic-loader"]   = 0,
    ["loader"]         = 1,
    ["fast-loader"]    = 2,
    ["express-loader"] = 3,
    ["purple-loader"]  = 4,
    ["green-loader"]   = 5,
}

local loader_color_map_adjustments =
{
    ["basic-loader"] = {40, 40, 40},
    ["loader"] = {40, 40, 40},--{33, 47, 64},
    ["fast-loader"] = {40, 40, 40},--{33, 17, 23},
    ["express-loader"] = {40, 40, 40},--{40, 57, 56},
    ["purple-loader"] = {40, 40, 40},--{57, 30, 38},
    ["green-loader"] = {40, 40, 40},--{-13, 20, 14},
}

-- Reskin entities
for name, tier in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- Tint adjustment
    local adjusted_tint = reskins.lib.adjust_alpha(inputs.tint, 0.82)
    for n = 1, 3 do
        adjusted_tint[n] = loader_color_map_adjustments[name][n] + adjusted_tint[n]

        if adjusted_tint[n] > 255 then
            adjusted_tint[n] = 255
        elseif adjusted_tint[n] < 0 then
            adjusted_tint[n] = 0
        end

    end
    
    -- Retint the mask
    entity.structure.direction_in.sheets[2].tint = adjusted_tint
    entity.structure.direction_in.sheets[2].hr_version.tint = adjusted_tint
    entity.structure.direction_out.sheets[2].tint = adjusted_tint
    entity.structure.direction_out.sheets[2].hr_version.tint = adjusted_tint

    -- Label to skip to next iteration
    ::continue::
end