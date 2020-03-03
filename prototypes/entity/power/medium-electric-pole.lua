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
    mod_folder = "power",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "medium-electric-pole",
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

    -- Tint explosions
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-long-metal-particle-medium-tinted"

    -- Handle tier mapping settings, overwrite name with mapped name
    -- Caution: name beyond this point if remapping occurs no longer corresponds to the entity name
    if flags.remap_tiers == true then     
        name = flags.basename.."-"..tier
    end

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet(3,
    {
        layers =
        {
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/remnants/medium-electric-pole-base-remnants.png",
                line_length = 1,
                width = 142,
                height = 70,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(35, -5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/remnants/hr-medium-electric-pole-base-remnants.png",
                    line_length = 1,
                    width = 284,
                    height = 140,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(35, -5),
                    scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/mask/"..name.."/remnants/"..name.."-base-remnants.png",
                line_length = 1,
                width = 142,
                height = 70,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(35, -5),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/mask/"..name.."/remnants/hr-"..name.."-base-remnants.png",
                    line_length = 1,
                    width = 284,
                    height = 140,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(35, -5),
                    scale = 0.5,
                }
            }
        }
    })

    remnant.animation_overlay = make_rotated_animation_variations_from_sheet(3,
    {
        layers =
        {
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/remnants/medium-electric-pole-top-remnants.png",
                line_length = 1,
                width = 50,
                height = 92,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(0 , -39),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/remnants/hr-medium-electric-pole-top-remnants.png",
                    line_length = 1,
                    width = 100,
                    height = 184,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(0, -38.5),
                    scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/mask/"..name.."/remnants/"..name.."-top-remnants.png",
                line_length = 1,
                width = 50,
                height = 92,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(0 , -39),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/mask/"..name.."/remnants/hr-"..name.."-top-remnants.png",
                    line_length = 1,
                    width = 100,
                    height = 184,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(0, -38.5),
                    scale = 0.5,
                }
            }
        }
    })

    -- Reskin entities
    entity.pictures =
    {
        layers =
        {

            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/medium-electric-pole.png",
                priority = "extra-high",
                width = 40,
                height = 124,
                direction_count = 4,
                shift = util.by_pixel(4, -44),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/hr-medium-electric-pole.png",
                    priority = "extra-high",
                    width = 84,
                    height = 252,
                    direction_count = 4,
                    shift = util.by_pixel(3.5, -44),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/mask/"..name.."/"..name..".png",
                priority = "extra-high",
                width = 40,
                height = 124,
                direction_count = 4,
                shift = util.by_pixel(4, -44),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/mask/"..name.."/hr-"..name..".png",
                    priority = "extra-high",
                    width = 84,
                    height = 252,
                    direction_count = 4,
                    shift = util.by_pixel(3.5, -44),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/medium-electric-pole-shadow.png",
                priority = "extra-high",
                width = 140,
                height = 32,
                direction_count = 4,
                shift = util.by_pixel(56, -1),
                draw_as_shadow = true,
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/"..flags.mod_folder.."/medium-electric-pole/base/hr-medium-electric-pole-shadow.png",
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



