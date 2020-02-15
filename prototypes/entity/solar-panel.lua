-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Set parameters
local type = "solar-panel"
local subtype = "solar-panel"
local size = 64
local mipmaps = 4
local particles = {"small"}
local mapping = false
local tier_map = {}

if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["solar-panel-small"]   = 1,
        ["solar-panel-small-2"] = 2,
        ["solar-panel-small-3"] = 3
    }
else
    tier_map =
    {
        ["solar-panel-small"]   = 2,
        ["solar-panel-small-2"] = 3,
        ["solar-panel-small-3"] = 4
    }
    mapping = true
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    reskin_functions.setup_common_attributes(name, type, subtype, tier, size, mipmaps, particles, mapping)

    -- Initialize table addresses
    entity = data.raw[type][name]
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]
    
    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-small-tinted"

    -- Create remnants
    remnant.animation[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    remnant.animation[2].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation[2].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    
    -- Reskin entities
    entity.picture = table.deepcopy(data.raw["solar-panel"]["solar-panel"]["picture"])
    entity.picture.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name..".png"
    entity.picture.layers[1].hr_version.height = 151
    entity.picture.layers[1].hr_version.width = 157
    entity.picture.layers[1].hr_version.shift = {0,0}
    -- entity.picture.hr_version
end