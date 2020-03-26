-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] then return end
if settings.startup["reskins-bobs-do-bobassembly"].value == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    root_name = "assembling-machine",
    base_entity = "assembling-machine-1",
    directory = reskins.bobs.directory,
    mod = "assembly",
    particles = {["big"] = 1, ["medium"] = 2},
    make_remnants   = false
}

local tier_map =
{
    ["assembling-machine-1"] = {0, 0, false},
    ["assembling-machine-2"] = {1, 1, true},
    ["assembling-machine-3"] = {2, 2, true},
    ["assembling-machine-4"] = {3, 3, true},
    ["assembling-machine-5"] = {4, 4, true},
    ["assembling-machine-6"] = {5, 4, true},
    ["burner-assembling-machine"] = {0, 0, false, "262626"},
    ["steam-assembling-machine"] = {0, 0, true, "d9d9d9"},
}

-- Append electronics assembling machines
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map["electronics-machine-1"] = {1, 1, false}
    tier_map["electronics-machine-2"] = {2, 2, false}
    tier_map["electronics-machine-3"] = {3, 3, false}
else
    tier_map["electronics-machine-1"] = {1, 1, false}
    tier_map["electronics-machine-2"] = {3, 3, false}
    tier_map["electronics-machine-3"] = {5, 4, false}
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Extract tier, shadow, has_fluids from map
    tier = map[1]
    shadow = map[2]  
    has_fluids = map[3]  
    
    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..tier
    
    -- Determine what tint we're using
    if map[4] then
        inputs.tint = reskins.lib.tint_hex_to_rgb(map[4]) 
    else
        inputs.tint = reskins.lib.tint_index["tier-"..tier]
    end

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.animation =
    {
        layers =
        {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/assembling-machine-base.png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/hr-assembling-machine-base.png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    shift = util.by_pixel(0, -0.75),
                    scale = 0.5
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/assembling-machine-base-mask.png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.5),
                tint = inputs.tint,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/hr-assembling-machine-base-mask.png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    shift = util.by_pixel(0, -0.75),
                    tint = inputs.tint,
                    scale = 0.5
                }
            },
            -- Highlight
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/assembling-machine-base-highlights.png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.5),
                blend_mode = "additive",
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/hr-assembling-machine-base-highlights.png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    shift = util.by_pixel(0, -0.75),
                    blend_mode = "additive",
                    scale = 0.5
                }
            },
            -- Animation
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/animations/assembling-machine-animation-"..tier..".png",
                priority="high",
                width = 108,
                height = 119,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, -0.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/animations/hr-assembling-machine-animation-"..tier..".png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, -0.75),
                    scale = 0.5
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/shadows/assembling-machine-"..shadow.."-shadow.png",
                priority="high",
                width = 132,
                height = 83,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(27, 5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/shadows/hr-assembling-machine-"..shadow.."-shadow.png",
                    priority="high",
                    width = 264,
                    height = 165,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(27, 5),
                    scale = 0.5
                }
            }                
        }
    }

    if string.find(name, "electronics") then
        entity.animation.layers[6] =
        {
            filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/electronics-base.png",
            priority="high",
            width = 108,
            height = 119,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            shift = util.by_pixel(0, -0.5),
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/hr-electronics-base.png",
                priority="high",
                width = 214,
                height = 237,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.75),
                scale = 0.5
            }
        }
        entity.animation.layers[7] =
        {
            filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/electronics-mask.png",
            priority="high",
            width = 108,
            height = 119,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            shift = util.by_pixel(0, -0.5),
            tint = inputs.tint,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/hr-electronics-mask.png",
                priority="high",
                width = 214,
                height = 237,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.75),
                tint = inputs.tint,
                scale = 0.5
            }
        }

        entity.animation.layers[8] = 
        {
            filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/electronics-highlights.png",
            priority="high",
            width = 108,
            height = 119,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            shift = util.by_pixel(0, -0.5),
            blend_mode = "additive",
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/hr-electronics-highlights.png",
                priority="high",
                width = 214,
                height = 237,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                shift = util.by_pixel(0, -0.75),
                blend_mode = "additive",
                scale = 0.5
            }
        }

        entity.animation.layers[9] = 
        {
            filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/electronics-shadow.png",
            priority="high",
            width = 132,
            height = 83,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(27, 5),
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/electronics/hr-electronics-shadow.png",
                priority="high",
                width = 264,
                height = 165,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                draw_as_shadow = true,
                shift = util.by_pixel(27, 5),
                scale = 0.5
            }
        } 
    end
    
    -- Rescale for electronics and burner assembling machines
    if string.find(name, "electronics") or name == "burner-assembling-machine" then
        reskins.lib.rescale_entity(entity.animation, 2/3)
    end
        


    -- Handle pipes
    if has_fluids then
        entity.fluid_boxes =
        {
            {
                production_type = "input",
                pipe_picture = reskins.bobs.assembly_pipe_pictures(inputs.tint),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {0, -2} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = reskins.bobs.assembly_pipe_pictures(inputs.tint),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {0, 2} }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        }
    end

    if name == "steam-assembling-machine" then
        entity.energy_source.fluid_box =
        {
            base_area = 1,
            height = 2,
            base_level = -1,
            pipe_connections =
            {
                {type = "input-output", position = { 2, 0}},
                {type = "input-output", position = {-2, 0}}
            },
            pipe_covers = pipecoverspictures(),
            pipe_picture = reskins.bobs.assembly_pipe_pictures(inputs.tint),
            production_type = "input-output",
            filter = "steam"
        }
    end

    -- Label to skip to next iteration
    ::continue::    
end