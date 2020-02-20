-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set parameters
local type = "boiler"
local flags = 
{
    basename = "boiler",
    baseentity = "boiler",
    directory = reskins.bobs_structures.directory,
    folder = "boiler",
    particles = {"big"}
}

local tier_map = 
{
    ["boiler"]   = 1,
    ["boiler-2"] = 2,
    ["boiler-3"] = 3,
    ["boiler-4"] = 4,
    ["boiler-5"] = 5
}

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
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]
    
    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[3].particle_name = name.."-metal-particle-big-tinted"

    -- Create remnants
    remnant.animation.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation.hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    
    -- Reskin entities
    entity.structure.north.layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/"..name.."-N-idle.png"
    entity.structure.east.layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/"..name.."-E-idle.png"
    entity.structure.south.layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/"..name.."-S-idle.png"
    entity.structure.west.layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/"..name.."-W-idle.png"
    entity.structure.north.layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/hr-"..name.."-N-idle.png"
    entity.structure.east.layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/hr-"..name.."-E-idle.png"
    entity.structure.south.layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/hr-"..name.."-S-idle.png"
    entity.structure.west.layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/hr-"..name.."-W-idle.png"

    -- Label to skip to next iteration
    ::continue::
end