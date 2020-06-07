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
                    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N.png",
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
                        filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-N-mask.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-N-mask.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-N-highlights.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-N-highlights.png",
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
                    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E.png",
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
                        filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-E-mask.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-E-mask.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-E-highlights.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-E-highlights.png",
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
                    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S.png",
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
                        filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-S-mask.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-S-mask.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-S-highlights.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-S-highlights.png",
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
                    filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W.png",
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
                        filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-W-mask.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-W-mask.png",
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
                    filename = inputs.directory.."/graphics/entity/mining/mining-drill/mining-drill-W-highlights.png",
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
                        filename = inputs.directory.."/graphics/entity/mining/mining-drill/hr-mining-drill-W-highlights.png",
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
    
    if inputs.icon_base == "large-area-electric-mining-drill" then
        entity.animations.north.layers[#entity.animations.north.layers+1] = {
            priority = "high",
            filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/area-drill-N.png",
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
                filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/hr-area-drill-N.png",
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
            filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/area-drill-E.png",
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
                filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/hr-area-drill-E.png",
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
            filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/area-drill-S.png",
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
                filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/hr-area-drill-S.png",
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
            filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/area-drill-W.png",
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
                filename = inputs.directory.."/graphics/entity/mining/mining-drill/area-end/hr-area-drill-W.png",
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

    -- Label to skip to next iteration
    ::continue::
end