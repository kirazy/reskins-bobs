-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobmining"] then return end
if settings.startup["reskin-series-do-bobmining"].value == false then return end 

-- Set parameters
local type = "mining-drill"
local flags = 
{
    baseentity = "electric-mining-drill",
    mod_folder = "mining",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "mining-drill",
    particles = {"medium-long"},
    make_remnants = false,
    make_icons = false
}

-- Storage tanks have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["electric-mining-drill"] = 1,
        ["bob-mining-drill-1"] = 2,
        ["bob-mining-drill-2"] = 3,
        ["bob-mining-drill-3"] = 4,
        ["bob-mining-drill-4"] = 5,
        ["bob-area-mining-drill-1"] = 1,
        ["bob-area-mining-drill-2"] = 2,
        ["bob-area-mining-drill-3"] = 3,
        ["bob-area-mining-drill-4"] = 4
    }
else
    tier_map =
    {
        ["electric-mining-drill"] = 1,
        ["bob-mining-drill-1"] = 2,
        ["bob-mining-drill-2"] = 3,
        ["bob-mining-drill-3"] = 4,
        ["bob-mining-drill-4"] = 5,
        ["bob-area-mining-drill-1"] = 2,
        ["bob-area-mining-drill-2"] = 3,
        ["bob-area-mining-drill-3"] = 4,
        ["bob-area-mining-drill-4"] = 5
    }
    flags.remap_tiers = true
end

-- Rescale mining drill animation playback speed to something visually appealing
local max_playback = 2   -- Maximum animation playback speed
local min_playback = 0.5 -- Minimum animation playback speed

local mining_speeds = {}
local index = 1

-- Loop through all the drills, figure out the mining speeds
for name, tier in pairs(tier_map) do
    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Fetch mining speed
    mining_speeds[index] = data.raw[type][name].mining_speed
    index = index + 1

    -- Label to skip to next iteration
    ::continue::
end

-- Determine max and min mining speeds
table.sort(mining_speeds)
local max_speed = mining_speeds[#mining_speeds]
local min_speed = mining_speeds[1]

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Handle flags.basename
    if string.find(name, "electric", 1, true) or string.find(name, "bob-mining", 1, true) then
        flags.basename = "mining-drill"
    elseif string.find(name, "bob-area", 1, true) then
        flags.basename = "area-mining-drill"
    end
    
    reskins.lib.setup_common_attributes(name, type, tier, flags)

    -- Initialize table addresses    
    explosion = data.raw["explosion"][name.."-explosion"]

    -- Tint explosions
    explosion.created_effect.action_delivery.target_effects[3].particle_name = name.."-long-metal-particle-medium-tinted"

    -- Calculate new animation playback speed
    playback_speed = ((entity.mining_speed/(max_speed-min_speed)) - (min_speed/(max_speed-min_speed)))*max_playback
                          + ((max_speed/(max_speed-min_speed)) - (entity.mining_speed/(max_speed-min_speed)))*min_playback

    -- Reskin entities
    if flags.basename == "mining-drill" then
        entity.animations =
        {
            north =
            {
                layers = 
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-N.png",
                        line_length = 8,
                        width = 98,
                        height = 113,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-N.png",
                            line_length = 8,
                            width = 196,
                            height = 226,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -8),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-N.png",
                        line_length = 8,
                        width = 98,
                        height = 113,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-N.png",
                            line_length = 8,
                            width = 196,
                            height = 226,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -8),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    }
                }
            },
            east =
            {
                layers =
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-E.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-E.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(3.75, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-E.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-E.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(3.75, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                }
            },
            south =
            {
                layers =
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-S.png",
                        line_length = 8,
                        width = 98,
                        height = 109,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-S.png",
                            line_length = 8,
                            width = 196,
                            height = 219,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-S.png",
                        line_length = 8,
                        width = 98,
                        height = 109,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-S.png",
                            line_length = 8,
                            width = 196,
                            height = 219,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                }
            },
            west =
            {
                layers = 
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-W.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-W.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-3.75, -0.75),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-W.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-W.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-3.75, -0.75),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                }
            }
        }
    elseif flags.basename == "area-mining-drill" then
        entity.animations =
        {
            north =
            {
                layers = 
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-N.png",
                        line_length = 8,
                        width = 98,
                        height = 113,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-N.png",
                            line_length = 8,
                            width = 196,
                            height = 226,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -8),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/area-drill-N.png",
                        line_length = 8,
                        width = 98,
                        height = 113,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/hr-area-drill-N.png",
                            line_length = 8,
                            width = 196,
                            height = 226,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -8),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-N.png",
                        line_length = 8,
                        width = 98,
                        height = 113,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-N.png",
                            line_length = 8,
                            width = 196,
                            height = 226,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -8),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    }
                }
            },
            east =
            {
                layers =
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-E.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-E.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(3.75, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/area-drill-E.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/hr-area-drill-E.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(3.75, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-E.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-E.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(3.75, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                }
            },
            south =
            {
                layers =
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-S.png",
                        line_length = 8,
                        width = 98,
                        height = 109,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-S.png",
                            line_length = 8,
                            width = 196,
                            height = 219,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/area-drill-S.png",
                        line_length = 8,
                        width = 98,
                        height = 109,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/hr-area-drill-S.png",
                            line_length = 8,
                            width = 196,
                            height = 219,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-S.png",
                        line_length = 8,
                        width = 98,
                        height = 109,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.5),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-S.png",
                            line_length = 8,
                            width = 196,
                            height = 219,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -1.25),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                }
            },
            west =
            {
                layers = 
                {
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/mining-drill-W.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/base/hr-mining-drill-W.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-3.75, -0.75),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/area-drill-W.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/hr-area-drill-W.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-3.75, -0.75),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                    {
                        priority = "high",
                        filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/mining-drill-"..tier.."-W.png",
                        line_length = 8,
                        width = 105,
                        height = 98,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-3.5, -1),
                        run_mode = "forward-then-backward",
                        hr_version =
                        {
                            priority = "high",
                            filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/mining-drill/mask/mining-drill-"..tier.."/hr-mining-drill-"..tier.."-W.png",
                            line_length = 8,
                            width = 211,
                            height = 197,
                            frame_count = 64,
                            animation_speed = playback_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-3.75, -0.75),
                            run_mode = "forward-then-backward",
                            scale = 0.5
                        }
                    },
                }
            }
        }
    end

    -- Label to skip to next iteration
    ::continue::
end