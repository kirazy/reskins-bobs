-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Set parameters
local type = "boiler"
local subtype = "boiler"
local size = 64
local mipmaps = 4
local particles = {"big"}
local mapping = false
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
    reskin_functions.setup_common_attributes(name, type, subtype, tier, size, mipmaps, particles, mapping)

    -- Initialize table addresses
    entity = data.raw[type][name]
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]
    
    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[3].particle_name = name.."-metal-particle-big-tinted"

    -- Create remnants
    remnant.animation.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation.hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    
    -- Reskin entities
    entity.structure.north.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-N-idle.png"
    entity.structure.east.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-E-idle.png"
    entity.structure.south.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-S-idle.png"
    entity.structure.west.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-W-idle.png"
    entity.structure.north.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-N-idle.png"
    entity.structure.east.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-E-idle.png"
    entity.structure.south.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-S-idle.png"
    entity.structure.west.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-W-idle.png"
end