-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-accumulators"].value == false then return end
if settings.startup["reskins-bobs-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "accumulator",
    root_name = "accumulator",
    base_entity = "accumulator",
    directory = reskins.bobs.directory,
    mod = "power",
    particles = {["medium"] = 2, ["small"] = 3},
    make_icons = false
}

-- Accumulators have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["large-accumulator"]   = {1, 1, "large"},
        ["large-accumulator-2"] = {2, 1, "large"},
        ["large-accumulator-3"] = {3, 1, "large"},
        ["slow-accumulator"]    = {1, 2, "slow"},
        ["slow-accumulator-2"]  = {2, 2, "slow"},
        ["slow-accumulator-3"]  = {3, 2, "slow"},
        ["fast-accumulator"]    = {1, 3, "fast"},
        ["fast-accumulator-2"]  = {2, 3, "fast"},
        ["fast-accumulator-3"]  = {1, 3, "fast"},
    }
else
    tier_map =
    {
        ["large-accumulator"]   = {2, 1, "large"},
        ["large-accumulator-2"] = {3, 1, "large"},
        ["large-accumulator-3"] = {4, 1, "large"},
        ["slow-accumulator"]    = {2, 2, "slow"},
        ["slow-accumulator-2"]  = {3, 2, "slow"},
        ["slow-accumulator-3"]  = {4, 2, "slow"},
        ["fast-accumulator"]    = {2, 3, "fast"},
        ["fast-accumulator-2"]  = {3, 3, "fast"},
        ["fast-accumulator-3"]  = {4, 3, "fast"},
    }
end

local function accumulator_picture_tinted(inputs, repeat_count)
    return
    {
        layers =
        {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/power/accumulator/wires/accumulator-"..inputs.wire..".png",
                priority = "high",
                width = 66,
                height = 94,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -10),
                animation_speed = 0.5,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/accumulator/wires/hr-accumulator-"..inputs.wire..".png",
                    priority = "high",
                    width = 130,
                    height = 189,
                    repeat_count = repeat_count,
                    shift = util.by_pixel(0, -11),
                    animation_speed = 0.5,
                    scale = 0.5
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/power/accumulator/accumulator-mask.png",
                priority = "high",
                width = 66,
                height = 94,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -10),
                tint = inputs.tint,
                animation_speed = 0.5,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/accumulator/hr-accumulator-mask.png",
                    priority = "high",
                    width = 130,
                    height = 189,
                    repeat_count = repeat_count,
                    shift = util.by_pixel(0, -11),
                    tint = inputs.tint,
                    animation_speed = 0.5,
                    scale = 0.5
                }
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/power/accumulator/accumulator-highlights.png",
                priority = "high",
                width = 66,
                height = 94,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -10),
                blend_mode = "additive",
                animation_speed = 0.5,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/accumulator/hr-accumulator-highlights.png",
                    priority = "high",
                    width = 130,
                    height = 189,
                    repeat_count = repeat_count,
                    shift = util.by_pixel(0, -11),
                    blend_mode = "additive",
                    animation_speed = 0.5,
                    scale = 0.5
                }
            },
            -- Shadow
            {
                filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
                priority = "high",
                width = 120,
                height = 54,
                repeat_count = repeat_count,
                shift = util.by_pixel(28, 6),
                draw_as_shadow = true,
                hr_version =
                {
                    filename = "__base__/graphics/entity/accumulator/hr-accumulator-shadow.png",
                    priority = "high",
                    width = 234,
                    height = 106,
                    repeat_count = repeat_count,
                    shift = util.by_pixel(29, 6),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        }
    }
end

local function accumulator_charge_tinted(inputs)
    return
    {
        layers =
        {
            accumulator_picture_tinted(inputs, 24),
            {
                filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
                priority = "high",
                width = 90,
                height = 100,
                line_length = 6,
                frame_count = 24,
                blend_mode = "additive",
                shift = util.by_pixel(0, -22),
                hr_version =
                {
                    filename = "__base__/graphics/entity/accumulator/hr-accumulator-charge.png",
                    priority = "high",
                    width = 178,
                    height = 206,
                    line_length = 6,
                    frame_count = 24,
                    blend_mode = "additive",
                    shift = util.by_pixel(0, -22),
                    scale = 0.5
                }
            }
        }
    }
end

local function accumulator_discharge_tinted(inputs)
    return
    {
        layers =
        {
            accumulator_picture_tinted(inputs, 24),
            {
                filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",
                priority = "high",
                width = 88,
                height = 104,
                line_length = 6,
                frame_count = 24,
                blend_mode = "additive",
                shift = util.by_pixel(-2, -22),
                hr_version =
                {
                    filename = "__base__/graphics/entity/accumulator/hr-accumulator-discharge.png",
                    priority = "high",
                    width = 170,
                    height = 210,
                    line_length = 6,
                    frame_count = 24,
                    blend_mode = "additive",
                    shift = util.by_pixel(-1, -23),
                    scale = 0.5
                }
            }
        }
    }
end


-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    inputs.wire = map[2]
    
    -- Map entity to name used internally
    inputs.internal_name = inputs.root_name.."-"..map[3].."-"..tier

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
    
    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Fetch remnant
    remnant = data.raw["corpse"][name.."-remnants"]    

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet(1,
    {
        layers =
        {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/power/accumulator/remnants/wires/accumulator-"..inputs.wire.."-remnants.png",
                line_length = 1,
                width = 86,
                height = 74,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2, 4),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/accumulator/remnants/wires/hr-accumulator-"..inputs.wire.."-remnants.png",
                    line_length = 1,
                    width = 172,
                    height = 146,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(2.5, 3.5),
                    scale = 0.5,
                },
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/power/accumulator/remnants/accumulator-remnants-mask.png",
                line_length = 1,
                width = 86,
                height = 74,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2, 4),
                tint = inputs.tint,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/accumulator/remnants/hr-accumulator-remnants-mask.png",
                    line_length = 1,
                    width = 172,
                    height = 146,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(2.5, 3.5),
                    tint = inputs.tint,
                    scale = 0.5,
                },
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/power/accumulator/remnants/accumulator-remnants-highlights.png",
                line_length = 1,
                width = 86,
                height = 74,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2, 4),
                blend_mode = "additive",
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/accumulator/remnants/hr-accumulator-remnants-highlights.png",
                    line_length = 1,
                    width = 172,
                    height = 146,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(2.5, 3.5),
                    blend_mode = "additive",
                    scale = 0.5,
                },
            }
        }
    })

    -- Reskin entities
    entity.picture = accumulator_picture_tinted(inputs)
    entity.charge_animation = accumulator_charge_tinted(inputs)
    entity.discharge_animation = accumulator_discharge_tinted(inputs)

    -- Label to skip to next iteration
    ::continue::
end