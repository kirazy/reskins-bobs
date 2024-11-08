-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.warfare.entities) then return end

-- Set input parameters
local inputs = {
    type = "artillery-turret",
    icon_name = "artillery-turret",
    base_entity_name = "artillery-turret",
    mod = "bobs",
    group = "warfare",
    particles = { ["big"] = 4 },
}

local tier_map = {
    ["artillery-turret"] = { 1, 3 },
    ["bob-artillery-turret-2"] = { 2, 4 },
    ["bob-artillery-turret-3"] = { 3, 5 },
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
                filename = "__reskins-bobs__/graphics/entity/warfare/artillery-turret/remnants/hr-artillery-turret-remnants-base.png",
                width = 326,
                height = 290,
                direction_count = 1,
                shift = util.by_pixel(9.5, 1.5),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/warfare/artillery-turret/remnants/hr-artillery-turret-remnants-mask.png",
                width = 326,
                height = 290,
                direction_count = 1,
                shift = util.by_pixel(9.5, 1.5),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/warfare/artillery-turret/remnants/hr-artillery-turret-remnants-highlights.png",
                width = 326,
                height = 290,
                direction_count = 1,
                shift = util.by_pixel(9.5, 1.5),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            }
        }
    })

    -- Reskin entity
    entity.base_picture = {
        layers = {
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/warfare/artillery-turret/hr-artillery-turret-base.png",
                priority = "high",
                width = 207,
                height = 199,
                shift = util.by_pixel(-0, 22),
                scale = 0.5
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/warfare/artillery-turret/hr-artillery-turret-mask.png",
                priority = "high",
                width = 207,
                height = 199,
                shift = util.by_pixel(-0, 22),
                tint = inputs.tint,
                scale = 0.5
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/warfare/artillery-turret/hr-artillery-turret-highlights.png",
                priority = "high",
                width = 207,
                height = 199,
                shift = util.by_pixel(-0, 22),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5
            },
            -- Shadow
            {
                filename = "__base__/graphics/entity/artillery-turret/hr-artillery-turret-base-shadow.png",
                priority = "high",
                width = 277,
                height = 149,
                shift = util.by_pixel(18 + 2, 38),
                draw_as_shadow = true,
                scale = 0.5
            }
        }
    }

    -- Adjust drawing box
    entity.drawing_box = { { -1.5, -2.5 }, { 1.5, 1.5 } }

    -- Label to skip to next iteration
    ::continue::
end
