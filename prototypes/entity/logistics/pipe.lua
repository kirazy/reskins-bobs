-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end

-- Restore vanilla pipes to their proper glory
data.raw["pipe"]["pipe"].pictures = pipepictures()
data.raw["pipe-to-ground"]["pipe-to-ground"].pictures =
{
    up =
    {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "high",
        width = 64,
        height = 64,
        hr_version =
        {
            filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-up.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            scale = 0.5
        }
    },
    down =
    {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64,
        hr_version =
        {
            filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-down.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            scale = 0.5
        }
    },
    left =
    {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64,
        hr_version =
        {
            filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-left.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            scale = 0.5
        }
    },
    right =
    {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64,
        hr_version =
        {
            filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-right.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            scale = 0.5
        }
    }
}

-- Set input parameters
local inputs = 
{
    directory = reskins.bobs.directory,
    mod = "logistics",
}

local material_map = 
{
    ["copper"] = {1, "d45539"},
    ["iron"] = {1},
    ["stone"] = {1, "cfcfcf"},
    ["bronze"] = {2, "b09954"},
    ["steel"] = {2, "877c76"},
    ["plastic"] = {3, "0078ff"},
    ["brass"] = {3, "f9c854"},
    ["titanium"] = {4, "adadb2"},
    ["ceramic"] = {4, "8f7967"},
    ["tungsten"] = {4, "3b3b3b"},
    ["nitinol"] = {5, "706f6b"},
    ["copper-tungsten"] = {5, "99593d"},
}

-- Reskin pipes, create and assign extra details
for material, map in pairs(material_map) do
    -- Check if we're trying to work with iron, skip for now
    if material == "iron" then
        goto do_icons
    end

    -- Parse map
    tier = map[1]
    inputs.material = material
    inputs.tint = reskins.lib.tint_hex_to_rgb(map[2])

    -- Fetch entities
    pipe_entity = data.raw["pipe"][material.."-pipe"]
    underground_pipe_entity =  data.raw["pipe-to-ground"][material.."-pipe-to-ground"]

    -- Check if entity exists, if not, skip this iteration; assume if we have one we have both
    if not pipe_entity then
        goto continue
    end

    -- Create explosions
    reskins.lib.create_explosion(material.."-pipe", {type = "pipe", base_entity = "pipe"})
    reskins.lib.create_explosion(material.."-pipe-to-ground", {type = "pipe-to-ground", base_entity = "pipe-to-ground"})

    -- Create particles
    reskins.lib.create_particle(material.."-pipe", "pipe", reskins.lib.particle_index["medium"], 1, inputs.tint)
    reskins.lib.create_particle(material.."-pipe", "pipe", reskins.lib.particle_index["small"], 2, inputs.tint)
    reskins.lib.create_particle(material.."-pipe-to-ground", "pipe-to-ground", reskins.lib.particle_index["medium"], 1, inputs.tint)
    reskins.lib.create_particle(material.."-pipe-to-ground", "pipe-to-ground", reskins.lib.particle_index["small"], 2, inputs.tint)

    -- Create remnants
    reskins.lib.create_remnant(material.."-pipe", {type = "pipe", base_entity = "pipe"})
    reskins.lib.create_remnant(material.."-pipe-to-ground", {type = "pipe-to-ground", base_entity = "pipe-to-ground"})

    -- Fetch remnant
    pipe_remnant = data.raw["corpse"][material.."-pipe-remnants"]
    underground_pipe_remnant = data.raw["corpse"][material.."-pipe-to-ground-remnants"]

    -- Reskin remnants
    pipe_remnant.animation = make_rotated_animation_variations_from_sheet(2,
    {
        filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/remnants/pipe-remnants.png",
        width = 61,
        height = 60,
        line_length = 1,
        frame_count = 1,
        direction_count = 2,
        shift = util.by_pixel(1.5, 2.5),
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe/"..inputs.material.."/remnants/hr-pipe-remnants.png",
            width = 122,
            height = 120,
            line_length = 1,
            frame_count = 1,
            direction_count = 2,
            shift = util.by_pixel(1.5, 2.5),
            scale = 0.5,
        },
    })

    underground_pipe_remnant.animation = {
        filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/remnants/pipe-to-ground-remnants.png",
        width = 45,
        height = 40,
        line_length = 1,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0.5, -3),
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/pipe-to-ground/"..inputs.material.."/remnants/hr-pipe-to-ground-remnants.png",
            width = 90,
            height = 80,
            line_length = 1,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0.5, -3),
            scale = 0.5,
        },
    }

    -- Reskin entities
    pipe_entity.pictures = reskins.bobs.pipe_pictures(inputs)
    underground_pipe_entity.pictures = reskins.bobs.underground_pipe_pictures(inputs)

    -- Label to make icons
    ::do_icons::

    -- Label to skip to next iteration
    ::continue::    
end