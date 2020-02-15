-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Set parameters
local type = "generator"
local subtype = "steam-engine"
local size = 64
local mipmaps = 4
local particles = {"medium","big"}
local mapping = false
local tier_map =
{
    ["steam-engine"]   = 1,
    ["steam-engine-2"] = 2,
    ["steam-engine-3"] = 3,
    ["steam-engine-4"] = 4,
    ["steam-engine-5"] = 5
}

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    reskin_functions.setup_common_attributes(name, type, subtype, tier, size, mipmaps, particles, mapping)

    -- Initialize table addresses
    entity = data.raw[type][name]
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]

    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Create remnants
    remnant.animation[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    
    -- Reskin entities
    entity.horizontal_animation.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-H.png"
    entity.horizontal_animation.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-H.png"
    entity.vertical_animation.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-V.png"
    entity.vertical_animation.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-V.png"
end