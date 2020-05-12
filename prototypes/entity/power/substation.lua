-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-poles"].value == false then return end
if settings.startup["reskins-bobs-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "electric-pole",
    root_name = "substation",
    base_entity = "substation",
    directory = reskins.bobs.directory,
    mod = "power",
    particles = {["big"] = 2},
    make_icons = false,
}

-- Substations have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["substation"]   = 1,
        ["substation-2"] = 2,
        ["substation-3"] = 3,
        ["substation-4"] = 4
    }
else
    tier_map =
    {
        ["substation"]   = 2,
        ["substation-2"] = 3,
        ["substation-3"] = 4,
        ["substation-4"] = 5
    }
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end
  
    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..tier

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Initialize table addresses    
    remnant = data.raw["corpse"][name.."-remnants"]

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet (1,
    {
        layers = 
        {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/power/substation/base/remnants/substation-remnants.png",
                line_length = 1,
                width = 92,
                height = 68,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(3, 1),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/substation/base/remnants/hr-substation-remnants.png",
                    line_length = 1,
                    width = 182,
                    height = 134,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(2.5, 0.5),
                    scale = 0.5,
                },
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/power/substation/remnants/substation-remnants-mask.png",
                line_length = 1,
                width = 92,
                height = 68,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(3, 1),
                tint = inputs.tint,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/substation/remnants/hr-substation-remnants-mask.png",
                    line_length = 1,
                    width = 182,
                    height = 134,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(2.5, 0.5),
                    tint = inputs.tint,
                    scale = 0.5,
                },
            },
            {
                filename = inputs.directory.."/graphics/entity/power/substation/remnants/substation-remnants-highlights.png",
                line_length = 1,
                width = 92,
                height = 68,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(3, 1),
                blend_mode = "additive",
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/substation/remnants/hr-substation-remnants-highlights.png",
                    line_length = 1,
                    width = 182,
                    height = 134,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(2.5, 0.5),
                    blend_mode = "additive",
                    scale = 0.5,
                },
            }
        }
    })

    -- Reskin entities
    entity.pictures =
    {
        layers =
        {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/power/substation/base/substation.png",
                priority = "high",
                width = 70,
                height = 136,
                direction_count = 4,
                shift = util.by_pixel(0, 1-32),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/substation/base/hr-substation.png",
                    priority = "high",
                    width = 138,
                    height = 270,
                    direction_count = 4,
                    shift = util.by_pixel(0, 1-32),
                    scale = 0.5
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/power/substation/substation-mask.png",
                priority = "high",
                width = 70,
                height = 136,
                direction_count = 4,
                shift = util.by_pixel(0, 1-32),
                tint = inputs.tint,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/substation/hr-substation-mask.png",
                    priority = "high",
                    width = 138,
                    height = 270,
                    direction_count = 4,
                    shift = util.by_pixel(0, 1-32),
                    tint = inputs.tint,
                    scale = 0.5
                }
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/power/substation/substation-highlights.png",
                priority = "high",
                width = 70,
                height = 136,
                direction_count = 4,
                shift = util.by_pixel(0, 1-32),
                blend_mode = "additive",
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/substation/hr-substation-highlights.png",
                    priority = "high",
                    width = 138,
                    height = 270,
                    direction_count = 4,
                    shift = util.by_pixel(0, 1-32),
                    blend_mode = "additive",
                    scale = 0.5
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/power/substation/base/substation-shadow.png",
                priority = "high",
                width = 186,
                height = 52,
                direction_count = 4,
                shift = util.by_pixel(62, 42-32),
                draw_as_shadow = true,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/substation/base/hr-substation-shadow.png",
                    priority = "high",
                    width = 370,
                    height = 104,
                    direction_count = 4,
                    shift = util.by_pixel(62, 42-32),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        }
    }
    
    -- Label to skip to next iteration
    ::continue::
end