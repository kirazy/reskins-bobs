-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

function reskins.bobs.assembly_pipe_pictures(tint)
    return
    {
        north =
        {
            layers =
            {
                -- Base
                {
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-N-base.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-base.png",
                        priority = "extra-high",
                        width = 71,
                        height = 38,
                        shift = util.by_pixel(2.25, 13.5),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-N-mask.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-N-highlights.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-highlights.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-E-base.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-base.png",
                        priority = "extra-high",
                        width = 42,
                        height = 76,
                        shift = util.by_pixel(-24.5, 1),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-E-mask.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-E-highlights.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-highlights.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-S-base.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-base.png",
                        priority = "extra-high",
                        width = 88,
                        height = 61,
                        shift = util.by_pixel(0, -31.25),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-S-mask.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-S-highlights.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-highlights.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-W-base.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-base.png",
                        priority = "extra-high",
                        width = 39,
                        height = 73,
                        shift = util.by_pixel(25.75, 1.25),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-W-mask.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-W-highlights.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-highlights.png",
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

function reskins.bobs.pipe_pictures(inputs)
    return
    {
        straight_vertical_single =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-straight-vertical-single.png",
            priority = "extra-high",
            width = 80,
            height = 80,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-straight-vertical-single.png",
                priority = "extra-high",
                width = 160,
                height = 160,
                scale = 0.5
            }
        },
        straight_vertical =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-straight-vertical.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-straight-vertical.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        straight_vertical_window =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-straight-vertical-window.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-straight-vertical-window.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        straight_horizontal_window =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-straight-horizontal-window.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-straight-horizontal-window.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        straight_horizontal =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-straight-horizontal.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-straight-horizontal.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        corner_up_right =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-corner-up-right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-corner-up-right.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        corner_up_left =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-corner-up-left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-corner-up-left.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        corner_down_right =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-corner-down-right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-corner-down-right.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        corner_down_left =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-corner-down-left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-corner-down-left.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        t_up =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-t-up.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-t-up.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        t_down =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-t-down.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-t-down.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        t_right =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-t-right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-t-right.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        t_left =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-t-left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-t-left.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        cross =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-cross.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-cross.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        ending_up =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-ending-up.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-ending-up.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        ending_down =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-ending-down.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-ending-down.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        ending_right =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-ending-right.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-ending-right.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        ending_left =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-ending-left.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-ending-left.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        horizontal_window_background =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-horizontal-window-background.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-horizontal-window-background.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        vertical_window_background =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/pipe-vertical-window-background.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/hr-pipe-vertical-window-background.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        fluid_background =
        {
            filename = "__base__/graphics/entity/pipe/fluid-background.png",
            priority = "extra-high",
            width = 32,
            height = 20,
            hr_version =
            {
                filename = "__base__/graphics/entity/pipe/hr-fluid-background.png",
                priority = "extra-high",
                width = 64,
                height = 40,
                scale = 0.5
            }
        },
        low_temperature_flow =
        {
            filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
            priority = "extra-high",
            width = 160,
            height = 18
        },
        middle_temperature_flow =
        {
            filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
            priority = "extra-high",
            width = 160,
            height = 18
        },
        high_temperature_flow =
        {
            filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
            priority = "extra-high",
            width = 160,
            height = 18
        },
        gas_flow =
        {
            filename = "__base__/graphics/entity/pipe/steam.png",
            priority = "extra-high",
            line_length = 10,
            width = 24,
            height = 15,
            frame_count = 60,
            axially_symmetrical = false,
            direction_count = 1,
            hr_version =
            {
                filename = "__base__/graphics/entity/pipe/hr-steam.png",
                priority = "extra-high",
                line_length = 10,
                width = 48,
                height = 30,
                frame_count = 60,
                axially_symmetrical = false,
                direction_count = 1
            }
        }
    }
end

function reskins.bobs.underground_pipe_pictures(inputs)
    return
    {
        up =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/pipe-to-ground-up.png",
            priority = "high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/hr-pipe-to-ground-up.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        down =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/pipe-to-ground-down.png",
            priority = "high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/hr-pipe-to-ground-down.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        left =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/pipe-to-ground-left.png",
            priority = "high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/hr-pipe-to-ground-left.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        },
        right =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/pipe-to-ground-right.png",
            priority = "high",
            width = 64,
            height = 64,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/hr-pipe-to-ground-right.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5
            }
        }
    }
end