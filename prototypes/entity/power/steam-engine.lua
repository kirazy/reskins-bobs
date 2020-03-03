-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set parameters
local type = "generator"
local flags = 
{
    basename = "steam-engine",
    baseentity = "steam-engine",
    mod_folder = "power",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "steam-engine",
    particles = {"medium","big"}
}

local tier_map =
{
    ["steam-engine"]   = 1,
    ["steam-engine-2"] = 2,
    ["steam-engine-3"] = 3,
    ["steam-engine-4"] = 4,
    ["steam-engine-5"] = 5
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
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet (1,
    {
        layers = 
        {
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/remnants/steam-engine-remnants.png",
                line_length = 1,
                width = 232,
                height = 194,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(17, 7),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/remnants/hr-steam-engine-remnants.png",
                    line_length = 1,
                    width = 462,
                    height = 386,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(17, 6.5),
                    scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/mask/"..name.."/remnants/"..name.."-remnants.png",
                line_length = 1,
                width = 232,
                height = 194,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(17, 7),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/mask/"..name.."/remnants/hr-"..name.."-remnants.png",
                    line_length = 1,
                    width = 462,
                    height = 386,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(17, 6.5),
                    scale = 0.5,
                }
            }
        }
    })
    
    -- Reskin entities
    entity.horizontal_animation =
    {
        layers =
        {
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/steam-engine-H.png",
                width = 176,
                height = 128,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/hr-steam-engine-H.png",
                    width = 352,
                    height = 257,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(1, -4.75),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/mask/"..name.."/"..name.."-H.png",
                width = 176,
                height = 128,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/mask/"..name.."/hr-"..name.."-H.png",
                    width = 352,
                    height = 257,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(1, -4.75),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/steam-engine-H-shadow.png",
                width = 254,
                height = 80,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(48, 24),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/hr-steam-engine-H-shadow.png",
                    width = 508,
                    height = 160,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(48, 24),
                    scale = 0.5
                }
            }
        }
    }

    entity.vertical_animation =
    {
        layers =
        {
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/steam-engine-V.png",
                width = 112,
                height = 195,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(5, -6.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/hr-steam-engine-V.png",
                    width = 225,
                    height = 391,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(4.75, -6.25),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/mask/"..name.."/"..name.."-V.png",
                width = 112,
                height = 195,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(5, -6.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/mask/"..name.."/hr-"..name.."-V.png",
                    width = 225,
                    height = 391,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(4.75, -6.25),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/steam-engine-V-shadow.png",
                width = 165,
                height = 153,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(40.5, 9.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/steam-engine/base/hr-steam-engine-V-shadow.png",
                    width = 330,
                    height = 307,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(40.5, 9.25),
                    scale = 0.5
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::    
end