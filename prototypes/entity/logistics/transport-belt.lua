-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end
if settings.startup["reskins-lib-customize-tier-colors"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "transport-belt",
    root_name = "transport-belt",
    directory = reskins.bobs.directory,
    mod = "logistics",
    -- particles = {["medium"] = 3, ["small"] = 2}
}

local tier_map =
{
    ["basic-transport-belt"]    = {0, 1},
    ["transport-belt"]          = {1, 1},
    ["fast-transport-belt"]     = {2, 2},
    ["express-transport-belt"]  = {3, 2},
    ["turbo-transport-belt"]    = {4, 2},
    ["ultimate-transport-belt"] = {5, 2},
}

local color_adjustment = 40

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
    local adjusted_tint = reskins.lib.adjust_alpha(inputs.tint, 0.82)
    for n = 1, 3 do
        adjusted_tint[n] = color_adjustment + adjusted_tint[n]

        if adjusted_tint[n] > 255 then
            adjusted_tint[n] = 255
        elseif adjusted_tint[n] < 0 then
            adjusted_tint[n] = 0
        end
    end
    
    -- Reskin entities
    entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(adjusted_tint, variant)

    -- Label to skip to next iteration
    ::continue::
end