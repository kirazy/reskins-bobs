-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobmining"] then return end
if settings.startup["reskins-bobs-do-bobmining"].value == false then return end

-- Set input parameters
local inputs = {
    type = "mining-drill",
    icon_name = "electric-mining-drill",
    base_entity = "electric-mining-drill",
    directory = reskins.bobs.directory,
    group = "mining",
    particles = {["medium-long"] = 3},
    make_remnants = false,
}

-- Storage tanks have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map = {
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
    tier_map = {
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
end

-- Rescale mining drill animation playback speed to something visually appealing
local max_playback = 2   -- Maximum animation playback speed
local min_playback = 0.5 -- Minimum animation playback speed

local mining_speeds = {}
local index = 1

-- Loop through all the drills, figure out the mining speeds
for name, tier in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]
    
    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Fetch mining speed
    mining_speeds[index] = data.raw[inputs.type][name].mining_speed
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
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Handle icon base 
    if string.find(name, "electric", 1, true) or string.find(name, "bob-mining", 1, true) then
        inputs.icon_base = "electric-mining-drill"
    elseif string.find(name, "bob-area", 1, true) then
        inputs.icon_base = "large-area-electric-mining-drill"
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
    
    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Calculate new animation playback speed
    if max_speed - min_speed == 0 then 
        playback_speed = entity.mining_speed
    else
        playback_speed = ((entity.mining_speed/(max_speed-min_speed)) - (min_speed/(max_speed-min_speed)))*max_playback
                          + ((max_speed/(max_speed-min_speed)) - (entity.mining_speed/(max_speed-min_speed)))*min_playback
    end

    -- Reskin entities
    entity.animations = {
        north = {
            layers = {
                -- Base
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N.png",
                    line_length = 8,
                    width = 98,
                    height = 113,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(0, -8.5),
                    run_mode = "forward-then-backward",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N.png",
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
                -- Mask
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-N-mask.png",
                    line_length = 8,
                    width = 98,
                    height = 113,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(0, -8.5),
                    run_mode = "forward-then-backward",
                    tint = inputs.tint,
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-N-mask.png",
                        line_length = 8,
                        width = 196,
                        height = 226,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8),
                        run_mode = "forward-then-backward",
                        tint = inputs.tint,
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-N-highlights.png",
                    line_length = 8,
                    width = 98,
                    height = 113,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(0, -8.5),
                    run_mode = "forward-then-backward",
                    blend_mode = "additive",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-N-highlights.png",
                        line_length = 8,
                        width = 196,
                        height = 226,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -8),
                        run_mode = "forward-then-backward",
                        blend_mode = "additive",
                        scale = 0.5
                    }
                }
            }
        },
        east = {
            layers = {
                -- Base
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(3.5, -1),
                    run_mode = "forward-then-backward",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E.png",
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
                -- Mask
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-E-mask.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(3.5, -1),
                    tint = inputs.tint,
                    run_mode = "forward-then-backward",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-E-mask.png",
                        line_length = 8,
                        width = 211,
                        height = 197,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3.75, -1.25),
                        tint = inputs.tint,
                        run_mode = "forward-then-backward",
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-E-highlights.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(3.5, -1),
                    run_mode = "forward-then-backward",
                    blend_mode = "additive",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-E-highlights.png",
                        line_length = 8,
                        width = 211,
                        height = 197,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3.75, -1.25),
                        run_mode = "forward-then-backward",
                        blend_mode = "additive",
                        scale = 0.5
                    }
                },
            }
        },
        south = {
            layers = {
                -- Base
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S.png",
                    line_length = 8,
                    width = 98,
                    height = 109,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(0, -1.5),
                    run_mode = "forward-then-backward",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S.png",
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
                -- Mask
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-S-mask.png",
                    line_length = 8,
                    width = 98,
                    height = 109,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(0, -1.5),
                    run_mode = "forward-then-backward",
                    tint = inputs.tint,
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-S-mask.png",
                        line_length = 8,
                        width = 196,
                        height = 219,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.25),
                        run_mode = "forward-then-backward",
                        tint = inputs.tint,
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-S-highlights.png",
                    line_length = 8,
                    width = 98,
                    height = 109,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(0, -1.5),
                    run_mode = "forward-then-backward",
                    blend_mode = "additive",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-S-highlights.png",
                        line_length = 8,
                        width = 196,
                        height = 219,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(0, -1.25),
                        run_mode = "forward-then-backward",
                        blend_mode = "additive",
                        scale = 0.5
                    }
                },
            }
        },
        west = {
            layers = {
                -- Base
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(-3.5, -1),
                    run_mode = "forward-then-backward",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W.png",
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
                -- Mask
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-W-mask.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(-3.5, -1),
                    run_mode = "forward-then-backward",
                    tint = inputs.tint,
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-W-mask.png",
                        line_length = 8,
                        width = 211,
                        height = 197,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-3.75, -0.75),
                        run_mode = "forward-then-backward",
                        tint = inputs.tint,
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    priority = "high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//mining-drill-W-highlights.png",
                    line_length = 8,
                    width = 105,
                    height = 98,
                    frame_count = 64,
                    animation_speed = playback_speed,
                    direction_count = 1,
                    shift = util.by_pixel(-3.5, -1),
                    run_mode = "forward-then-backward",
                    blend_mode = "additive",
                    hr_version = {
                        priority = "high",
                        filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill//hr-mining-drill-W-highlights.png",
                        line_length = 8,
                        width = 211,
                        height = 197,
                        frame_count = 64,
                        animation_speed = playback_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-3.75, -0.75),
                        run_mode = "forward-then-backward",
                        blend_mode = "additive",
                        scale = 0.5
                    }
                },
            }
        }
    }

    entity.shadow_animations = {
        north =  {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N-drill-shadow.png",
            flags = { "shadow" },
            line_length = 8,
            width = 101,
            height = 111,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(1.5, -7.5),
            draw_as_shadow = true,
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 201,
                height = 223,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(1.25, -7.25),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        },
        east = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E-drill-shadow.png",
            flags = { "shadow" },
            line_length = 8,
            width = 110,
            height = 97,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(6, -0.5),
            draw_as_shadow = true,
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 221,
                height = 195,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(6.25, -0.25),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        },
        south = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S-drill-shadow.png",
            flags = { "shadow" },
            line_length = 8,
            width = 100,
            height = 103,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(1, 2.5),
            draw_as_shadow = true,
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 200,
                height = 206,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(1, 2.5),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        },
        west = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W-drill-shadow.png",
            flags = { "shadow" },
            line_length = 8,
            width = 114,
            height = 97,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(1, -0.5),
            draw_as_shadow = true,
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W-drill-shadow.png",
                flags = { "shadow" },
                line_length = 8,
                width = 229,
                height = 195,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(1.25, -0.25),
                draw_as_shadow = true,
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        }
    }

    entity.input_fluid_patch_sprites = {
        north = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N-patch.png",
            width = 100,
            height = 111,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0, -6.5),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N-patch.png",
                width = 200,
                height = 222,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-0.5, -6.5),
                scale = 0.5
            }
        },
        east = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E-patch.png",
            width = 100,
            height = 110,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0, -6),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E-patch.png",
                width = 200,
                height = 219,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(0, -5.75),
                scale = 0.5
            }
        },
        south = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S-patch.png",
            width = 100,
            height = 113,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0, -7.5),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S-patch.png",
                width = 200,
                height = 226,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-0.5, -7.5),
                scale = 0.5
            }
        },
        west = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W-patch.png",
            width = 100,
            height = 108,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0, -5),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W-patch.png",
                width = 200,
                height = 220,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-0.5, -6),
                scale = 0.5
            }
        }
    }

    entity.input_fluid_patch_shadow_sprites = {
        north = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N-patch-shadow.png",
            flags = { "shadow" },
            width = 110,
            height = 98,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(5, 0),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N-patch-shadow.png",
                flags = { "shadow" },
                width = 220,
                height = 197,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(5, -0.25),
                scale = 0.5
            }
        },
        east = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E-patch-shadow.png",
            flags = { "shadow" },
            width = 112,
            height = 98,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(6, 0),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E-patch-shadow.png",
                flags = { "shadow" },
                width = 224,
                height = 198,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(6, 0),
                scale = 0.5
            }
        },
        south = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S-patch-shadow.png",
            flags = { "shadow" },
            width = 110,
            height = 98,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(5, 0),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S-patch-shadow.png",
                flags = { "shadow" },
                width = 220,
                height = 197,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(5, -0.25),
                scale = 0.5
            }
        },
        west = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W-patch-shadow.png",
            flags = { "shadow" },
            width = 110,
            height = 98,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(5, 0),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W-patch-shadow.png",
                flags = { "shadow" },
                width = 220,
                height = 197,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(5, -0.25),
                scale = 0.5
            }
        }
    }

    entity.input_fluid_patch_shadow_animations = {
        north = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N-drill-received-shadow.png",
            tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
            line_length = 8,
            width = 100,
            height = 102,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(-1, -3),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N-drill-received-shadow.png",
                tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
                line_length = 8,
                width = 204,
                height = 206,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(-0.5, -2),
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        },
        east = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E-drill-received-shadow.png",
            tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
            line_length = 8,
            width = 102,
            height = 98,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(0, -2),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E-drill-received-shadow.png",
                tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
                line_length = 8,
                width = 204,
                height = 209,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(-0.5, -1.25),
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        },
        south = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S-drill-received-shadow.png",
            tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
            line_length = 8,
            width = 100,
            height = 98,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(-1, -1),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S-drill-received-shadow.png",
                tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
                line_length = 8,
                width = 204,
                height = 204,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(-0.5, -2.5),
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        },
        west = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W-drill-received-shadow.png",
            tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
            line_length = 8,
            width = 96,
            height = 99,
            frame_count = 64,
            animation_speed = 0.5,
            direction_count = 1,
            shift = util.by_pixel(0, -1.5),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W-drill-received-shadow.png",
                tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
                line_length = 8,
                width = 198,
                height = 206,
                frame_count = 64,
                animation_speed = 0.5,
                direction_count = 1,
                shift = util.by_pixel(1, -2),
                run_mode = "forward-then-backward",
                scale = 0.5
            }
        }
    }

    entity.input_fluid_patch_window_sprites = {
        north = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N-window-background.png",
            width = 72,
            height = 54,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-1, 1),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N-window-background.png",
                width = 142,
                height = 107,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-1, 0.75),
                scale = 0.5
            }
        },
        east = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E-window-background.png",
            width = 51,
            height = 74,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-11.5, -11),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E-window-background.png",
                width = 104,
                height = 147,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-11, -11.25),
                scale = 0.5
            }
        },
        south = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S-window-background.png",
            width = 71,
            height = 44,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-1.5, -29),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S-window-background.png",
                width = 141,
                height = 86,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-1.75, -29),
                scale = 0.5
            }
        },
        west = {
            priority = "extra-high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W-window-background.png",
            width = 41,
            height = 69,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(11.5, -11.5),
            hr_version = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W-window-background.png",
                width = 80,
                height = 137,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(11.5, -11.25),
                scale = 0.5
            }
        }
    }

    entity.input_fluid_patch_window_flow_sprites = {
        {
            north = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N-fluid-flow.png",
                width = 68,
                height = 50,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-2, -1),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N-fluid-flow.png",
                    width = 136,
                    height = 99,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-2.5, -0.75),
                    scale = 0.5
                }
            },
            east = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E-fluid-flow.png",
                width = 41,
                height = 70,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-11.5, -11),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E-fluid-flow.png",
                    width = 82,
                    height = 139,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-11.5, -11.25),
                    scale = 0.5
                }
            },
            south = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S-fluid-flow.png",
                width = 68,
                height = 40,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-2, -29),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S-fluid-flow.png",
                    width = 136,
                    height = 80,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-2.5, -29.5),
                    scale = 0.5
                }
            },
            west = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W-fluid-flow.png",
                width = 42,
                height = 70,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(11, -11),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W-fluid-flow.png",
                    width = 83,
                    height = 140,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(10.75, -11),
                    scale = 0.5
                }
            }
        }
    }

    entity.input_fluid_patch_window_base_sprites = {
        {
            north = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-N-fluid-background.png",
                width = 70,
                height = 48,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-2, 0),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-N-fluid-background.png",
                    width = 138,
                    height = 94,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-2, 0),
                    scale = 0.5
                }
            },
            east = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-E-fluid-background.png",
                width = 42,
                height = 70,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-12, -11),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-E-fluid-background.png",
                    width = 84,
                    height = 138,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-12, -11),
                    scale = 0.5
                }
            },
            south = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-S-fluid-background.png",
                width = 70,
                height = 40,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-2, -29),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-S-fluid-background.png",
                    width = 138,
                    height = 80,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-2, -29),
                    scale = 0.5
                }
            },
            west = {
                priority = "extra-high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/electric-mining-drill-W-fluid-background.png",
                width = 42,
                height = 69,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(12, -10.5),
                hr_version = {
                    priority = "extra-high",
                    filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/base/hr-electric-mining-drill-W-fluid-background.png",
                    width = 83,
                    height = 137,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(11.75, -10.75),
                    scale = 0.5
                }
            }
        }
    }
    
    if inputs.icon_base == "large-area-electric-mining-drill" then
        entity.animations.north.layers[#entity.animations.north.layers+1] = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/area-drill-N.png",
            line_length = 8,
            width = 98,
            height = 113,
            frame_count = 64,
            animation_speed = playback_speed,
            direction_count = 1,
            shift = util.by_pixel(0, -8.5),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/hr-area-drill-N.png",
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

        entity.animations.east.layers[#entity.animations.east.layers+1] = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/area-drill-E.png",
            line_length = 8,
            width = 105,
            height = 98,
            frame_count = 64,
            animation_speed = playback_speed,
            direction_count = 1,
            shift = util.by_pixel(3.5, -1),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/hr-area-drill-E.png",
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
        }

        entity.animations.south.layers[#entity.animations.south.layers+1] = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/area-drill-S.png",
            line_length = 8,
            width = 98,
            height = 109,
            frame_count = 64,
            animation_speed = playback_speed,
            direction_count = 1,
            shift = util.by_pixel(0, -1.5),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/hr-area-drill-S.png",
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
        }

        entity.animations.west.layers[#entity.animations.west.layers+1] = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/area-drill-W.png",
            line_length = 8,
            width = 105,
            height = 98,
            frame_count = 64,
            animation_speed = playback_speed,
            direction_count = 1,
            shift = util.by_pixel(-3.5, -1),
            run_mode = "forward-then-backward",
            hr_version = {
                priority = "high",
                filename = inputs.directory.."/graphics/entity/mining/classic-mining-drill/area-end/hr-area-drill-W.png",
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
        }
    end

    -- Clear out new graphics
    entity.graphics_set = nil
    entity.wet_mining_graphics_set = nil

    -- Label to skip to next iteration
    ::continue::
end