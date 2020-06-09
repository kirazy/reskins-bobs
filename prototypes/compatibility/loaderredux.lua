-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["LoaderRedux"] then return end
if mods["vanilla-loaders-hd"] then return end

-- Set input parameters
local inputs = {
    type = "loader",
    icon_name = "loader",
    base_entity = "splitter",
    directory = reskins.bobs.directory,
    group = "compatibility",
    subgroup = "loaderredux",
    particles = {["medium"] = 1, ["big"] = 4},
    make_masked_icon = true,
    make_remnants = false,
}

local tier_map = {
    ["loader"] = {1, 1},
    ["fast-loader"] = {2, 2},
    ["express-loader"] = {3, 2,},
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
    inputs.tint = reskins.bobs.belt_tint_handling(name, tier)

    reskins.lib.setup_standard_entity(name, tier, inputs)    
    
    -- Retint the entity mask
    entity.structure.direction_in.sheets = {
        -- Base
        {
            filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/loader-base.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            hr_version = {
                filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/hr-loader-base.png",
                priority = "extra-high",
                width = 256,
                height = 256,
                scale = 0.5,
            }
        },
        -- Mask
        {
            filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/loader-mask.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            tint = inputs.tint,
            hr_version = {
                filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/hr-loader-mask.png",
                priority = "extra-high",
                width = 256,
                height = 256,
                tint = inputs.tint,
                scale = 0.5,
            }
        }
    }
    entity.structure.direction_out.sheets = {
        -- Base
        {
            filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/loader-base.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            y = 128,
            hr_version = {
                filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/hr-loader-base.png",
                priority = "extra-high",
                width = 256,
                height = 256,
                y = 256,
                scale = 0.5,
            }
        },
        -- Mask
        {
            filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/loader-mask.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            y = 128,
            tint = inputs.tint,
            hr_version = {
                filename = inputs.directory.."/graphics/entity/compatibility/loaderredux/hr-loader-mask.png",
                priority = "extra-high",
                width = 256,
                height = 256,
                y = 256,
                tint = inputs.tint,
                scale = 0.5,
            }
        }
    }

    -- Apply belt set
    entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(inputs.tint, variant)

    -- Label to skip to next iteration
    ::continue::
end