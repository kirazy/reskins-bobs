-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Add this mod to the reskins function host.
if not reskins.bobs then reskins.bobs = {} end
reskins.bobs.directory = "__reskins-bobs__"

-- ROBOT PARTICLE AND DEATH ANIMATIONS
local function adjust_animation(animation, shift)

    local animation = util.copy(animation)
    local layers = animation.layers or {animation}
  
    for k, layer in pairs (layers) do
  
        layer.frame_count = layer.direction_count
        layer.direction_count = 0
        layer.animation_speed = 1
        layer.shift = util.add_shift(layer.shift, shift)
  
        if layer.hr_version then
            layer.hr_version.frame_count = layer.hr_version.direction_count
            layer.hr_version.direction_count = 0
            layer.hr_version.animation_speed = 1
            layer.hr_version.shift = util.add_shift(layer.hr_version.shift, shift)
        end
  
    end
  
    return animation
end

local function reverse_animation(animation)
    local animation = util.copy(animation)
    local layers = animation.layers or {animation}
  
    for k, layer in pairs (layers) do
        layer.run_mode = "backward"
        if layer.hr_version then
            layer.hr_version.run_mode = "backward"
        end
    end
  
    return animation
end

function reskins.bobs.make_robot_particle(prototype)
    local shadow_shift = {-0.75, -0.40}
    local animation_shift = {0, 0}

    local particle_name = prototype.name.."-dying-particle"
  
    local animation = adjust_animation(prototype.in_motion, animation_shift)
    local shadow_animation = adjust_animation(prototype.shadow_in_motion, shadow_shift)
  
    local particle =
    {
        type = "optimized-particle",
        name = particle_name,
        pictures = {animation, reverse_animation(animation)},
        shadows = {shadow_animation, reverse_animation(shadow_animation)},
        movement_modifier = 0.95,
        life_time = 1000,
        regular_trigger_effect_frequency = 2,
        regular_trigger_effect =
        {
            {
                type = "create-trivial-smoke",
                smoke_name = "smoke-fast",
                starting_frame_deviation = 5,
                probability = 0.5
            },
            {
                type = "create-particle",
                particle_name = "spark-particle",
                tail_length = 10,
                tail_length_deviation = 5,
                tail_width = 5,
                probability = 0.2,
                initial_height = 0.2,
                initial_vertical_speed = 0.15,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.1,
                speed_from_center_deviation = 0.05,
                offset_deviation = {{-0.25, -0.25},{0.25, 0.25}}
            }
        },
        ended_on_ground_trigger_effect =
        {
            type = "create-entity",
            entity_name = prototype.name.."-remnants",
            offsets = {{0, 0}}
        }
    }

    data:extend{particle}

    prototype.dying_trigger_effect =
    {
        {
            type = "create-particle",
            particle_name = particle_name,
            initial_height = 1.8,
            initial_vertical_speed = 0,
            frame_speed = 1,
            frame_speed_deviation = 0.5,
            speed_from_center = 0,
            speed_from_center_deviation = 0.2,
            offset_deviation = {{-0.01, -0.01},{0.01, 0.01}},
            offsets = {{0, 0.5}}
        }
    }

    if prototype.type == "construction-robot" or prototype.type == "logistic-robot" then return end

    prototype.destroy_action =
    {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            source_effects =
            {
                type = "create-particle",
                particle_name = particle_name,
                initial_height = 1.8,
                initial_vertical_speed = 0,
                frame_speed = 0.5,
                frame_speed_deviation = 0.5,
                speed_from_center = 0,
                speed_from_center_deviation = 0.1,
                offset_deviation = {{-0.01, -0.01},{0.01, 0.01}},
                offsets = {{0, 0.5}}
            }
        }
    }  
end