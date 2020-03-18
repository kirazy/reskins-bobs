-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["reskins-bobs-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "heat-pipe",
    root_name = "heat-pipe",
    base_entity = "heat-pipe",
    directory = reskins.bobs.directory,
    mod = "power",
    make_icons = false,
    make_explosions = false,
    make_remnants = false,
}

-- Heat pipes have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["heat-pipe"]   = 1,
        ["heat-pipe-2"] = 2,
        ["heat-pipe-3"] = 3
    }
else
    tier_map =
    {
        ["heat-pipe"]   = 3,
        ["heat-pipe-2"] = 4,
        ["heat-pipe-3"] = 5
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

    -- Map entity to name used internally; for heat-pipe this needs to be specified for use with icon generation
    inputs.internal_name = name

    reskins.lib.setup_common_attributes(name, tier, inputs)

    -- Fetch remnant
    -- remnant = data.raw["corpse"][name.."-remnants"]
    
    -- Explosion particles needs to be handled special on account of non-tier coloring.
    -- For reference, heat-pipe has 15 small, 9 medium particles.

    -- Reskin remnants
    -- remnant.animation.filename = inputs.directory.."/graphics/entity/power/"..inputs.folder.."/"..inputs.internal_name.."/remnants/"..inputs.internal_name.."-remnants.png"
    -- remnant.animation.hr_version.filename = inputs.directory.."/graphics/entity/power/"..inputs.folder.."/"..inputs.internal_name.."/remnants/hr-"..inputs.internal_name.."-remnants.png"
    
    -- Reskin entities
    if name ~= "heat-pipe" then
        entity.connection_sprites = make_heat_pipe_pictures(inputs.directory.."/graphics/entity/power/heat-pipe/"..inputs.internal_name.."/", inputs.internal_name,
        {
            single = { name = "straight-vertical-single", ommit_number = true },
            straight_vertical = { variations = 6 },
            straight_horizontal = { variations = 6 },
            corner_right_up = { name = "corner-up-right", variations = 6 },
            corner_left_up = { name = "corner-up-left", variations = 6 },
            corner_right_down = { name = "corner-down-right", variations = 6 },
            corner_left_down = { name = "corner-down-left", variations = 6 },
            t_up = {},
            t_down = {},
            t_right = {},
            t_left = {},
            cross = { name = "t" },
            ending_up = {},
            ending_down = {},
            ending_right = {},
            ending_left = {}
        })
    end

    -- Label to skip to next iteration
    ::continue::
end