-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set parameters
local type = "boiler"
local flags = 
{
    basename = "boiler",
    baseentity = "boiler",
    mod_folder = "power",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "boiler",
    particles = {"big"}
}

local tier_map = 
{
    ["boiler"]   = 1,
    ["boiler-2"] = 2,
    ["boiler-3"] = 3,
    ["boiler-4"] = 4,
    ["boiler-5"] = 5
}

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    reskins.lib.setup_common_attributes(name, type, tier, flags)

    -- Initialize paths
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]
    
    -- Tint explosions
    explosion.created_effect.action_delivery.target_effects[3].particle_name = name.."-metal-particle-big-tinted"

    -- Reskin remnants
    remnant.animation =
    {
        layers = 
        {
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/remnants/boiler-remnants.png",
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
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/remnants/hr-boiler-remnants.png",
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
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/remnants/"..name.."-remnants.png",
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
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/remnants/hr-"..name.."-remnants.png",
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
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-N-idle.png",
                    priority = "extra-high",
                    width = 131,
                    height = 108,
                    shift = util.by_pixel(-0.5, 4),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-N-idle.png",
                        priority = "extra-high",
                        width = 269,
                        height = 221,
                        shift = util.by_pixel(-1.25, 5.25),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/"..name.."-N-idle.png",
                    priority = "extra-high",
                    width = 131,
                    height = 108,
                    shift = util.by_pixel(-0.5, 4),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/hr-"..name.."-N-idle.png",
                        priority = "extra-high",
                        width = 269,
                        height = 221,
                        shift = util.by_pixel(-1.25, 5.25),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-N-shadow.png",
                    priority = "extra-high",
                    width = 137,
                    height = 82,
                    shift = util.by_pixel(20.5, 9),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-N-shadow.png",
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
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-E-idle.png",
                    priority = "extra-high",
                    width = 105,
                    height = 147,
                    shift = util.by_pixel(-3.5, -0.5),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-E-idle.png",
                        priority = "extra-high",
                        width = 216,
                        height = 301,
                        shift = util.by_pixel(-3, 1.25),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/"..name.."-E-idle.png",
                    priority = "extra-high",
                    width = 105,
                    height = 147,
                    shift = util.by_pixel(-3.5, -0.5),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/hr-"..name.."-E-idle.png",
                        priority = "extra-high",
                        width = 216,
                        height = 301,
                        shift = util.by_pixel(-3, 1.25),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-E-shadow.png",
                    priority = "extra-high",
                    width = 92,
                    height = 97,
                    shift = util.by_pixel(30, 9.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-E-shadow.png",
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
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-S-idle.png",
                    priority = "extra-high",
                    width = 128,
                    height = 95,
                    shift = util.by_pixel(3, 12.5),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-S-idle.png",
                        priority = "extra-high",
                        width = 260,
                        height = 192,
                        shift = util.by_pixel(4, 13),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/"..name.."-S-idle.png",
                    priority = "extra-high",
                    width = 128,
                    height = 95,
                    shift = util.by_pixel(3, 12.5),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/hr-"..name.."-S-idle.png",
                        priority = "extra-high",
                        width = 260,
                        height = 192,
                        shift = util.by_pixel(4, 13),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-S-shadow.png",
                    priority = "extra-high",
                    width = 156,
                    height = 66,
                    shift = util.by_pixel(30, 16),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-S-shadow.png",
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
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-W-idle.png",
                    priority = "extra-high",
                    width = 96,
                    height = 132,
                    shift = util.by_pixel(1, 5),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-W-idle.png",
                        priority = "extra-high",
                        width = 196,
                        height = 273,
                        shift = util.by_pixel(1.5, 7.75),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/"..name.."-W-idle.png",
                    priority = "extra-high",
                    width = 96,
                    height = 132,
                    shift = util.by_pixel(1, 5),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/mask/"..name.."/hr-"..name.."-W-idle.png",
                        priority = "extra-high",
                        width = 196,
                        height = 273,
                        shift = util.by_pixel(1.5, 7.75),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/boiler-W-shadow.png",
                    priority = "extra-high",
                    width = 103,
                    height = 109,
                    shift = util.by_pixel(19.5, 6.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/boiler/base/hr-boiler-W-shadow.png",
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