-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobwarfare"] then return end
if settings.startup["reskins-bobs-do-bobwarfare"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "beam",
    directory = reskins.bobs.directory,
}

local beam_map =
{
    ["bob-laser-beam-glass"]         = "glass",
    ["bob-laser-beam-sapphire"]      = "sapphire",
    ["bob-laser-beam-emerald"]       = "emerald",
    ["bob-laser-beam-amethyst"]      = "amethyst",
    ["bob-laser-beam-topaz"]         = "topaz",
    ["bob-laser-beam-diamond"]       = "diamond",
    ["bob-laser-beam-glass-ammo"]    = "glass",
    ["bob-laser-beam-ruby-ammo"]     = "ruby",
    ["bob-laser-beam-sapphire-ammo"] = "sapphire",
    ["bob-laser-beam-emerald-ammo"]  = "emerald",
    ["bob-laser-beam-amethyst-ammo"] = "amethyst",
    ["bob-laser-beam-topaz-ammo"]    = "topaz",
    ["bob-laser-beam-diamond-ammo"]  = "diamond"
}

local light_tint_map =
{
    ["glass"]    = {r =  79, g =  79, b =  79},
    ["ruby"]     = {r = 128, g =   2, b =  35},
    ["emerald"]  = {r =  13, g = 128, b =  42},
    ["sapphire"] = {r =   2, g =  59, b = 128},
    ["topaz"]    = {r = 128, g =  89, b =  13},
    ["amethyst"] = {r =  30, g =  13, b = 128},
    ["diamond"]  = {r = 249, g = 249, b = 249}
}

local laser_beam_blend_mode = "additive"

for name, lens in pairs(beam_map) do
    -- Fetch beam
    beam = data.raw[inputs.type][name]

    -- Check if beam exists, if not, skip this iteration
    if not beam then
        goto continue
    end

    -- Reskin beams
    beam.head =
    {
        filename = inputs.directory.."/graphics/entity/structures/warfare/beam/"..lens.."/hr-"..lens.."-laser-body.png",
        flags = beam_non_light_flags,
        line_length = 8,
        width = 64,
        height = 12,
        frame_count = 8,
        scale = 0.5,
        animation_speed = 0.5,
        blend_mode = laser_beam_blend_mode
    }

    beam.tail =
    {
        filename = inputs.directory.."/graphics/entity/structures/warfare/beam/"..lens.."/hr-"..lens.."-laser-end.png",
        flags = beam_non_light_flags,
        width = 110,
        height = 62,
        frame_count = 8,
        shift = util.by_pixel(11.5, 1),
        scale = 0.5,
        animation_speed = 0.5,
        blend_mode = laser_beam_blend_mode
    }

    beam.body =
    {
        {
        filename = inputs.directory.."/graphics/entity/structures/warfare/beam/"..lens.."/hr-"..lens.."-laser-body.png",
        flags = beam_non_light_flags,
        line_length = 8,
        width = 64,
        height = 12,
        frame_count = 8,
        scale = 0.5,
        animation_speed = 0.5,
        blend_mode = laser_beam_blend_mode
        }
    }

    beam.light_animations =
    {
        head =
        {
            filename = inputs.directory.."/graphics/entity/structures/warfare/beam/base/hr-laser-body-light.png",
            line_length = 8,
            width = 64,
            height = 12,
            frame_count = 8,
            scale = 0.5,
            animation_speed = 0.5,
        },
        tail =
        {
            filename = inputs.directory.."/graphics/entity/structures/warfare/beam/base/hr-laser-end-light.png",
            width = 110,
            height = 62,
            frame_count = 8,
            shift = util.by_pixel(11.5, 1),
            scale = 0.5,
            animation_speed = 0.5,
        },
        body =
        {
            {
                filename = inputs.directory.."/graphics/entity/structures/warfare/beam/base/hr-laser-body-light.png",
                line_length = 8,
                width = 64,
                height = 12,
                frame_count = 8,
                scale = 0.5,
                animation_speed = 0.5,
            }
        }
    }

    beam.ground_light_animations =
    {
        head =
        {
            filename = inputs.directory.."/graphics/entity/structures/warfare/beam/base/laser-ground-light-head.png",
            line_length = 1,
            width = 256,
            height = 256,
            repeat_count = 8,
            scale = 0.5,
            shift = util.by_pixel(-32, 0),
            animation_speed = 0.5,
            tint = light_tint_map[lens]
        },
        tail =
        {
            filename = inputs.directory.."/graphics/entity/structures/warfare/beam/base/laser-ground-light-tail.png",
            line_length = 1,
            width = 256,
            height = 256,
            repeat_count = 8,
            scale = 0.5,
            shift = util.by_pixel(32, 0),
            animation_speed = 0.5,
            tint = light_tint_map[lens]
        },
        body =
        {
            filename = inputs.directory.."/graphics/entity/structures/warfare/beam/base/laser-ground-light-body.png",
            line_length = 1,
            width = 64,
            height = 256,
            repeat_count = 8,
            scale = 0.5,
            animation_speed = 0.5,
            tint = light_tint_map[lens]
        }
    }

    -- Label to skip to next iteration
    ::continue::
end