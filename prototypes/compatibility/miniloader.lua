-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["miniloader"] then return end
-- if settings.startup["reskins-lib-customize-tier-colors"].value == false then return end -- disabled, since miniloader doesn't add explosions natively

-- Set input parameters
local inputs = {
    icon_name = "miniloader",
    base_entity = "splitter",
    directory = reskins.bobs.directory,
    group = "compatibility",
    subgroup = "miniloader",
    particles = {["medium"] = 1, ["big"] = 4},
    make_belt_icon = true,
    make_remnants = false,
}

local tier_map = {
    -- 1x1 Loader Entities
    ["basic-miniloader-loader"] = {0, 1},
    ["chute-miniloader-loader"] = {0, 1},
    ["miniloader-loader"] = {1, 1},
    ["fast-miniloader-loader"] = {2, 2},
    ["express-miniloader-loader"] = {3, 2},
    ["turbo-miniloader-loader"] = {4, 2},
    ["ultimate-miniloader-loader"] = {5, 2},
    ["filter-miniloader-loader"] = {1, 1},
    ["fast-filter-miniloader-loader"] = {2, 2},
    ["express-filter-miniloader-loader"] = {3, 2},
    ["turbo-filter-miniloader-loader"] = {4, 2},
    ["ultimate-filter-miniloader-loader"] = {5, 2},

    -- Inserter Entities
    ["basic-miniloader-inserter"] = {0},
    ["chute-miniloader-inserter"] = {0},
    ["miniloader-inserter"] = {1},
    ["fast-miniloader-inserter"] = {2},
    ["express-miniloader-inserter"] = {3},
    ["turbo-miniloader-inserter"] = {4},
    ["ultimate-miniloader-inserter"] = {5},
    ["filter-miniloader-inserter"] = {1},
    ["fast-filter-miniloader-inserter"] = {2},
    ["express-filter-miniloader-inserter"] = {3},
    ["turbo-filter-miniloader-inserter"] = {4},
    ["ultimate-filter-miniloader-inserter"] = {5},
}

local item_map = {
    ["basic-miniloader"] = 0,
    ["chute-miniloader"] = 0,
    ["miniloader"] = 1,
    ["fast-miniloader"] = 2,
    ["express-miniloader"] = 3,
    ["turbo-miniloader"] = 4,
    ["ultimate-miniloader"] = 5,
    ["filter-miniloader"] = 1,
    ["fast-filter-miniloader"] = 2,
    ["express-filter-miniloader"] = 3,
    ["turbo-filter-miniloader"] = 4,
    ["ultimate-filter-miniloader"] = 5,
}

-- Reskin entities
for name, map in pairs(tier_map) do
    if not string.find(name, "inserter") then
        inputs.type = "loader-1x1"
        inputs.make_explosions = false
    else
        inputs.type = "inserter"
        inputs.make_explosions = true
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
    inputs.tint = reskins.lib.belt_mask_tint(reskins.lib.tint_index["tier-"..tier])

    -- Setup icon details
    if string.find(name, "filter") then
        inputs.icon_base = "filter-miniloader"
    else
        inputs.icon_base = "miniloader"
    end

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Retint the mask
    if not string.find(name, "inserter") then
        entity.structure.direction_in.sheets[2].tint = inputs.tint
        entity.structure.direction_in.sheets[2].hr_version.tint = inputs.tint
        entity.structure.direction_out.sheets[2].tint = inputs.tint
        entity.structure.direction_out.sheets[2].hr_version.tint = inputs.tint
    else
        entity.platform_picture.sheets[2].tint = inputs.tint
        entity.platform_picture.sheets[2].hr_version.tint = inputs.tint
    end

    -- Apply belt set
    if variant then
        entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(inputs.tint, variant)
    end

    -- Label to skip to next iteration
    ::continue::
end

-- Reskin icons
for name, tier in pairs(item_map) do
    -- Fetch item
    item = data.raw["item"][name]

    if not item then
        goto continue
    end

    -- Setup icon details
    if string.find(name, "filter") then
        inputs.icon_base = "filter-miniloader"
    else
        inputs.icon_base = "miniloader"
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.belt_mask_tint(reskins.lib.tint_index["tier-"..tier])

    reskins.lib.setup_belt_entity_icon(name, tier, inputs)

    -- Label to skip to next iteration
    ::continue::
end