-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end

-- We reskin the base entities only if we're doing custom colors
local custom_colors = true
if settings.startup["reskins-lib-customize-tier-colors"].value == false then
    custom_colors = false
end

-- Set input parameters
local inputs = {
    type = "transport-belt",
    icon_name = "transport-belt",
    base_entity = "transport-belt",
    directory = reskins.bobs.directory,
    group = "logistics",
    particles = {["medium"] = 1, ["small"] = 2},
    make_belt_icon = true,
}

local tier_map = {
    ["basic-transport-belt"] = {0, 1, true},
    ["transport-belt"] = {1, 1, custom_colors},
    ["fast-transport-belt"] = {2, 2, custom_colors},
    ["express-transport-belt"] = {3, 2, custom_colors},
    ["turbo-transport-belt"] = {4, 2, true},
    ["ultimate-transport-belt"] = {5, 2, true},
}

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
    do_reskin = map[3]

    -- Determine what tint we're using
    inputs.tint = reskins.bobs.belt_tint_handling(name)
    
    reskins.lib.setup_standard_entity(name, tier, inputs)    

    if do_reskin then
        -- Reskin remnants
    
        -- Reskin entities
        entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(inputs.tint, variant)
    end

    -- Label to skip to next iteration
    ::continue::
end