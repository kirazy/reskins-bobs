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
    basename = "storage-tank",
    baseentity = "storage-tank",
    mod_folder = "logistics",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "storage-tank",
    particles = {"big"},
}

-- Storage tanks have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["storage-tank"]   = 1,
        ["storage-tank-2"] = 2,
        ["storage-tank-3"] = 3,
        ["storage-tank-4"] = 4
    }
else
    tier_map =
    {
        ["storage-tank"]   = 2,
        ["storage-tank-2"] = 3,
        ["storage-tank-3"] = 4,
        ["storage-tank-4"] = 5
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


    -- Handle tier mapping settings, overwrite name with mapped name
    -- Caution: name beyond this point if remapping occurs no longer corresponds to the entity name
    if flags.remap_tiers == true then     
        name = flags.basename.."-"..tier
    end

    -- Reskin remnants
    remnant.animation = 
    {
        layers = 
        {
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/remnants/storage-tank-remnants.png",
                line_length = 1,
                width = 214,
                height = 142,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(27, 21),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/remnants/hr-storage-tank-remnants.png",
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
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/mask/"..name.."/remnants/"..name.."-remnants.png",
                line_length = 1,
                width = 214,
                height = 142,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(27, 21),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/mask/"..name.."/remnants/hr-"..name.."-remnants.png",
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
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/storage-tank.png",
                    priority = "extra-high",
                    frames = 2,
                    width = 110,
                    height = 108,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/hr-storage-tank.png",
                        priority = "extra-high",
                        frames = 2,
                        width = 219,
                        height = 215,
                        shift = util.by_pixel(-0.25, 3.75),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/mask/"..name.."/"..name..".png",
                    priority = "extra-high",
                    frames = 2,
                    width = 110,
                    height = 108,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/mask/"..name.."/hr-"..name..".png",
                        priority = "extra-high",
                        frames = 2,
                        width = 219,
                        height = 215,
                        shift = util.by_pixel(-0.25, 3.75),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/storage-tank-shadow.png",
                    priority = "extra-high",
                    frames = 2,
                    width = 146,
                    height = 77,
                    shift = util.by_pixel(30, 22.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/hr-storage-tank-shadow.png",
                        priority = "extra-high",
                        frames = 2,
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
            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/fluid-background.png",
            priority = "extra-high",
            width = 32,
            height = 15
        },
        window_background =
        {
            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/window-background.png",
            priority = "extra-high",
            width = 17,
            height = 24,
            hr_version =
            {
            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/storage-tank/base/hr-window-background.png",
            priority = "extra-high",
            width = 34,
            height = 48,
            scale = 0.5
            }
        },
        flow_sprite =
        {
            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/pipe/base/animations/fluid-flow-low-temperature.png",
            priority = "extra-high",
            width = 160,
            height = 20
        },
        gas_flow =
        {
            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/pipe/base/animations/steam.png",
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
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/pipe/base/animations/hr-steam.png",
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