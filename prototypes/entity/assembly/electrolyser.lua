-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] then return end
if settings.startup["reskins-bobs-do-bobassembly"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "assembling-machine",
    root_name = "electrolyser",
    base_entity = "chemical-plant", -- Electrolyser will use Chemical Plant as a reference for explosion
    directory = reskins.bobs.directory,
    mod = "assembly",
    particles = {["big"] = 1, ["medium"] = 2},
    make_remnants = false,
    make_icons = false,
}

-- Electrolysers have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["electrolyser"]   = 1,
        ["electrolyser-2"] = 2,
        ["electrolyser-3"] = 3,
        ["electrolyser-4"] = 4
    }
else
    tier_map =
    {
        ["electrolyser"]   = 1,
        ["electrolyser-2"] = 2,
        ["electrolyser-3"] = 3,
        ["electrolyser-4"] = 4
    }
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..tier

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
  
    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.animation = 
    {
        north =
        {
            filename = inputs.directory.."/graphics/entity/assembly/electrolyser/electrolyser-"..tier.."-N.png",
            width = 108,
            height = 130,
            frame_count = 1,
            shift = {0, -0.28125},
            hr_version = 
            {
                filename = inputs.directory.."/graphics/entity/assembly/electrolyser/hr-electrolyser-"..tier.."-N.png",
                width = 320,
                height = 320,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.5
            }
        },
        west =
        {
            filename = inputs.directory.."/graphics/entity/assembly/electrolyser/electrolyser-"..tier.."-W.png",
            width = 112,
            height = 120,
            frame_count = 1,
            shift = {0, -0.21875},
            hr_version = 
            {
                filename = inputs.directory.."/graphics/entity/assembly/electrolyser/hr-electrolyser-"..tier.."-W.png",
                width = 320,
                height = 320,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.5
            }
        },
        south =
        {
            filename = inputs.directory.."/graphics/entity/assembly/electrolyser/electrolyser-"..tier.."-S.png",
            width = 108,
            height = 130,
            frame_count = 1,
            shift = {0, -0.28125},
            hr_version = 
            {
                filename = inputs.directory.."/graphics/entity/assembly/electrolyser/hr-electrolyser-"..tier.."-S.png",
                width = 320,
                height = 320,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.5
            }
        },
        east =
        {
            filename = inputs.directory.."/graphics/entity/assembly/electrolyser/electrolyser-"..tier.."-E.png",
            width = 112,
            height = 120,
            frame_count = 1,
            shift = {0, -0.21875},
            hr_version = 
            {
                filename = inputs.directory.."/graphics/entity/assembly/electrolyser/hr-electrolyser-"..tier.."-E.png",
                width = 320,
                height = 320,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.5
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end