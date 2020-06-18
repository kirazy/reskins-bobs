-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobmodules"] then return end
if settings.startup["reskins-bobs-do-bobmodules"].value == false then return end

local function setup_beacon_module_slot(parameters)
    local slot = {
        -- Slot Base
        {
            has_empty_slot = true,
            render_layer = "lower-object",
            pictures = {
                filename = "__base__/graphics/entity/beacon/beacon-module-slot-1.png",
                line_length = 4,
                width = 26,
                height = 34,
                variation_count = 4,
                shift = util.by_pixel(-16, 15),
                hr_version = {
                    filename = "__base__/graphics/entity/beacon/hr-beacon-module-slot-1.png",
                    line_length = 4,
                    width = 50,
                    height = 66,
                    variation_count = 4,
                    scale = 0.5,
                    shift = util.by_pixel(-16, 14.5),
                }
            }
        },
        -- Slot Mask
        {
            apply_module_tint = "primary",
            render_layer = "lower-object",
            pictures = {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-box-1.png",
                line_length = 3,
                width = 18,
                height = 16,
                variation_count = 3,
                shift = util.by_pixel(-17, 15),
                hr_version = {
                    filename = "__base__/graphics/entity/beacon/hr-beacon-module-mask-box-1.png",
                    line_length = 3,
                    width = 36,
                    height = 32,
                    variation_count = 3,
                    scale = 0.5,
                    shift = util.by_pixel(-17, 15),
                }
            }
        },
        -- Slot Lights Count
        {
            apply_module_tint = "secondary",
            render_layer = "lower-object-above-shadow",
            pictures = {
                filename = "__base__/graphics/entity/beacon/beacon-module-mask-lights-1.png",
                line_length = 3,
                width = 14,
                height = 6,
                variation_count = 3,
                shift = util.by_pixel(-18, 13),
                hr_version = {
                    filename = "__base__/graphics/entity/beacon/hr-beacon-module-mask-lights-1.png",
                    line_length = 3,
                    width = 26,
                    height = 12,
                    variation_count = 3,
                    scale = 0.5,
                    shift = util.by_pixel(-18.5, 13),
                }
            }
        },
        -- Slot Lights Radiance
        {
            apply_module_tint = "secondary",
            draw_as_light = true,
            draw_as_sprite = false,
            pictures = {
                filename = "__base__/graphics/entity/beacon/beacon-module-lights-1.png",
                line_length = 3,
                width = 28,
                height = 22,
                variation_count = 3,
                shift = util.by_pixel(-18, 13),
                hr_version = {
                    filename = "__base__/graphics/entity/beacon/hr-beacon-module-lights-1.png",
                    line_length = 3,
                    width = 56,
                    height = 42,
                    variation_count = 3,
                    shift = util.by_pixel(-18, 13),
                    scale = 0.5
                }
            }
        }
    }

    return slot
end

-- Set input parameters
local inputs = {
    type = "beacon",
    icon_name = "beacon",
    base_entity = "beacon",
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "modules",
    particles = {["small"] = 3},
    make_icons = false,
    make_remnants = false,
}

local tier_map = {
    ["beacon"] = {1, 3},
    ["beacon-2"] = {2, 4},
    ["beacon-3"] = {3, 5},
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end
    
    -- Parse map
    if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
        tier = map[1]
    else
        tier = map[2]
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
  
    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- TODO: Remnants

    -- Reskin entities
    entity.graphics_set.animation_list =
    {
        {
            render_layer = "floor-mechanics",
            always_draw = true,
            animation = {
                layers = {
                    -- Base
                    {
                        filename = "__base__/graphics/entity/beacon/beacon-bottom.png",
                        width = 106,
                        height = 96,
                        shift = util.by_pixel(0, 1),
                        hr_version = {
                            filename = "__base__/graphics/entity/beacon/hr-beacon-bottom.png",
                            width = 212,
                            height = 192,
                            scale = 0.5,
                            shift = util.by_pixel(0.5, 1),
                        }
                    },
                    -- Mask
                    {
                        filename = inputs.directory.."/graphics/entity/modules/beacon/beacon-bottom-mask.png",
                        width = 106,
                        height = 96,
                        shift = util.by_pixel(0, 1),
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/modules/beacon/hr-beacon-bottom-mask.png",
                            width = 212,
                            height = 192,
                            shift = util.by_pixel(0.5, 1),
                            tint = inputs.tint,
                            scale = 0.5,
                        }
                    },
                    -- Highlights
                    {
                        filename = inputs.directory.."/graphics/entity/modules/beacon/beacon-bottom-highlights.png",
                        width = 106,
                        height = 96,
                        shift = util.by_pixel(0, 1),
                        blend_mode = "additive",
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/modules/beacon/hr-beacon-bottom-highlights.png",
                            width = 212,
                            height = 192,
                            shift = util.by_pixel(0.5, 1),
                            blend_mode = "additive",
                            scale = 0.5,
                        }
                    },
                    -- Shadow
                    {
                        filename = "__base__/graphics/entity/beacon/beacon-shadow.png",
                        width = 122,
                        height = 90,
                        draw_as_shadow = true,
                        shift = util.by_pixel(12, 1),
                        hr_version = {
                            filename = "__base__/graphics/entity/beacon/hr-beacon-shadow.png",
                            width = 244,
                            height = 176,
                            scale = 0.5,
                            draw_as_shadow = true,
                            shift = util.by_pixel(12.5, 0.5),
                        }
                    }
                }
            }
        },
        {
            render_layer = "object",
            always_draw = true,
            animation = {
                filename = "__base__/graphics/entity/beacon/beacon-top.png",
                width = 48,
                height = 70,
                repeat_count = 45,
                animation_speed = 0.5,
                shift = util.by_pixel(3, -19),
                hr_version = {
                    filename = "__base__/graphics/entity/beacon/hr-beacon-top.png",
                    width = 96,
                    height = 140,
                    scale = 0.5,
                    repeat_count = 45,
                    animation_speed = 0.5,
                    shift = util.by_pixel(3, -19),
                }
            }
        },
        {
            render_layer = "object",
            apply_tint = true,
            draw_as_sprite = true,
            draw_as_light = true,
            always_draw = false,
            animation = {
                filename = "__base__/graphics/entity/beacon/beacon-light.png",
                line_length = 9,
                width = 56,
                height = 94,
                frame_count = 45,
                animation_speed = 0.5,
                shift = util.by_pixel(1, -18),
                blend_mode = "additive",
                hr_version = {
                    filename = "__base__/graphics/entity/beacon/hr-beacon-light.png",
                    line_length = 9,
                    width = 110,
                    height = 186,
                    frame_count = 45,
                    animation_speed = 0.5,
                    scale = 0.5,
                    shift = util.by_pixel(0.5, -18),
                    blend_mode = "additive",
                }
            }
        }
    }

    -- Handle module slots
    -- entity.graphics_set.module_visualisations = {
    --     {
    --         art_style = "vanilla",
    --         use_for_empty_slots = true,
    --         tier_offset = 0,
    --         slots = {
    --             setup_beacon_module_slot(parameters),
    --             setup_beacon_module_slot(parameters),
    --             setup_beacon_module_slot(parameters),
    --             setup_beacon_module_slot(parameters),
    --             setup_beacon_module_slot(parameters),
    --             setup_beacon_module_slot(parameters),
    --         }
    --     }
    -- }

    -- Label to skip to next iteration
    ::continue::
end