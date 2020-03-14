-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

function reskins.bobs.pipe_pictures(tint)
    return
    {
        north =
        {
            layers =
            {
                -- Base
                {
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-N-base.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-base.png",
                        priority = "extra-high",
                        width = 71,
                        height = 38,
                        shift = util.by_pixel(2.25, 13.5),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-N-mask.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-N-highlights.png",
                    priority = "extra-high",
                    width = 35,
                    height = 18,
                    shift = util.by_pixel(2.5, 14),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-N-highlights.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-E-base.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-base.png",
                        priority = "extra-high",
                        width = 42,
                        height = 76,
                        shift = util.by_pixel(-24.5, 1),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-E-mask.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-E-highlights.png",
                    priority = "extra-high",
                    width = 20,
                    height = 38,
                    shift = util.by_pixel(-25, 1),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-E-highlights.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-S-base.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-base.png",
                        priority = "extra-high",
                        width = 88,
                        height = 61,
                        shift = util.by_pixel(0, -31.25),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-S-mask.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-S-highlights.png",
                    priority = "extra-high",
                    width = 44,
                    height = 31,
                    shift = util.by_pixel(0, -31.5),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-S-highlights.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-W-base.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-base.png",
                        priority = "extra-high",
                        width = 39,
                        height = 73,
                        shift = util.by_pixel(25.75, 1.25),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-W-mask.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    tint = tint,
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-mask.png",
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
                    filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/assembling-machine-pipe-W-highlights.png",
                    priority = "extra-high",
                    width = 19,
                    height = 37,
                    shift = util.by_pixel(25.5, 1.5),
                    blend_mode = "additive",
                    hr_version =
                    {
                        filename = reskins.bobs.directory.."/graphics/entity/structures/assembly/assembling-machine/pipes/hr-assembling-machine-pipe-W-highlights.png",
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