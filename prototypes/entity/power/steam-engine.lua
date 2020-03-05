-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "generator",
    root_name = "steam-engine",
    base_entity = "steam-engine",
    directory = reskins.bobs_structures.directory,
    group = "power",
    particles = {["medium"] = 2,["big"] = 1}
}

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
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..tier

    reskins.lib.setup_common_attributes(name, tier, inputs)

    -- Fetch remnant
    remnant = data.raw["corpse"][name.."-remnants"]

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet (1,
    {
        layers = 
        {
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/base/remnants/steam-engine-remnants.png",
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
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/base/remnants/hr-steam-engine-remnants.png",
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
            },
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/mask/"..inputs.internal_name.."/remnants/"..inputs.internal_name.."-remnants.png",
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
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/mask/"..inputs.internal_name.."/remnants/hr-"..inputs.internal_name.."-remnants.png",
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
    })
    
    -- Reskin entities
    entity.horizontal_animation =
    {
        layers =
        {
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/base/steam-engine-H.png",
                width = 176,
                height = 128,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/base/hr-steam-engine-H.png",
                    width = 352,
                    height = 257,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(1, -4.75),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-H.png",
                width = 176,
                height = 128,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-H.png",
                    width = 352,
                    height = 257,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(1, -4.75),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/base/steam-engine-H-shadow.png",
                width = 254,
                height = 80,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(48, 24),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/base/hr-steam-engine-H-shadow.png",
                    width = 508,
                    height = 160,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(48, 24),
                    scale = 0.5
                }
            }
        }
    }

    entity.vertical_animation =
    {
        layers =
        {
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/base/steam-engine-V.png",
                width = 112,
                height = 195,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(5, -6.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/base/hr-steam-engine-V.png",
                    width = 225,
                    height = 391,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(4.75, -6.25),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-V.png",
                width = 112,
                height = 195,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(5, -6.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-V.png",
                    width = 225,
                    height = 391,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(4.75, -6.25),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/power/steam-engine/base/steam-engine-V-shadow.png",
                width = 165,
                height = 153,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(40.5, 9.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/steam-engine/base/hr-steam-engine-V-shadow.png",
                    width = 330,
                    height = 307,
                    frame_count = 32,
                    line_length = 8,
                    draw_as_shadow = true,
                    shift = util.by_pixel(40.5, 9.25),
                    scale = 0.5
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::    
end