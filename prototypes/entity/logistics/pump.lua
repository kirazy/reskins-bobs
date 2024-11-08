-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then return end

-- Set input parameters
local inputs = {
    type = "pump",
    icon_name = "pump",
    base_entity_name = "pump",
    mod = "bobs",
    group = "logistics",
    particles = { ["medium"] = 3 },
}

local tier_map = {
    ["pump"] = { 1, 2 },
    ["bob-pump-2"] = { 2, 3 },
    ["bob-pump-3"] = { 3, 4 },
    ["bob-pump-4"] = { 4, 5 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Parse map
    local tier = map[1]
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map[2]
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tiers.get_tint(tier)

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Fetch remnant
    local remnant = data.raw["corpse"][name .. "-remnants"]

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet(1, {
        layers = {
            -- Base
            {
                filename = "__base__/graphics/entity/pump/remnants/hr-pump-remnants.png",
                line_length = 1,
                width = 188,
                height = 186,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(2, 2),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/pump/remnants/hr-pump-remnants-mask.png",
                line_length = 1,
                width = 188,
                height = 186,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(2, 2),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/pump/remnants/hr-pump-remnants-highlights.png",
                line_length = 1,
                width = 188,
                height = 186,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(2, 2),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
        },
    })

    -- Reskin entities
    entity.animations = {
        north = {
            layers = {
                -- Base
                {
                    filename = "__base__/graphics/entity/pump/hr-pump-north.png",
                    width = 103,
                    height = 164,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(8, 3.5),
                },
                -- Mask
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-north-mask.png",
                    width = 103,
                    height = 164,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(8, 3.5),
                    tint = inputs.tint,
                },
                -- Highlights
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-north-highlights.png",
                    width = 103,
                    height = 164,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(8, 3.5),
                    blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                },
            },
        },
        east = {
            layers = {
                -- Base
                {
                    filename = "__base__/graphics/entity/pump/hr-pump-east.png",
                    width = 130,
                    height = 109,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.5, 1.75),
                },
                -- Mask
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-east-mask.png",
                    width = 130,
                    height = 109,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.5, 1.75),
                    tint = inputs.tint,
                },
                -- Highlights
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-east-highlights.png",
                    width = 130,
                    height = 109,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.5, 1.75),
                    blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                },
            },
        },
        south = {
            layers = {
                -- Base
                {
                    filename = "__base__/graphics/entity/pump/hr-pump-south.png",
                    width = 114,
                    height = 160,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(12.5, -8),
                },
                -- Mask
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-south-mask.png",
                    width = 114,
                    height = 160,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(12.5, -8),
                    tint = inputs.tint,
                },
                -- Highlights
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-south-highlights.png",
                    width = 114,
                    height = 160,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(12.5, -8),
                    blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                },
            },
        },
        west = {
            layers = {
                -- Base
                {
                    filename = "__base__/graphics/entity/pump/hr-pump-west.png",
                    width = 131,
                    height = 111,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.25, 1.25),
                },
                -- Mask
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-west-mask.png",
                    width = 131,
                    height = 111,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.25, 1.25),
                    tint = inputs.tint,
                },
                -- Highlights
                {
                    filename = "__reskins-bobs__/graphics/entity/logistics/pump/hr-pump-west-highlights.png",
                    width = 131,
                    height = 111,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 32,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.25, 1.25),
                    blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                },
            },
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
