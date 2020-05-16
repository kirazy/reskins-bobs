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
    icon_name = "loader",
    base_entity = "splitter",
    directory = reskins.bobs.directory,
    group = "compatibility",
    subgroup = "vanilla-loaders-hd",
    particles = {["medium"] = 1, ["big"] = 4},
    make_belt_icon = true,
    make_remnants = false,
}

local tier_map = {
    ["basic-loader"] = {0, 1},
    ["loader"] = {1, 1},
    ["fast-loader"] = {2, 2},
    ["express-loader"] = {3, 2},
    ["purple-loader"] = {4, 2},
    ["green-loader"] = {5, 2},
}

-- Reskin entities
for name, map in pairs(tier_map) do
    -- Fetch entity, item
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    variant = map[2]

    -- Determine what tint we're using
    inputs.tint = reskins.lib.belt_mask_tint(reskins.lib.tint_index["tier-"..tier])

    reskins.lib.setup_standard_entity(name, tier, inputs)    
    
    -- Retint the entity mask
    entity.structure.direction_in.sheets[2].tint = inputs.tint
    entity.structure.direction_in.sheets[2].hr_version.tint = inputs.tint
    entity.structure.direction_out.sheets[2].tint = inputs.tint
    entity.structure.direction_out.sheets[2].hr_version.tint = inputs.tint

    -- Apply belt set
    entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(inputs.tint, variant)

    -- Label to skip to next iteration
    ::continue::
end