-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end
if settings.startup["reskins-lib-customize-tier-colors"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "splitter",
    root_name = "splitter",
    directory = reskins.bobs.directory,
    mod = "logistics",
    particles = {["medium"] = 3, ["small"] = 2}
}

local tier_map =
{
    ["basic-splitter"]    = {0, 1},
    ["splitter"]          = {1, 1},
    ["fast-splitter"]     = {2, 2},
    ["express-splitter"]  = {3, 2},
    ["turbo-splitter"]    = {4, 2},
    ["ultimate-splitter"] = {5, 2},
}

local color_adjustment = 40/255

-- Reskin entities
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    variant = map[2]

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- Tint adjustment
    adjusted_tint = reskins.lib.adjust_tint(inputs.tint, color_adjustment, 0.82)

    -- Reskin entities
    entity.structure = {
        north = {
            layers = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/north/splitter-north.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 82,
                    height = 36,
                    shift = util.by_pixel(6, 0),
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/north/hr-splitter-north.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 160,
                        height = 70,
                        shift = util.by_pixel(7, 0),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/north/splitter-north-mask.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 82,
                    height = 36,
                    shift = util.by_pixel(6, 0),
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/north/hr-splitter-north-mask.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 160,
                        height = 70,
                        shift = util.by_pixel(7, 0),
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
	    east = {
            layers = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/east/splitter-east.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 44,
                    shift = util.by_pixel(4, 12),
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/east/hr-splitter-east.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 90,
                        height = 84,
                        shift = util.by_pixel(4, 13),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/east/splitter-east-mask.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 44,
                    shift = util.by_pixel(4, 12),
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/east/hr-splitter-east-mask.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 90,
                        height = 84,
                        shift = util.by_pixel(4, 13),
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
        south = {
            layers = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/south/splitter-south.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 82,
                    height = 32,
                    shift = util.by_pixel(4, 0),
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/south/hr-splitter-south.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 164,
                        height = 64,
                        shift = util.by_pixel(4, 0),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/south/splitter-south-mask.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 82,
                    height = 32,
                    shift = util.by_pixel(4, 0),
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/south/hr-splitter-south-mask.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 164,
                        height = 64,
                        shift = util.by_pixel(4, 0),
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
        west = {
            layers = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/west/splitter-west.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 44,
                    shift = util.by_pixel(6, 12),
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/west/hr-splitter-west.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 94,
                        height = 86,
                        shift = util.by_pixel(5, 12),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/west/splitter-west-mask.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 44,
                    shift = util.by_pixel(6, 12),
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/west/hr-splitter-west-mask.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 94,
                        height = 86,
                        shift = util.by_pixel(5, 12),
                        tint = adjusted_tint,
                        scale = 0.5 
                    }
                }
            }
        }
    }

	entity.structure_patch = 
	{
		north = util.empty_sprite(),
		east = {
            layers = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/east/splitter-east-top_patch.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 52,
                    shift = util.by_pixel(4, -20),
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/east/hr-splitter-east-top_patch.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 90,
                        height = 104,
                        shift = util.by_pixel(4, -20),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/east/splitter-east-top_patch-mask.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 52,
                    shift = util.by_pixel(4, -20),
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/east/hr-splitter-east-top_patch-mask.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 90,
                        height = 104,
                        shift = util.by_pixel(4, -20),
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
		south = util.empty_sprite(),
		west = {
            layers = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/west/splitter-west-top_patch.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 48,
                    shift = util.by_pixel(6, -18),
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/west/hr-splitter-west-top_patch.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 94,
                        height = 96,
                        shift = util.by_pixel(5, -18),
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/splitter/west/splitter-west-top_patch-mask.png",
                    frame_count = 32,
                    line_length = 8,
                    priority = "extra-high",
                    width = 46,
                    height = 48,
                    shift = util.by_pixel(6, -18),
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/splitter/west/hr-splitter-west-top_patch-mask.png",
                        frame_count = 32,
                        line_length = 8,
                        priority = "extra-high",
                        width = 94,
                        height = 96,
                        shift = util.by_pixel(5, -18),
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        }
    }

    -- Apply belt set
    entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(adjusted_tint, variant)

    -- Label to skip to next iteration
    ::continue::
end