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
        height = 64, --, shift = {0.10, -0.04}
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
        height = 64, --, shift = {0.05, 0}
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
        height = 64, --, shift = {-0.12, 0.1}
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
        height = 64, --, shift = {0.1, 0.1}
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
local inputs = {
    directory = reskins.bobs.directory,
    mod = "logistics",
    make_remnants   = false,
    make_explosions = false,
    make_icons = false,
}

local pipe_map =
{
["copper-pipe"]          = {1, "copper"},
-- ["pipe"]                 = {1, "iron"},
["stone-pipe"]           = {1, "stone"},
["bronze-pipe"]          = {2, "bronze"},
["steel-pipe"]           = {2, "steel"},
["plastic-pipe"]         = {3, "plastic"},
["brass-pipe"]           = {3, "brass"},
["titanium-pipe"]        = {4, "titanium"},
["ceramic-pipe"]         = {4, "ceramic"},
["tungsten-pipe"]        = {4, "tungsten"},
["nitinol-pipe"]         = {5, "nitinol"},
["copper-tungsten-pipe"] = {5, "copper-tungsten"},
}

local underground_pipe_map =
{
["copper-pipe-to-ground"]          = {1, "copper"},
-- ["pipe-to-ground"]                 = {1, "iron"},
["stone-pipe-to-ground"]           = {1, "stone"},
["bronze-pipe-to-ground"]          = {2, "bronze"},
["steel-pipe-to-ground"]           = {2, "steel"},
["plastic-pipe-to-ground"]         = {3, "plastic"},
["brass-pipe-to-ground"]           = {3, "brass"},
["titanium-pipe-to-ground"]        = {4, "titanium"},
["ceramic-pipe-to-ground"]         = {4, "ceramic"},
["tungsten-pipe-to-ground"]        = {4, "tungsten"},
["nitinol-pipe-to-ground"]         = {5, "nitinol"},
["copper-tungsten-pipe-to-ground"] = {5, "copper-tungsten"},
}

-- Reskin pipes, create and assign extra details
for name, map in pairs(pipe_map) do
    -- Set core inputs
    inputs.type = "pipe"
    inputs.root_name = "pipe"
    inputs.base_entity = "pipe"
    -- inputs.particles = {["blah"] = 1}

    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    inputs.material = map[2]

    -- Map entity to name used internally
    -- inputs.internal_name = inputs.root_name.."-"..tier
    
    -- Determine what tint we're using
    -- inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- reskins.lib.setup_standard_entity(name, tier, inputs)

    -- entity.pictures = reskins.bobs.pipe_pictures(inputs)
    entity.pictures = reskins.bobs.pipe_pictures(inputs)

    -- Label to skip to next iteration
    ::continue::    
end

-- Reskin pipe-to-grounds, create and assign extra details
for name, map in pairs(underground_pipe_map) do
    -- Set core inputs
    inputs.type = "pipe-to-ground"
    inputs.root_name = "pipe-to-ground"
    inputs.base_entity = "pipe-to-ground"
    -- inputs.particles = {["blah"] = 1}

    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    inputs.material = map[2]

    -- Map entity to name used internally
    -- inputs.internal_name = inputs.root_name.."-"..tier
    
    -- Determine what tint we're using
    -- inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- reskins.lib.setup_standard_entity(name, tier, inputs)

    -- entity.pictures = reskins.bobs.pipe_pictures(inputs)
    entity.pictures = reskins.bobs.underground_pipe_pictures(inputs)

    -- Label to skip to next iteration
    ::continue::    
end