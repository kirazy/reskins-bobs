-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set parameters
local type = "heat-pipe"
local flags = 
{
    basename = "heat-pipe",
    baseentity = "heat-pipe",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "heat-pipe",
    particles = {"big"},
    make_icons = false,
    make_explosions = false,
    make_remnants = false,
}

-- Heat pipes have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
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
    flags.remap_tiers = true
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    reskins.lib.setup_common_attributes(name, type, tier, flags)

    -- Initialize paths
    -- remnant = data.raw["corpse"][name.."-remnants"]
    -- explosion = data.raw["explosion"][name.."-explosion"]
    
    -- Tint explosions
    -- explosion.created_effect.action_delivery.target_effects[3].particle_name = name.."-metal-particle-big-tinted"

    -- Reskin remnants
    -- remnant.animation.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/"..name.."-remnants.png"
    -- remnant.animation.hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    
    -- Reskin entities
    if name ~= "heat-pipe" then
        entity.connection_sprites = make_heat_pipe_pictures(flags.directory.."/graphics/entity/heat-pipe/"..name.."/", name,
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