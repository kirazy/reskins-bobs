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
    basename = "big-electric-pole",
    baseentity = "big-electric-pole",
    directory = reskins.bobs_structures.directory,
    folder = "big-electric-pole",
    particles = {"medium-long"}
}

-- Big electric poles have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["big-electric-pole"]   = 1,
        ["big-electric-pole-2"] = 2,
        ["big-electric-pole-3"] = 3,
        ["big-electric-pole-4"] = 4
    }
else
    tier_map =
    {
        ["big-electric-pole"]   = 2,
        ["big-electric-pole-2"] = 3,
        ["big-electric-pole-3"] = 4,
        ["big-electric-pole-4"] = 5
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
    remnant.animation = make_rotated_animation_variations_from_sheet (4,
    {
        layers =
        {
            {
                filename = flags.directory.."/graphics/entity/big-electric-pole/base/remnants/big-electric-pole-base-remnants.png",
                line_length = 1,
                width = 184,
                height = 94,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(44, 0),
                hr_version =
                {
                filename = flags.directory.."/graphics/entity/big-electric-pole/base/remnants/hr-big-electric-pole-base-remnants.png",
                line_length = 1,
                width = 366,
                height = 188,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(43, 0.5),
                scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/big-electric-pole/"..name.."/remnants/"..name.."-base-remnants-mask.png",
                line_length = 1,
                width = 184,
                height = 94,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(44, 0),
                hr_version =
                {
                filename = flags.directory.."/graphics/entity/big-electric-pole/"..name.."/remnants/hr-"..name.."-base-remnants-mask.png",
                line_length = 1,
                width = 366,
                height = 188,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(43, 0.5),
                scale = 0.5,
                }
            }
        },
    })

    remnant.animation_overlay = make_rotated_animation_variations_from_sheet (4,
    {
        layers =
        {
            {
                filename = flags.directory.."/graphics/entity/big-electric-pole/base/remnants/big-electric-pole-top-remnants.png",
                line_length = 1,
                width = 76,
                height = 126,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-1, -48),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/big-electric-pole/base/remnants/hr-big-electric-pole-top-remnants.png",
                    line_length = 1,
                    width = 148,
                    height = 252,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-1.5, -48),
                    scale = 0.5,
                }
            },
            {
                filename = flags.directory.."/graphics/entity/big-electric-pole/"..name.."/remnants/"..name.."-top-remnants-mask.png",
                line_length = 1,
                width = 76,
                height = 126,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(-1, -48),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/big-electric-pole/"..name.."/remnants/hr-"..name.."-top-remnants-mask.png",
                    line_length = 1,
                    width = 148,
                    height = 252,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-1.5, -48),
                    scale = 0.5,
                }
            },
        }
    })

    -- Create entities
    entity.pictures =
    {
        layers =
        {

            {
                filename = flags.directory.."/graphics/entity/big-electric-pole/base/big-electric-pole-base.png",
                priority = "extra-high",
                width = 76,
                height = 156,
                direction_count = 4,
                shift = util.by_pixel(1, -51),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/big-electric-pole/base/hr-big-electric-pole-base.png",
                    priority = "extra-high",
                    width = 148,
                    height = 312,
                    direction_count = 4,
                    shift = util.by_pixel(0, -51),
                    scale = 0.5
                }
            },
            {
                filename = flags.directory.."/graphics/entity/big-electric-pole/"..name.."/"..name.."-mask.png",
                priority = "extra-high",
                width = 76,
                height = 156,
                direction_count = 4,
                shift = util.by_pixel(1, -51),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/big-electric-pole/"..name.."/hr-"..name.."-mask.png",
                    priority = "extra-high",
                    width = 148,
                    height = 312,
                    direction_count = 4,
                    shift = util.by_pixel(0, -51),
                    scale = 0.5
                }
            },
            {
                filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-shadow.png",
                priority = "extra-high",
                width = 188,
                height = 48,
                direction_count = 4,
                shift = util.by_pixel(60, 0),
                draw_as_shadow = true,
                hr_version =
                {
                    filename = "__base__/graphics/entity/big-electric-pole/hr-big-electric-pole-shadow.png",
                    priority = "extra-high",
                    width = 374,
                    height = 94,
                    direction_count = 4,
                    shift = util.by_pixel(60, 0),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        }
    }
    
    -- Label to skip to next iteration
    ::continue::
end



