-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-poles"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set parameters
local type = "electric-pole"
local flags = 
{
    basename = "medium-electric-pole",
    baseentity = "medium-electric-pole",
    directory = reskins.bobs_structures.directory,
    folder = "medium-electric-pole",
    particles = {"medium-long"}
}

-- Medium electric poles have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["medium-electric-pole"]   = 1,
        ["medium-electric-pole-2"] = 2,
        ["medium-electric-pole-3"] = 3,
        ["medium-electric-pole-4"] = 4
    }
else
    tier_map =
    {
        ["medium-electric-pole"]   = 2,
        ["medium-electric-pole-2"] = 3,
        ["medium-electric-pole-3"] = 4,
        ["medium-electric-pole-4"] = 5
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
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-long-metal-particle-medium-tinted"

    -- Handle tier mapping settings, overwrite name with mapped name
    -- Caution: name beyond this point if remapping occurs no longer corresponds to the entity name
    if flags.remap_tiers == true then     
        name = flags.basename.."-"..tier
    end

    -- Create remnants
    for i = 1, 3, 1 do
        remnant.animation[i].layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/"..name.."-base-remnants.png"
        remnant.animation[i].layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/hr-"..name.."-base-remnants.png"
        remnant.animation_overlay[i].layers[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/"..name.."-top-remnants.png"
        remnant.animation_overlay[i].layers[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/hr-"..name.."-top-remnants.png"
    end

    entity.pictures =
    {
        layers =
        {

            {
                filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/"..name..".png",
                priority = "extra-high",
                width = 40,
                height = 124,
                direction_count = 4,
                shift = util.by_pixel(4, -44),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/hr-"..name..".png",
                    priority = "extra-high",
                    width = 84,
                    height = 252,
                    direction_count = 4,
                    shift = util.by_pixel(3.5, -44),
                    scale = 0.5
                }
            },
            {
                filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole-shadow.png",
                priority = "extra-high",
                width = 140,
                height = 32,
                direction_count = 4,
                shift = util.by_pixel(56, -1),
                draw_as_shadow = true,
                hr_version =
                {
                    filename = "__base__/graphics/entity/medium-electric-pole/hr-medium-electric-pole-shadow.png",
                    priority = "extra-high",
                    width = 280,
                    height = 64,
                    direction_count = 4,
                    shift = util.by_pixel(56.5, -1),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        }
    }
    
    -- Label to skip to next iteration
    ::continue::
end



