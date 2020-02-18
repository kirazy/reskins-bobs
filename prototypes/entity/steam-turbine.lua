-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end

-- Set parameters
local type = "generator"
local flags = 
{
    basename = "steam-turbine",
    baseentity = "steam-turbine",
    directory = reskins.bobs_structures.directory,
    folder = "steam-turbine",
    particles = {"medium","big"}
}

-- Steam turbines have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["steam-turbine"]   = 1,
        ["steam-turbine-2"] = 2,
        ["steam-turbine-3"] = 3
    }
else
    tier_map =
    {
        ["steam-turbine"]   = 3,
        ["steam-turbine-2"] = 4,
        ["steam-turbine-3"] = 5
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

    -- Initialize table addresses    
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]

    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Handle tier mapping settings, overwrite name with mapped name
    -- Caution: name beyond this point if remapping occurs no longer corresponds to the entity name
    if flags.remap_tiers == true then     
        name = flags.basename.."-"..tier
    end

    -- Create remnants
    remnant.animation[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/hr-"..name.."-remnants.png"

    -- Reskin entities
    entity.horizontal_animation.layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/"..name.."-H.png"
    entity.horizontal_animation.layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/hr-"..name.."-H.png"
    entity.vertical_animation.layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/"..name.."-V.png"
    entity.vertical_animation.layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/hr-"..name.."-V.png"

    -- Label to skip to next iteration
    ::continue::
end