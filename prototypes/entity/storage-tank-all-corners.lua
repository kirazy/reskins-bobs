-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskin-series-do-boblogistics"].value == false then return end 

-- Set parameters
local type = "storage-tank"
local flags = 
{
    basename = "storage-tank-all-corners",
    baseentity = "storage-tank",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "storage-tank-all-corners",
    particles = {"big"},
    make_icons = false
}

-- Storage tanks have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["bob-storage-tank-all-corners"]   = 1,
        ["bob-storage-tank-all-corners-2"] = 2,
        ["bob-storage-tank-all-corners-3"] = 3,
        ["bob-storage-tank-all-corners-4"] = 4
    }
else
    tier_map =
    {
        ["bob-storage-tank-all-corners"]   = 2,
        ["bob-storage-tank-all-corners-2"] = 3,
        ["bob-storage-tank-all-corners-3"] = 4,
        ["bob-storage-tank-all-corners-4"] = 5
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


    -- Strip out "bob-" from name, handle dependency on storage-tank assets
    -- Caution: name beyond this point no longer corresponds to the entity name
    if tier > 1 then
        name = flags.basename.."-"..tier
        remnant_name = flags.baseentity.."-"..tier
    else
        name = flags.basename
        remnant_name = flags.baseentity
    end

    -- Reskin remnants
    remnant.animation = 
    {
        layers = 
        {
            {
                filename = flags.directory.."/graphics/entity/storage-tank/base/remnants/storage-tank-remnants.png",
                line_length = 1,
                width = 214,
                height = 142,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(27, 21),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/storage-tank/base/remnants/hr-storage-tank-remnants.png",
                    line_length = 1,
                    width = 426,
                    height = 282,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(27, 21),
                    scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/storage-tank/mask/"..remnant_name.."/remnants/"..remnant_name.."-remnants.png",
                line_length = 1,
                width = 214,
                height = 142,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(27, 21),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/storage-tank/mask/"..remnant_name.."/remnants/hr-"..remnant_name.."-remnants.png",
                    line_length = 1,
                    width = 426,
                    height = 282,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(27, 21),
                    scale = 0.5,
                }
            }
        }
    }

    -- Reskin entities
    entity.pictures =
    {
        picture =
        {
            sheets =
            {
                {
                    filename = flags.directory.."/graphics/entity/storage-tank-all-corners/base/storage-tank-all-corners.png",
                    priority = "extra-high",
                    frames = 1,
                    width = 110,
                    height = 108,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/storage-tank-all-corners/base/hr-storage-tank-all-corners.png",
                        priority = "extra-high",
                        frames = 1,
                        width = 219,
                        height = 215,
                        shift = util.by_pixel(-0.25, 3.75),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/storage-tank-all-corners/mask/"..name.."/"..name..".png",
                    priority = "extra-high",
                    frames = 1,
                    width = 110,
                    height = 108,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/storage-tank-all-corners/mask/"..name.."/hr-"..name..".png",
                        priority = "extra-high",
                        frames = 1,
                        width = 219,
                        height = 215,
                        shift = util.by_pixel(-0.25, 3.75),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/storage-tank-all-corners/base/storage-tank-all-corners-shadow.png",
                    priority = "extra-high",
                    frames = 1,
                    width = 146,
                    height = 77,
                    shift = util.by_pixel(30, 22.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/storage-tank-all-corners/base/hr-storage-tank-all-corners-shadow.png",
                        priority = "extra-high",
                        frames = 1,
                        width = 291,
                        height = 153,
                        shift = util.by_pixel(29.75, 22.25),
                        scale = 0.5,
                        draw_as_shadow = true
                    }
                }
            }
        },
        fluid_background =
        {
            filename = flags.directory.."/graphics/entity/storage-tank/base/fluid-background.png",
            priority = "extra-high",
            width = 32,
            height = 15
        },
        window_background =
        {
            filename = flags.directory.."/graphics/entity/storage-tank/base/window-background.png",
            priority = "extra-high",
            width = 17,
            height = 24,
            hr_version =
            {
            filename = flags.directory.."/graphics/entity/storage-tank/base/hr-window-background.png",
            priority = "extra-high",
            width = 34,
            height = 48,
            scale = 0.5
            }
        },
        flow_sprite =
        {
            filename = flags.directory.."/graphics/entity/pipe/base/animations/fluid-flow-low-temperature.png",
            priority = "extra-high",
            width = 160,
            height = 20
        },
        gas_flow =
        {
            filename = flags.directory.."/graphics/entity/pipe/base/animations/steam.png",
            priority = "extra-high",
            line_length = 10,
            width = 24,
            height = 15,
            frame_count = 60,
            axially_symmetrical = false,
            direction_count = 1,
            animation_speed = 0.25,
            hr_version =
            {
                filename = flags.directory.."/graphics/entity/pipe/base/animations/hr-steam.png",
                priority = "extra-high",
                line_length = 10,
                width = 48,
                height = 30,
                frame_count = 60,
                axially_symmetrical = false,
                animation_speed = 0.25,
                direction_count = 1,
                scale = 0.5
            }
        }
    }
    -- Label to skip to next iteration
    ::continue::
end