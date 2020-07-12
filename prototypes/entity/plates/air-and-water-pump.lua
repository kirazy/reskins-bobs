-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobplates"] then return end
if reskins.lib.setting("reskins-bobs-do-bobplates") == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    base_entity = "chemical-plant",
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "plates",
    particles = {["big"] = 1, ["medium"] = 2},
    make_remnants = false,
    make_icons = false,
}

local tier_map = {
    ["water-pump"] = {1, 2, "water"},
    ["water-pump-2"] = {2, 3, "water"},
    ["water-pump-3"] = {3, 4, "water"},
    ["water-pump-4"] = {4, 5, "water"},
    ["air-pump"] = {1, 2, "air"},
    ["air-pump-2"] = {2, 3, "air"},
    ["air-pump-3"] = {3, 4, "air"},
    ["air-pump-4"] = {4, 5, "air"},
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Parse map
    local tier = map[1]
    if reskins.lib.setting("reskins-lib-tier-mapping") == "ingredients-map" then
        tier = map[2]
    end
    local pump_type = map[3]

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
  
    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.corpse = "medium-remnants"
    entity.match_animation_speed_to_activity = false
    entity.animation = reskins.lib.make_4way_animation_from_spritesheet({
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/plates/"..pump_type.."-pump/"..pump_type.."-pump-base.png",
                width = 64,
                height = 88,
                frame_count = 4,
                line_length = 4,
                frame_sequence = {1, 2, 3, 4, 3, 2, 1},
                animation_speed = 0.5,
                shift = util.by_pixel(0, -12),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/plates/"..pump_type.."-pump/hr-"..pump_type.."-pump-base.png",
                    width = 128,
                    height = 176,
                    frame_count = 4,
                    line_length = 4,
                    frame_sequence = {1, 2, 3, 4, 3, 2, 1},
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -12),
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/plates/"..pump_type.."-pump/"..pump_type.."-pump-shadow.png",
                width = 86,
                height = 67,
                frame_count = 4,
                line_length = 4,
                frame_sequence = {1, 2, 3, 4, 3, 2, 1},
                animation_speed = 0.5,
                shift = util.by_pixel(11, 1.5),
                draw_as_shadow = true,
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/plates/"..pump_type.."-pump/hr-"..pump_type.."-pump-shadow.png",
                    width = 172,
                    height = 134,
                    frame_count = 4,
                    line_length = 4,
                    frame_sequence = {1, 2, 3, 4, 3, 2, 1},
                    animation_speed = 0.5,
                    shift = util.by_pixel(11, 1.5),
                    draw_as_shadow = true,
                    scale = 0.5,
                }
            }
        }
    })

    local recipe_mask = reskins.lib.make_4way_animation_from_spritesheet({
        filename = inputs.directory.."/graphics/entity/plates/"..pump_type.."-pump/"..pump_type.."-pump-recipe-mask.png",
        width = 64,
        height = 88,
        shift = util.by_pixel(0, -12),
        hr_version = {
            filename = inputs.directory.."/graphics/entity/plates/"..pump_type.."-pump/hr-"..pump_type.."-pump-recipe-mask.png",
            width = 128,
            height = 176,
            shift = util.by_pixel(0, -12),
            scale = 0.5,
        }
    })

    entity.working_visualisations = {
        -- Recipe Mask
        {
            apply_recipe_tint = "primary",
            north_animation = recipe_mask.north,
            east_animation = recipe_mask.east,
            south_animation = recipe_mask.south,
            west_animation = recipe_mask.west,
        }
    }

    -- Label to skip to next iteration
    ::continue::
end