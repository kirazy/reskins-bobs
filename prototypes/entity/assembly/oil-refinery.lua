-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] then return end
if settings.startup["reskins-bobs-do-bobassembly"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "assembling-machine",
    root_name = "oil-refinery",
    base_entity = "oil-refinery",
    directory = reskins.bobs.directory,
    mod = "assembly",
    particles = {["big-tint"] = 5, ["medium"] = 2},
    make_icons = false
}

-- oil-refinerys have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["oil-refinery"]   = 1,
        ["oil-refinery-2"] = 2,
        ["oil-refinery-3"] = 3,
        ["oil-refinery-4"] = 4
    }
else
    tier_map =
    {
        ["oil-refinery"]   = 2,
        ["oil-refinery-2"] = 3,
        ["oil-refinery-3"] = 4,
        ["oil-refinery-4"] = 5
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

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
    
    reskins.lib.setup_standard_structure(name, tier, inputs)

    -- Fetch remnant
    remnant = data.raw["corpse"][name.."-remnants"]

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet(1,
    {
        layers = 
        {
            -- Base
            {
                filename = "__base__/graphics/entity/oil-refinery/remnants/refinery-remnants.png",
                line_length = 1,
                width = 234,
                height = 200,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(0, 0), --moved from -8.5 to -4.5
                hr_version =
                {
                  filename = "__base__/graphics/entity/oil-refinery/remnants/hr-refinery-remnants.png",
                  line_length = 1,
                  width = 467,
                  height = 415,
                  frame_count = 1,
                  direction_count = 1,
                  shift = util.by_pixel(-0.25, -0.25), --moved from -8.5 to -4.5
                  scale = 0.5,
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/remnants/refinery-remnants-mask.png",
                line_length = 1,
                width = 234,
                height = 200,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(0, 0),
                tint = inputs.tint,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/remnants/hr-refinery-remnants-mask.png",
                    line_length = 1,
                    width = 467,
                    height = 415,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-0.25, -0.25),
                    tint = inputs.tint,
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/remnants/refinery-remnants-highlights.png",
                line_length = 1,
                width = 234,
                height = 200,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(0, 0),
                blend_mode = "additive",
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/remnants/hr-refinery-remnants-highlights.png",
                    line_length = 1,
                    width = 467,
                    height = 415,
                    frame_count = 1,
                    direction_count = 1,
                    shift = util.by_pixel(-0.25, -0.25),
                    blend_mode = "additive",
                    scale = 0.5,
                }
            }
        }
    })

    -- Reskin entity
    entity.animation = reskins.lib.make_4way_animation_from_spritesheet(
    {
        layers =
        {
            -- Base
            {
                filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
                width = 337,
                height = 255,
                frame_count = 1,
                shift = {2.515625, 0.484375},
                hr_version =
                {
                filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery.png",
                width = 386,
                height = 430,
                frame_count = 1,
                shift = util.by_pixel(0, -7.5),
                scale = 0.5
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/oil-refinery-mask.png",
                width = 337,
                height = 255,
                frame_count = 1,
                shift = {2.515625, 0.484375},
                tint = inputs.tint,
                hr_version =
                {
                filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/hr-oil-refinery-mask.png",
                width = 386,
                height = 430,
                frame_count = 1,
                shift = util.by_pixel(0, -7.5),
                tint = inputs.tint,
                scale = 0.5
                }
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/oil-refinery-highlights.png",
                width = 337,
                height = 255,
                frame_count = 1,
                shift = {2.515625, 0.484375},
                blend_mode = "additive",
                hr_version =
                {
                filename = inputs.directory.."/graphics/entity/assembly/oil-refinery/hr-oil-refinery-highlights.png",
                width = 386,
                height = 430,
                frame_count = 1,
                shift = util.by_pixel(0, -7.5),
                blend_mode = "additive",
                scale = 0.5
                }
            },
            -- Shadow
            {
                filename = "__base__/graphics/entity/oil-refinery/oil-refinery-shadow.png",
                width = 337,
                height = 213,
                frame_count = 1,
                shift = util.by_pixel(82.5, 26.5),
                draw_as_shadow = true,
                hr_version =
                {
                filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-shadow.png",
                width = 674,
                height = 426,
                frame_count = 1,
                shift = util.by_pixel(82.5, 26.5),
                draw_as_shadow = true,
                force_hr_shadow = true,
                scale = 0.5
                }
            }
        }
    })

    -- Label to skip to next iteration
    ::continue::
end