-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] then return end
if settings.startup["reskin-series-do-bobassembly"].value == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    root_name = "assembling-machine",
    base_entity = "assembling-machine-1",
    directory = reskins.bobs_structures.directory,
    group = "assembly",
    particles = {["big"] = 1, ["medium"] = 2},
    make_remnants   = false
}

local tier_map =
{
    ["assembling-machine-1"] = {0, false},
    ["assembling-machine-2"] = {1, true},
    ["assembling-machine-3"] = {2, true},
    ["assembling-machine-4"] = {3, true},
    ["assembling-machine-5"] = {4, true},
    ["assembling-machine-6"] = {5, true}
}

-- Additional miscellaneous assembling machines
-- electronics-machine-1
-- electronics-machine-2
-- electronics-machine-3
-- burner-assembling-machine
-- steam-assembling-machine

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Extract tier, has_fluids from tier result
    tier = map[1]
    has_fluids = map[2]    

    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..tier
    
    reskins.lib.setup_common_attributes(name, tier, inputs)

    -- Create names for images/folder
    -- if string.find(name, "electronics", 1, true) then
    --     inputs.internal_name = "electronics"..inputs.root_name.."-"..tier
    --     size_is_small = true
    -- elseif name == "burner-assembling-machine" then 
    --     inputs.internal_name = name
    --     size_is_small = true
    -- else
        -- inputs.internal_name = name
    --     size_is_small = false
    -- end

    -- Reskin entities
    -- if size_is_small == true then
    --     -- Small assembling machines

    -- fluid_boxes =
    -- {
    --     {
    --         production_type = "input",
    --         pipe_picture = assembler3pipepictures(),
    --         pipe_covers = pipecoverspictures(),
    --         base_area = 10,
    --         base_level = -1,
    --         pipe_connections = {{ type="input", position = {0, -2} }},
    --         secondary_draw_orders = { north = -1 }
    --     },
    --     {
    --         production_type = "output",
    --         pipe_picture = assembler3pipepictures(),
    --         pipe_covers = pipecoverspictures(),
    --         base_area = 10,
    --         base_level = 1,
    --         pipe_connections = {{ type="output", position = {0, 2} }},
    --         secondary_draw_orders = { north = -1 }
    --     },
    --     off_when_no_fluid_recipe = true
    -- },

    -- else
        entity.animation =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
                    priority="high",
                    width = 108,
                    height = 114,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, 2),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/"..inputs.internal_name.."/hr-"..inputs.internal_name..".png",
                        priority="high",
                        width = 214,
                        height = 237,
                        frame_count = 32,
                        line_length = 8,
                        shift = util.by_pixel(0, 2),
                        scale = 0.5
                    }
                },
                {
                    filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/assembling-machine-shadow.png",
                    priority="high",
                    width = 95,
                    height = 83,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    draw_as_shadow = true,
                    shift = util.by_pixel(8.5, 5.5),
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/assembly/assembling-machine/base/hr-assembling-machine-shadow.png",
                        priority="high",
                        width = 190,
                        height = 165,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 32,
                        draw_as_shadow = true,
                        shift = util.by_pixel(8.5, 5),
                        scale = 0.5
                    }
                }
            }
        }
    -- end

    -- Label to skip to next iteration
    ::continue::    
end





