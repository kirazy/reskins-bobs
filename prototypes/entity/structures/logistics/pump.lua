-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "pump",
    root_name = "pump",
    base_entity = "pump",
    directory = reskins.bobs.directory,
    mod = "logistics",
    particles = {["medium"] = 3},
    make_icons = false
}

-- Pumps have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["pump"]       = 1,
        ["bob-pump-2"] = 2,
        ["bob-pump-3"] = 3,
        ["bob-pump-4"] = 4
    }
else
    tier_map =
    {
        ["pump"]       = 2,
        ["bob-pump-2"] = 3,
        ["bob-pump-3"] = 4,
        ["bob-pump-4"] = 5
    }
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..tier
    
    reskins.lib.setup_common_attributes(name, tier, inputs)

    -- Fetch remnant
    remnant = data.raw["corpse"][name.."-remnants"]    

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet (1,
    {
        layers =
        {
            {
                filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/remnants/pump-remnants.png",
                line_length = 1,
                width = 94,
                height = 94,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(2, 2),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/remnants/hr-pump-remnants.png",
                    line_length = 1,
                    width = 188,
                    height = 186,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(2, 2),
                    scale = 0.5,
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/remnants/"..inputs.internal_name.."-remnants.png",
                line_length = 1,
                width = 94,
                height = 94,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(2, 2),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/remnants/hr-"..inputs.internal_name.."-remnants.png",
                    line_length = 1,
                    width = 188,
                    height = 186,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(2, 2),
                    scale = 0.5,
                }
            }
        }
    })

    -- Reskin entities
    entity.animations =
    {
        north =
        {
            layers = 
            {
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/pump-north.png",
                    width = 53,
                    height = 79,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(8.000, 7.500),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/hr-pump-north.png",
                        width = 103,
                        height = 164,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(8, 3.5)
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-north.png",
                    width = 53,
                    height = 79,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(8.000, 7.500),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-north.png",
                        width = 103,
                        height = 164,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(8, 3.5)
                    }
                }
            }
        },
        east =
        {
            layers = 
            {
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/pump-east.png",
                    width = 66,
                    height = 60,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/hr-pump-east.png",
                        width = 130,
                        height = 109,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(-0.5, 1.75)
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-east.png",
                    width = 66,
                    height = 60,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-east.png",
                        width = 130,
                        height = 109,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(-0.5, 1.75)
                    }
                }
            }
        },
        south =
        {
            layers = 
            {
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/pump-south.png",
                    width = 62,
                    height = 87,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(13.5, 0.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/hr-pump-south.png",
                        width = 114,
                        height = 160,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(12.5, -8)
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-south.png",
                    width = 62,
                    height = 87,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(13.5, 0.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-south.png",
                        width = 114,
                        height = 160,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(12.5, -8)
                    }
                }
            }
        },
        west =
        {
            layers = 
            {
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/pump-west.png",
                    width = 69,
                    height = 51,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0.5, -0.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/base/hr-pump-west.png",
                        width = 131,
                        height = 111,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(-0.25, 1.25)
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-west.png",
                    width = 69,
                    height = 51,
                    line_length =8,
                    frame_count =32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0.5, -0.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/logistics/pump/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-west.png",
                        width = 131,
                        height = 111,
                        scale = 0.5,
                        line_length =8,
                        frame_count =32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(-0.25, 1.25)
                    }
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end