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
    basename = "steam-turbine",
    baseentity = "steam-turbine",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "steam-turbine",
    particles = {"medium","big"}
}

-- Steam turbines have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["steam-turbine"]   = 1,
        ["steam-turbine-2"] = 2,
        ["steam-turbine-3"] = 3
    }
else
    tier_map =
    {
        ["steam-turbine"]   = 3,
        ["steam-turbine-2"] = 4,
        ["steam-turbine-3"] = 5
    }
    flags.remap_tiers = true
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end
    
    reskins.lib.setup_common_attributes(name, type, tier, flags)

    -- Initialize table addresses    
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]

    -- Tint explosions
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Handle tier mapping settings, overwrite name with mapped name
    -- Caution: name beyond this point if remapping occurs no longer corresponds to the entity name
    if flags.remap_tiers == true then     
        name = flags.basename.."-"..tier
    end

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet (1,
    {
        layers = 
        {
            {
                filename = flags.directory.."/graphics/entity/steam-turbine/base/remnants/steam-turbine-remnants.png",
                line_length = 1,
                width = 230,
                height = 204,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(6, 0),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/base/remnants/hr-steam-turbine-remnants.png",
                    line_length = 1,
                    width = 460,
                    height = 408,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(6, 0),
                    scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/steam-turbine/mask/"..name.."/remnants/"..name.."-remnants.png",
                line_length = 1,
                width = 230,
                height = 204,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(6, 0),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/mask/"..name.."/remnants/hr-"..name.."-remnants.png",
                    line_length = 1,
                    width = 460,
                    height = 408,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(6, 0),
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
                filename = flags.directory.."/graphics/entity/steam-turbine/base/steam-turbine-H.png",
                width = 160,
                height = 123,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(0, -2.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/base/hr-steam-turbine-H.png",
                    width = 320,
                    height = 245,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(0, -2.75),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/steam-turbine/mask/"..name.."/"..name.."-H.png",
                width = 160,
                height = 123,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(0, -2.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/mask/"..name.."/hr-"..name.."-H.png",
                    width = 320,
                    height = 245,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(0, -2.75),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/steam-turbine/base/steam-turbine-H-shadow.png",
                width = 217,
                height = 74,
                repeat_count = 8,
                frame_count = 1,
                line_length = 1,
                draw_as_shadow = true,
                shift = util.by_pixel(28.75, 18),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/base/hr-steam-turbine-H-shadow.png",
                    width = 435,
                    height = 150,
                    repeat_count = 8,
                    frame_count = 1,
                    line_length = 1,
                    draw_as_shadow = true,
                    shift = util.by_pixel(28.5, 18),
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
                filename = flags.directory.."/graphics/entity/steam-turbine/base/steam-turbine-V.png",
                width = 108,
                height = 173,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(5, 6.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/base/hr-steam-turbine-V.png",
                    width = 217,
                    height = 347,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(4.75, 6.75),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/steam-turbine/mask/"..name.."/"..name.."-V.png",
                width = 108,
                height = 173,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(5, 6.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/mask/"..name.."/hr-"..name.."-V.png",
                    width = 217,
                    height = 347,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(4.75, 6.75),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/steam-turbine/base/steam-turbine-V-shadow.png",
                width = 151,
                height = 131,
                repeat_count = 8,
                frame_count = 1,
                line_length = 1,
                draw_as_shadow = true,
                shift = util.by_pixel(39.5, 24.5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-turbine/base/hr-steam-turbine-V-shadow.png",
                    width = 302,
                    height = 260,
                    repeat_count = 8,
                    frame_count = 1,
                    line_length = 1,
                    draw_as_shadow = true,
                    shift = util.by_pixel(39.5, 24.5),
                    scale = 0.5
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end