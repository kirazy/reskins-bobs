-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set parameters
local type = "generator"
local flags = 
{
    basename = "steam-engine",
    baseentity = "steam-engine",
    directory = reskins.bobs_structures.directory,
    folder = "steam-engine",
    particles = {"medium","big"}
}

local tier_map =
{
    ["steam-engine"]   = 1,
    ["steam-engine-2"] = 2,
    ["steam-engine-3"] = 3,
    ["steam-engine-4"] = 4,
    ["steam-engine-5"] = 5
}

local base = 
{
    ["remnants"] = table.deepcopy(data.raw["corpse"][flags.baseentity.."-remnants"].animation[1]),
    ["horizontal"] = table.deepcopy(data.raw[type][flags.baseentity].horizontal_animation.layers),
    ["vertical"] = table.deepcopy(data.raw[type][flags.baseentity].vertical_animation.layers)
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
    explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Create remnants
    remnant.animation =
    {
        layers = 
        {
            base.remnants,
            {
                filename = flags.directory.."/graphics/entity/steam-engine/"..name.."/remnants/"..name.."-remnants-mask.png",
                line_length = 1,
                width = 232,
                height = 194,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(17, 7),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/steam-engine/"..name.."/remnants/hr-"..name.."-remnants-mask.png",
                    line_length = 1,
                    width = 462,
                    height = 386,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(17, 6.5),
                    scale = 0.5,
                }
            }
        }
    }
    
    -- Reskin entities
    entity.horizontal_animation.layers =
    {
        base.horizontal[1],
        {
            filename = flags.directory.."/graphics/entity/steam-engine/"..name.."/"..name.."-H-mask.png",
            width = 176,
            height = 128,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(1, -5),
            hr_version =
            {
                filename = flags.directory.."/graphics/entity/steam-engine/"..name.."/hr-"..name.."-H-mask.png",
                width = 352,
                height = 257,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -4.75),
                scale = 0.5
            }
        },
        base.horizontal[2]
    }
    entity.vertical_animation.layers =
    {
        base.vertical[1],
        {
            filename = flags.directory.."/graphics/entity/steam-engine/"..name.."/"..name.."-V-mask.png",
            width = 112,
            height = 195,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(5, -6.5),
            hr_version =
            {
                filename = flags.directory.."/graphics/entity/steam-engine/"..name.."/hr-"..name.."-V-mask.png",
                width = 225,
                height = 391,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(4.75, -6.25),
                scale = 0.5
            }
        },
        base.vertical[2]
    }

    -- Label to skip to next iteration
    ::continue::    
end