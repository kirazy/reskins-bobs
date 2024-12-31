-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.power.entities) then return end
if not (reskins.bobs and reskins.bobs.triggers.power.poles) then return end

-- Set input parameters
local inputs = {
    type = "electric-pole",
    icon_name = "big-electric-pole",
    base_entity_name = "big-electric-pole",
    mod = "bobs",
    group = "power",
    particles = { ["medium-long"] = 1 },
}

local tier_map = {
    ["big-electric-pole"] = { 1, 2 },
    ["big-electric-pole-2"] = { 2, 3 },
    ["big-electric-pole-3"] = { 3, 4 },
    ["big-electric-pole-4"] = { 4, 5 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    ---@type data.ElectricPolePrototype
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
    remnant.animation = make_rotated_animation_variations_from_sheet(4, {
        layers = {
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/base/remnants/big-electric-pole-base-remnants.png",
                line_length = 1,
                width = 366,
                height = 188,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(43, 0.5),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/remnants/big-electric-pole-base-remnants-mask.png",
                line_length = 1,
                width = 366,
                height = 188,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(43, 0.5),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/remnants/big-electric-pole-base-remnants-highlights.png",
                line_length = 1,
                width = 366,
                height = 188,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(43, 0.5),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
        },
    })

    remnant.animation_overlay = make_rotated_animation_variations_from_sheet(4, {
        layers = {
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/base/remnants/big-electric-pole-top-remnants.png",
                line_length = 1,
                width = 148,
                height = 252,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-1.5, -48),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/remnants/big-electric-pole-top-remnants-mask.png",
                line_length = 1,
                width = 148,
                height = 252,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-1.5, -48),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/remnants/big-electric-pole-top-remnants-highlights.png",
                line_length = 1,
                width = 148,
                height = 252,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-1.5, -48),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
        },
    })

    -- Reskin entities
    entity.pictures = {
        layers = {
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/base/big-electric-pole.png",
                priority = "extra-high",
                width = 148,
                height = 312,
                direction_count = 4,
                shift = util.by_pixel(0, -51),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/big-electric-pole-mask.png",
                priority = "extra-high",
                width = 148,
                height = 312,
                direction_count = 4,
                shift = util.by_pixel(0, -51),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/big-electric-pole-highlights.png",
                priority = "extra-high",
                width = 148,
                height = 312,
                direction_count = 4,
                shift = util.by_pixel(0, -51),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
            -- Shadow
            {
                filename = "__reskins-bobs__/graphics/entity/power/big-electric-pole/base/big-electric-pole-shadow.png",
                priority = "extra-high",
                width = 374,
                height = 94,
                direction_count = 4,
                shift = util.by_pixel(60, 0),
                draw_as_shadow = true,
                scale = 0.5,
            },
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
