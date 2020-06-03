-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end

-- We reskin the base entities only if we're doing custom colors
local custom_colors = true
if settings.startup["reskins-lib-customize-tier-colors"].value == false then
    custom_colors = false
end

-- Set input parameters
local inputs = {
    type = "splitter",
    icon_name = "splitter",
    base_entity = "splitter",
    directory = reskins.bobs.directory,
    group = "logistics",
    particles = {["medium"] = 1, ["big"] = 4},
    make_belt_icon = true,
}

local tier_map = {
    ["basic-splitter"] = {0, 1, true},
    ["splitter"] = {1, 1, custom_colors},
    ["fast-splitter"] = {2, 2, custom_colors},
    ["express-splitter"] = {3, 2, custom_colors},
    ["turbo-splitter"] = {4, 2, true},
    ["ultimate-splitter"] = {5, 2, true},
}

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
    do_reskin = map[3]

    -- Determine what tint we're using
    inputs.tint = reskins.bobs.belt_tint_handling(name, tier)

    if do_reskin then
        inputs.make_icons = true
    else
        inputs.make_icons = false
        reskins.lib.append_tier_labels_to_vanilla_icon(name, tier, inputs)
    end

    reskins.lib.setup_standard_entity(name, tier, inputs)    

    if do_reskin then
        -- Reskin remnants

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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/splitter/north/hr-splitter-north-mask.png",
                            frame_count = 32,
                            line_length = 8,
                            priority = "extra-high",
                            width = 160,
                            height = 70,
                            shift = util.by_pixel(7, 0),
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/splitter/east/hr-splitter-east-mask.png",
                            frame_count = 32,
                            line_length = 8,
                            priority = "extra-high",
                            width = 90,
                            height = 84,
                            shift = util.by_pixel(4, 13),
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/splitter/south/hr-splitter-south-mask.png",
                            frame_count = 32,
                            line_length = 8,
                            priority = "extra-high",
                            width = 164,
                            height = 64,
                            shift = util.by_pixel(4, 0),
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/splitter/west/hr-splitter-west-mask.png",
                            frame_count = 32,
                            line_length = 8,
                            priority = "extra-high",
                            width = 94,
                            height = 86,
                            shift = util.by_pixel(5, 12),
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/splitter/east/hr-splitter-east-top_patch-mask.png",
                            frame_count = 32,
                            line_length = 8,
                            priority = "extra-high",
                            width = 90,
                            height = 104,
                            shift = util.by_pixel(4, -20),
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/splitter/west/hr-splitter-west-top_patch-mask.png",
                            frame_count = 32,
                            line_length = 8,
                            priority = "extra-high",
                            width = 94,
                            height = 96,
                            shift = util.by_pixel(5, -18),
                            tint = inputs.tint,
                            scale = 0.5
                        }
                    }
                }
            }
        }

        -- Apply belt set
        entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(inputs.tint, variant)
    end

    -- Handle grouping and ordering in the UI
    base_item = data.raw["item"][string.gsub(name, "splitter", "transport-belt")]

    inputs.sort_order = string.gsub(string.gsub(item.order,"^[a-z]","c"),"transport%-belt","splitter")
    inputs.sort_group = base_item.group
    inputs.sort_subgroup = base_item.subgroup

    reskins.lib.assign_order(name, inputs)

    -- Label to skip to next iteration
    ::continue::
end