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
    icon_name = "substation",
    base_entity_name = "substation",
    mod = "bobs",
    group = "power",
    particles = { ["big"] = 2 },
}

local tier_map = {
    ["substation"] = { 1, 2 },
    ["substation-2"] = { 2, 3 },
    ["substation-3"] = { 3, 4 },
    ["substation-4"] = { 4, 5 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Initialize table address
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

    -- Initialize table addresses
    local remnant = data.raw["corpse"][name .. "-remnants"]

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet(1, {
        layers = {
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/power/substation/base/remnants/substation-remnants.png",
                line_length = 1,
                width = 182,
                height = 134,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2.5, 0.5),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/power/substation/remnants/substation-remnants-mask.png",
                line_length = 1,
                width = 182,
                height = 134,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2.5, 0.5),
                tint = inputs.tint,
                scale = 0.5,
            },
            {
                filename = "__reskins-bobs__/graphics/entity/power/substation/remnants/substation-remnants-highlights.png",
                line_length = 1,
                width = 182,
                height = 134,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2.5, 0.5),
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
                filename = "__reskins-bobs__/graphics/entity/power/substation/base/substation.png",
                priority = "high",
                width = 138,
                height = 270,
                direction_count = 4,
                shift = util.by_pixel(0, 1 - 32),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/power/substation/substation-mask.png",
                priority = "high",
                width = 138,
                height = 270,
                direction_count = 4,
                shift = util.by_pixel(0, 1 - 32),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/power/substation/substation-highlights.png",
                priority = "high",
                width = 138,
                height = 270,
                direction_count = 4,
                shift = util.by_pixel(0, 1 - 32),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
            -- Shadow
            {
                filename = "__reskins-bobs__/graphics/entity/power/substation/base/substation-shadow.png",
                priority = "high",
                width = 370,
                height = 104,
                direction_count = 4,
                shift = util.by_pixel(62, 42 - 32),
                draw_as_shadow = true,
                scale = 0.5,
            },
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
