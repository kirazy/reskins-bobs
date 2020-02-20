-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] then return end
if settings.startup["bobmods-assembly-chemicalplants"].value == false then return end

-- Set parameters
local type = "assembling-machine"
local flags = 
{
    basename = "chemical-plant",
    baseentity = "chemical-plant",
    directory = reskins.bobs_structures.directory,
    folder = "chemical-plant",
    particles = {"medium","big"},
}

-- Chemical plants have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["chemical-plant"]   = 1,
        ["chemical-plant-2"] = 2,
        ["chemical-plant-3"] = 3,
        ["chemical-plant-4"] = 4
    }
else
    tier_map =
    {
        ["chemical-plant"]   = 2,
        ["chemical-plant-2"] = 3,
        ["chemical-plant-3"] = 4,
        ["chemical-plant-4"] = 5
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

    -- Handle basename, used when ingredient-mapping tiers
    if name == "chemical-plant" then
        flags.basename = name
    else
        flags.basename = string.sub(name, 1, string.len(name)-2)
    end
    
    reskins.lib.setup_common_attributes(name, type, tier, flags)

    -- Initialize table addresses    
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]

    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Handle tier mapping settings, overwrite name with mapped name
    -- Caution: name beyond this point if remapping occurs no longer corresponds to the entity name
    if flags.remap_tiers == true then     
        name = flags.basename.."-"..tier
    end

    -- Create remnants
    remnant.animation = 
    {
        layers =
        {
            {
                filename = "__base__/graphics/entity/chemical-plant/remnants/chemical-plant-remnants.png",
                line_length = 1,
                width = 224,
                height = 172,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(16, -5),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/remnants/hr-chemical-plant-remnants.png",
                    line_length = 1,
                    width = 446,
                    height = 342,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(16, -5.5),
                    scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/chemical-plant/"..name.."/remnants/"..name.."-remnants-mask.png",
                line_length = 1,
                width = 224,
                height = 172,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(16, -5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/chemical-plant/"..name.."/remnants/hr-"..name.."-remnants-mask.png",
                    line_length = 1,
                    width = 446,
                    height = 342,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(16, -5.5),
                    scale = 0.5,
                }
            }
        }
    }

    -- Create entities
    entity.animation = make_4way_animation_from_spritesheet(
    { 
        layers =
        {
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
                width = 108,
                height = 148,
                frame_count = 24,
                line_length = 12,
                shift = util.by_pixel(1, -9),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant.png",
                    width = 220,
                    height = 292,
                    frame_count = 24,
                    line_length = 12,
                    shift = util.by_pixel(0.5, -9),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/chemical-plant/"..name.."/"..name.."-mask.png",
                width = 108,
                height = 148,
                frame_count = 24,
                line_length = 12,
                shift = util.by_pixel(1, -9),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/chemical-plant/"..name.."/hr-"..name.."-mask.png",
                    width = 220,
                    height = 292,
                    frame_count = 24,
                    line_length = 12,
                    shift = util.by_pixel(0.5, -9),
                    scale = 0.5
                }
            },
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
                width = 154,
                height = 112,
                repeat_count = 24,
                frame_count = 1,
                shift = util.by_pixel(28, 6),
                draw_as_shadow = true,
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
                    width = 312,
                    height = 222,
                    repeat_count = 24,
                    frame_count = 1,
                    shift = util.by_pixel(27, 6),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        }
    })

    entity.working_visualisations = 
    {
        {
            apply_recipe_tint = "primary",
            north_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
                frame_count = 24,
                line_length = 6,
                width = 32,
                height = 24,
                shift = util.by_pixel(24, 14),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-north.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 66,
                    height = 44,
                    shift = util.by_pixel(23, 15),
                    scale = 0.5
                }
            },
            east_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-east.png",
                frame_count = 24,
                line_length = 6,
                width = 36,
                height = 18,
                shift = util.by_pixel(0, 22),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-east.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 70,
                    height = 36,
                    shift = util.by_pixel(0, 22),
                    scale = 0.5
                }
            },
            south_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-south.png",
                frame_count = 24,
                line_length = 6,
                width = 34,
                height = 24,
                shift = util.by_pixel(0, 16),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-south.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 66,
                    height = 42,
                    shift = util.by_pixel(0, 17),
                    scale = 0.5
                }
            },
            west_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-west.png",
                frame_count = 24,
                line_length = 6,
                width = 38,
                height = 20,
                shift = util.by_pixel(-10, 12),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-liquid-west.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 74,
                    height = 36,
                    shift = util.by_pixel(-10, 13),
                    scale = 0.5
                }
            }
        },
        {
            apply_recipe_tint = "secondary",
            north_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
                frame_count = 24,
                line_length = 6,
                width = 32,
                height = 22,
                shift = util.by_pixel(24, 14),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-north.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 62,
                    height = 42,
                    shift = util.by_pixel(24, 15),
                    scale = 0.5
                }
            },
            east_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-east.png",
                frame_count = 24,
                line_length = 6,
                width = 34,
                height = 18,
                shift = util.by_pixel(0, 22),
                hr_version =
                {
                filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-east.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 68,
                    height = 36,
                    shift = util.by_pixel(0, 22),
                    scale = 0.5
                }
            },
            south_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-south.png",
                frame_count = 24,
                line_length = 6,
                width = 32,
                height = 18,
                shift = util.by_pixel(0, 18),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-south.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 60,
                    height = 40,
                    shift = util.by_pixel(1, 17),
                    scale = 0.5
                }
            },
            west_animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-west.png",
                frame_count = 24,
                line_length = 6,
                width = 36,
                height = 16,
                shift = util.by_pixel(-10, 14),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-foam-west.png",
                    frame_count = 24,
                    line_length = 6,
                    width = 68,
                    height = 28,
                    shift = util.by_pixel(-9, 15),
                    scale = 0.5
                }
            }
        },
        {
            apply_recipe_tint = "tertiary",
            fadeout = true,
            constant_speed = true,
            north_position = util.by_pixel_hr(-30, -161),
            east_position = util.by_pixel_hr(29, -150),
            south_position = util.by_pixel_hr(12, -134),
            west_position = util.by_pixel_hr(-32, -130),
            render_layer = "wires",
            animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
                frame_count = 47,
                line_length = 16,
                width = 46,
                height = 94,
                animation_speed = 0.5,
                shift = util.by_pixel(-2, -40),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png",
                    frame_count = 47,
                    line_length = 16,
                    width = 90,
                    height = 188,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-2, -40),
                    scale = 0.5
                }
            }
        },
        {
            apply_recipe_tint = "quaternary",
            fadeout = true,
            constant_speed = true,
            north_position = util.by_pixel_hr(-30, -161),
            east_position = util.by_pixel_hr(29, -150),
            south_position = util.by_pixel_hr(12, -134),
            west_position = util.by_pixel_hr(-32, -130),
            render_layer = "wires",
            animation =
            {
                filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
                frame_count = 47,
                line_length = 16,
                width = 20,
                height = 42,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -14),
                hr_version =
                {
                    filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-inner.png",
                    frame_count = 47,
                    line_length = 16,
                    width = 40,
                    height = 84,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -14),
                    scale = 0.5
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end