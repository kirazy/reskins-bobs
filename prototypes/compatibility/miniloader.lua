-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["miniloader"] then return end
if settings.startup["reskins-lib-customize-tier-colors"].value == false then return end

-- Set input parameters
local inputs = {}
-- {
--     type = "loader-1x1",
--     -- directory = "__vanilla-loaders-hd__",
-- }

local tier_map =
{
    -- 1x1 Loader Entities
    ["basic-miniloader-loader"]           = {0, 1},
    ["chute-miniloader-loader"]           = {0, 1},
    ["miniloader-loader"]                 = {1, 1},
    ["fast-miniloader-loader"]            = {2, 2},
    ["express-miniloader-loader"]         = {3, 2},
    ["turbo-miniloader-loader"]           = {4, 2},
    ["ultimate-miniloader-loader"]        = {5, 2},
    ["filter-miniloader-loader"]          = {1, 1},
    ["fast-filter-miniloader-loader"]     = {2, 2},
    ["express-filter-miniloader-loader"]  = {3, 2},
    ["turbo-filter-miniloader-loader"]    = {4, 2},
    ["ultimate-filter-miniloader-loader"] = {5, 2},

    -- Inserter Entities
    ["basic-miniloader-inserter"]           = {0},
    ["chute-miniloader-inserter"]           = {0},
    ["miniloader-inserter"]                 = {1},
    ["fast-miniloader-inserter"]            = {2},
    ["express-miniloader-inserter"]         = {3},
    ["turbo-miniloader-inserter"]           = {4},
    ["ultimate-miniloader-inserter"]        = {5},
    ["filter-miniloader-inserter"]          = {1},
    ["fast-filter-miniloader-inserter"]     = {2},
    ["express-filter-miniloader-inserter"]  = {3},
    ["turbo-filter-miniloader-inserter"]    = {4},
    ["ultimate-filter-miniloader-inserter"] = {5},
}

local color_adjustment = 40

-- Reskin entities
for name, map in pairs(tier_map) do
    if not string.find(name, "inserter") then
        inputs.type = "loader-1x1"
    else
        inputs.type = "inserter"
    end

    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    variant = map[2] or nil

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- Tint adjustment
    local adjusted_tint = reskins.lib.adjust_alpha(inputs.tint, 0.82)
    for n = 1, 3 do
        adjusted_tint[n] = color_adjustment + adjusted_tint[n]

        if adjusted_tint[n] > 255 then
            adjusted_tint[n] = 255
        elseif adjusted_tint[n] < 0 then
            adjusted_tint[n] = 0
        end

    end
    
    -- Retint the mask
    if not string.find(name, "inserter") then
        entity.structure.direction_in.sheets[2].tint = adjusted_tint
        entity.structure.direction_in.sheets[2].hr_version.tint = adjusted_tint
        entity.structure.direction_out.sheets[2].tint = adjusted_tint
        entity.structure.direction_out.sheets[2].hr_version.tint = adjusted_tint
    else
        entity.platform_picture.sheets[2].tint = adjusted_tint
        entity.platform_picture.sheets[2].hr_version.tint = adjusted_tint
    end

    -- Apply belt set
    if variant then
        entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(adjusted_tint, variant)
    end

    -- Label to skip to next iteration
    ::continue::
end