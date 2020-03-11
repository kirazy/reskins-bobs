-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "boiler",
    root_name = "boiler",
    base_entity = "boiler",
    directory = reskins.bobs_structures.directory,
    group = "power",
    particles = {["big"] = 3}
}

local tier_map = 
{
    ["boiler"]   = 1,
    ["boiler-2"] = 2,
    ["boiler-3"] = 3,
    ["boiler-4"] = 4,
    ["boiler-5"] = 5
}

-- oil-boiler
-- oil-boiler-2
-- oil-boiler-3
-- oil-boiler-4

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
    remnant.animation =
    {
        layers = 
        {
            {
                filename = inputs.directory.."/graphics/entity/power/boiler/base/remnants/boiler-remnants.png",
                line_length = 1,
                width = 138,
                height = 110,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(0, -3),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/remnants/hr-boiler-remnants.png",
                    line_length = 1,
                    width = 274,
                    height = 220,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(-0.5, -3),
                    scale = 0.5,
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/remnants/"..inputs.internal_name.."-remnants.png",
                line_length = 1,
                width = 138,
                height = 110,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(0, -3),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/remnants/hr-"..inputs.internal_name.."-remnants.png",
                    line_length = 1,
                    width = 274,
                    height = 220,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(-0.5, -3),
                    scale = 0.5,
                }           
            }
        }
    }
    
    -- Reskin entities
    entity.structure =
    {
        north =
        {
            layers =
            {
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-N-idle.png",
                    priority = "extra-high",
                    width = 131,
                    height = 108,
                    shift = util.by_pixel(-0.5, 4),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-N-idle.png",
                        priority = "extra-high",
                        width = 269,
                        height = 221,
                        shift = util.by_pixel(-1.25, 5.25),
                        scale = 0.5
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-N-idle.png",
                    priority = "extra-high",
                    width = 131,
                    height = 108,
                    shift = util.by_pixel(-0.5, 4),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-N-idle.png",
                        priority = "extra-high",
                        width = 269,
                        height = 221,
                        shift = util.by_pixel(-1.25, 5.25),
                        scale = 0.5
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-N-shadow.png",
                    priority = "extra-high",
                    width = 137,
                    height = 82,
                    shift = util.by_pixel(20.5, 9),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-N-shadow.png",
                        priority = "extra-high",
                        width = 274,
                        height = 164,
                        scale = 0.5,
                        shift = util.by_pixel(20.5, 9),
                        draw_as_shadow = true
                    }
                }
            }
        },
        east =
        {
            layers =
            {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-E-idle.png",
                    priority = "extra-high",
                    width = 105,
                    height = 147,
                    shift = util.by_pixel(-3.5, -0.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-E-idle.png",
                        priority = "extra-high",
                        width = 216,
                        height = 301,
                        shift = util.by_pixel(-3, 1.25),
                        scale = 0.5
                    }
                },
                -- Color mask
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-E-idle.png",
                    priority = "extra-high",
                    width = 105,
                    height = 147,
                    shift = util.by_pixel(-3.5, -0.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/hr-boiler-E-idle-mask.png",
                        priority = "extra-high",
                        width = 216,
                        height = 301,
                        shift = util.by_pixel(-3, 1.25),
                        tint = reskins.lib.tint_index["tier-"..tier],
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-E-idle.png",
                    priority = "extra-high",
                    width = 105,
                    height = 147,
                    shift = util.by_pixel(-3.5, -0.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/hr-boiler-E-idle-highlights.png",
                        priority = "extra-high",
                        width = 216,
                        height = 301,
                        shift = util.by_pixel(-3, 1.25),
                        blend_mode = "additive",
                        scale = 0.5
                    }
                },
                -- Shadow
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-E-shadow.png",
                    priority = "extra-high",
                    width = 92,
                    height = 97,
                    shift = util.by_pixel(30, 9.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-E-shadow.png",
                        priority = "extra-high",
                        width = 184,
                        height = 194,
                        scale = 0.5,
                        shift = util.by_pixel(30, 9.5),
                        draw_as_shadow = true
                    }
                }
            }
        },
        south =
        {
            layers =
            {
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-S-idle.png",
                    priority = "extra-high",
                    width = 128,
                    height = 95,
                    shift = util.by_pixel(3, 12.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-S-idle.png",
                        priority = "extra-high",
                        width = 260,
                        height = 192,
                        shift = util.by_pixel(4, 13),
                        scale = 0.5
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-S-idle.png",
                    priority = "extra-high",
                    width = 128,
                    height = 95,
                    shift = util.by_pixel(3, 12.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-S-idle.png",
                        priority = "extra-high",
                        width = 260,
                        height = 192,
                        shift = util.by_pixel(4, 13),
                        scale = 0.5
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-S-shadow.png",
                    priority = "extra-high",
                    width = 156,
                    height = 66,
                    shift = util.by_pixel(30, 16),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-S-shadow.png",
                        priority = "extra-high",
                        width = 311,
                        height = 131,
                        scale = 0.5,
                        shift = util.by_pixel(29.75, 15.75),
                        draw_as_shadow = true
                    }
                }
            }
        },
        west =
        {
            layers =
            {
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-W-idle.png",
                    priority = "extra-high",
                    width = 96,
                    height = 132,
                    shift = util.by_pixel(1, 5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-W-idle.png",
                        priority = "extra-high",
                        width = 196,
                        height = 273,
                        shift = util.by_pixel(1.5, 7.75),
                        scale = 0.5
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-W-idle.png",
                    priority = "extra-high",
                    width = 96,
                    height = 132,
                    shift = util.by_pixel(1, 5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-W-idle.png",
                        priority = "extra-high",
                        width = 196,
                        height = 273,
                        shift = util.by_pixel(1.5, 7.75),
                        scale = 0.5
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/power/boiler/base/boiler-W-shadow.png",
                    priority = "extra-high",
                    width = 103,
                    height = 109,
                    shift = util.by_pixel(19.5, 6.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/power/boiler/base/hr-boiler-W-shadow.png",
                        priority = "extra-high",
                        width = 206,
                        height = 218,
                        scale = 0.5,
                        shift = util.by_pixel(19.5, 6.5),
                        draw_as_shadow = true
                    }
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end