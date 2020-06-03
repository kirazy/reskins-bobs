-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-fluidgenerator"].value == false then return end
if settings.startup["reskins-bobs-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = {
    type = "generator",
    icon_name = "fluid-generator",
    base_entity = "steam-turbine",
    directory = reskins.bobs.directory,
    group = "power",
    particles = {["medium"] = 2,["big"] = 1},
    make_remnants = false,
    make_icons = false,
}

local function setup_fluid_generator(tint)
    return 
    {
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/power/fluid-generator/fluid-generator-base.png",
                width = 101,
                height = 130,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(2.5, -11),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/power/fluid-generator/hr-fluid-generator-base.png",
                    width = 202,
                    height = 260,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(2.5, -11),
                    scale = 0.5
                }
            },
        }
    }
end

-- Fluid generators have two sets of tiers; determine which we are using
local fluid_generators
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    fluid_generators = {
        ["fluid-generator"] = 1,
        ["fluid-generator-2"] = 2,
        ["fluid-generator-3"] = 3,
    }
else
    fluid_generators = {
        ["fluid-generator"] = 1,
        ["fluid-generator-2"] = 2,
        ["fluid-generator-3"] = 3,
    }
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(fluid_generators) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end
    
    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
    
    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.horizontal_animation = setup_fluid_generator(inputs.tint)
    entity.vertical_animation = setup_fluid_generator(inputs.tint)

    -- Clear out working_visualisations
    entity.working_visualisations = nil

    -- Handle smoke
    entity.smoke = {
        {
            name = "smoke",
            north_position = util.by_pixel(-30, -44),
            east_position = util.by_pixel(-30, -44),
            frequency = entity.smoke[1].frequency,
            starting_vertical_speed = 0.0,
            starting_frame_deviation = 60
        }
    }

    -- Label to skip to next iteration
    ::continue::
end

-- hydrazine-generator -- This is a revamp product and contingent on a few things