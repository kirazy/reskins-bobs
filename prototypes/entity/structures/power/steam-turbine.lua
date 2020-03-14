-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-steam"].value == false then return end
if settings.startup["reskins-bobs-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "generator",
    root_name = "steam-turbine",
    base_entity = "steam-turbine",
    directory = reskins.bobs.directory,
    mod = "power",
    particles = {["medium"] = 2,["big"] = 1}
}

-- Steam turbines have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
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
end

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
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/remnants/steam-turbine-remnants.png",
                line_length = 1,
                width = 230,
                height = 204,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(6, 0),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/remnants/hr-steam-turbine-remnants.png",
                    line_length = 1,
                    width = 460,
                    height = 408,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(6, 0),
                    scale = 0.5,
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/mask/"..inputs.internal_name.."/remnants/"..inputs.internal_name.."-remnants.png",
                line_length = 1,
                width = 230,
                height = 204,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 4,
                shift = util.by_pixel(6, 0),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/mask/"..inputs.internal_name.."/remnants/hr-"..inputs.internal_name.."-remnants.png",
                    line_length = 1,
                    width = 460,
                    height = 408,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 4,
                    shift = util.by_pixel(6, 0),
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
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/steam-turbine-H.png",
                width = 160,
                height = 123,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(0, -2.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/hr-steam-turbine-H.png",
                    width = 320,
                    height = 245,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(0, -2.75),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-H.png",
                width = 160,
                height = 123,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(0, -2.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-H.png",
                    width = 320,
                    height = 245,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(0, -2.75),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/steam-turbine-H-shadow.png",
                width = 217,
                height = 74,
                repeat_count = 8,
                frame_count = 1,
                line_length = 1,
                draw_as_shadow = true,
                shift = util.by_pixel(28.75, 18),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/hr-steam-turbine-H-shadow.png",
                    width = 435,
                    height = 150,
                    repeat_count = 8,
                    frame_count = 1,
                    line_length = 1,
                    draw_as_shadow = true,
                    shift = util.by_pixel(28.5, 18),
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
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/steam-turbine-V.png",
                width = 108,
                height = 173,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(5, 6.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/hr-steam-turbine-V.png",
                    width = 217,
                    height = 347,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(4.75, 6.75),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/mask/"..inputs.internal_name.."/"..inputs.internal_name.."-V.png",
                width = 108,
                height = 173,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(5, 6.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/mask/"..inputs.internal_name.."/hr-"..inputs.internal_name.."-V.png",
                    width = 217,
                    height = 347,
                    frame_count = 8,
                    line_length = 4,
                    shift = util.by_pixel(4.75, 6.75),
                    scale = 0.5
                }
            },
            {
                filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/steam-turbine-V-shadow.png",
                width = 151,
                height = 131,
                repeat_count = 8,
                frame_count = 1,
                line_length = 1,
                draw_as_shadow = true,
                shift = util.by_pixel(39.5, 24.5),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/structures/power/steam-turbine/base/hr-steam-turbine-V-shadow.png",
                    width = 302,
                    height = 260,
                    repeat_count = 8,
                    frame_count = 1,
                    line_length = 1,
                    draw_as_shadow = true,
                    shift = util.by_pixel(39.5, 24.5),
                    scale = 0.5
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end