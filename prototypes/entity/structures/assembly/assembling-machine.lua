-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] then return end
if settings.startup["reskins-bobs-do-bobassembly"].value == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    root_name = "assembling-machine",
    base_entity = "assembling-machine-1",
    directory = reskins.bobs.directory,
    mod = "assembly",
    particles = {["big"] = 1, ["medium"] = 2},
    make_remnants   = false
}

local tier_map =
{
    ["assembling-machine-1"] = {0, 0, false},
    ["assembling-machine-2"] = {1, 1, true},
    ["assembling-machine-3"] = {2, 2, true},
    ["assembling-machine-4"] = {3, 3, true},
    ["assembling-machine-5"] = {4, 4, true},
    ["assembling-machine-6"] = {5, 4, true}
}

-- Additional miscellaneous assembling machines
-- electronics-machine-1
-- electronics-machine-2
-- electronics-machine-3
-- burner-assembling-machine
-- steam-assembling-machine

-- Pipe pictures
local function pipe_pictures(tint)
    return
    {
        north =
        {
            layers =
            {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-N-base.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-base.png",
                        priority = "extra-high",
                        width = 71,
                        height = 38,
                        shift = util.by_pixel(2.25, 13.5),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-N-mask.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    tint = tint,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-mask.png",
                        priority = "extra-high",
                        width = 71,
                        height = 38,
                        shift = util.by_pixel(2.25, 13.5),
                        tint = tint,
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-N-highlights.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-highlights.png",
                        priority = "extra-high",
                        width = 71,
                        height = 38,
                        shift = util.by_pixel(2.25, 13.5),
                        blend_mode = "additive",
                        scale = 0.5
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
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-E-base.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-base.png",
                        priority = "extra-high",
                        width = 42,
                        height = 76,
                        shift = util.by_pixel(-24.5, 1),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-E-mask.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    tint = tint,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-mask.png",
                        priority = "extra-high",
                        width = 42,
                        height = 76,
                        shift = util.by_pixel(-24.5, 1),
                        tint = tint,
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-E-highlights.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-highlights.png",
                        priority = "extra-high",
                        width = 42,
                        height = 76,
                        shift = util.by_pixel(-24.5, 1),
                        blend_mode = "additive",
                        scale = 0.5
                    }
                }
            }
        },
        south =
        {
            layers =
            {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-S-base.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-base.png",
                        priority = "extra-high",
                        width = 88,
                        height = 61,
                        shift = util.by_pixel(0, -31.25),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-S-mask.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    tint = tint,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-mask.png",
                        priority = "extra-high",
                        width = 88,
                        height = 61,
                        shift = util.by_pixel(0, -31.25),
                        tint = tint,
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-S-highlights.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-highlights.png",
                        priority = "extra-high",
                        width = 88,
                        height = 61,
                        shift = util.by_pixel(0, -31.25),
                        blend_mode = "additive",
                        scale = 0.5
                    }
                }
            }

        },
        west =
        {
            layers =
            {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-W-base.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-base.png",
                        priority = "extra-high",
                        width = 39,
                        height = 73,
                        shift = util.by_pixel(25.75, 1.25),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-W-mask.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    tint = tint,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-mask.png",
                        priority = "extra-high",
                        width = 39,
                        height = 73,
                        shift = util.by_pixel(25.75, 1.25),
                        tint = tint,
                        scale = 0.5
                    }
                },
                -- Highlights
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-W-highlights.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-highlights.png",
                        priority = "extra-high",
                        width = 39,
                        height = 73,
                        shift = util.by_pixel(25.75, 1.25),
                        blend_mode = "additive",
                        scale = 0.5
                    }
                }
            }
        }
    }
end


-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Extract tier, shadow, has_fluids from map
    tier = map[1]
    shadow = map[2]  
    has_fluids = map[3]  
    
    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..tier
    
    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    reskins.lib.setup_common_attributes(name, tier, inputs)

    -- Reskin entities
    entity.animation =
    {
        layers =
        {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/base/assembling-machine-base.png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/base/hr-assembling-machine-base.png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    shift = util.by_pixel(0, -0.75),
                    scale = 0.5
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/base/assembling-machine-base-mask.png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.5),
                tint = inputs.tint,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/base/hr-assembling-machine-base-mask.png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    shift = util.by_pixel(0, -0.75),
                    tint = inputs.tint,
                    scale = 0.5
                }
            },
            -- Highlight
            {
                filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/base/assembling-machine-base-highlights.png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.5),
                blend_mode = "additive",
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/base/hr-assembling-machine-base-highlights.png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    shift = util.by_pixel(0, -0.75),
                    blend_mode = "additive",
                    scale = 0.5
                }
            },
            -- Animation
            {
                filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/animations/assembling-machine-animation-"..tier..".png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, -0.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/animations/hr-assembling-machine-animation-"..tier..".png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, -0.75),
                    scale = 0.5
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/shadows/assembling-machine-"..shadow.."-shadow.png",
                priority="high",
                width = 132,
                height = 83,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(27, 5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/assembly/assembling-machine/shadows/hr-assembling-machine-"..shadow.."-shadow.png",
                    priority="high",
                    width = 264,
                    height = 165,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(27, 5),
                    scale = 0.5
                }
            }
        }
    }

    -- Handle pipes
    if has_fluids then
        entity.fluid_boxes =
        {
            {
                production_type = "input",
                pipe_picture = pipe_pictures(inputs.tint),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {0, -2} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = pipe_pictures(inputs.tint),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {0, 2} }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        }
    end

    -- Label to skip to next iteration
    ::continue::    
end





