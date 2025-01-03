-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then return end

-- Set input parameters
local inputs = {
    type = "roboport",
    icon_name = "robochest",
    base_entity_name = "roboport",
    mod = "bobs",
    group = "logistics",
    particles = { ["medium"] = 2 },
    make_remnants = false,
}

local tier_map = {
    ["bob-robochest"] = { 1, 2 },
    ["bob-robochest-2"] = { 2, 3 },
    ["bob-robochest-3"] = { 3, 4 },
    ["bob-robochest-4"] = { 4, 5 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    ---@type data.RoboportPrototype
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Parse map
    local tier = map[1]
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map[2]
    end
    local subtier = map[1]

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tiers.get_tint(tier)

    -- Setup icon details
    inputs.icon_base = "robochest-" .. subtier

    reskins.lib.setup_standard_entity(name, tier, inputs)

    entity.spawn_and_station_height = -0.25

    entity.base = {
        layers = {
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/robochest/robochest-base.png",
                width = 130,
                height = 138,
                shift = util.by_pixel(0, -2.75),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/robochest/robochest-mask.png",
                width = 130,
                height = 138,
                shift = util.by_pixel(0, -2.75),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/robochest/robochest-highlights.png",
                width = 130,
                height = 138,
                shift = util.by_pixel(0, -2.75),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
            -- Shadow
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/robochest/robochest-shadow.png",
                width = 174,
                height = 108,
                shift = util.by_pixel(12, 5),
                draw_as_shadow = true,
                scale = 0.5,
            },
        },
    }

    entity.base_patch = {
        layers = {
            -- Padding
            {
                filename = "__reskins-bobs__/graphics/empty.png",
                priority = "medium",
                width = 1,
                height = 1,
                frame_count = 1,
            },
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/robochest/robochest-base-patch.png",
                width = 110,
                height = 80,
                shift = util.by_pixel(0, 5.5),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/robochest/robochest-base-patch-mask.png",
                width = 110,
                height = 80,
                shift = util.by_pixel(0, 5.5),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/logistics/robochest/robochest-base-patch-highlights.png",
                width = 110,
                height = 80,
                shift = util.by_pixel(0, 5.5),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
        },
    }

    entity.base_animation = util.empty_sprite()

    entity.door_animation_up = {
        filename = "__reskins-bobs__/graphics/entity/logistics/roboport/base/doors/roboport-" .. subtier .. "-door-up.png",
        priority = "medium",
        width = 97,
        height = 38,
        frame_count = 16,
        shift = util.by_pixel(-0.25, -29.5 + 4.5),
        scale = 0.5,
    }

    entity.door_animation_down = {
        filename = "__reskins-bobs__/graphics/entity/logistics/robochest/doors/robochest-" .. subtier .. "-door-down.png",
        priority = "medium",
        width = 97,
        height = 45,
        frame_count = 16,
        shift = util.by_pixel(-0.25, -9.75 + 3.5),
        scale = 0.5,
    }


    -- Label to skip to next iteration
    ::continue::
end
