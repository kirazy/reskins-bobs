-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.power.entities) then return end
if not (reskins.bobs and reskins.bobs.triggers.power.accumulators) then return end

-- Set input parameters
local inputs = {
    type = "accumulator",
    icon_name = "accumulator",
    base_entity_name = "accumulator",
    mod = "bobs",
    group = "power",
    particles = { ["medium"] = 2, ["small"] = 3 },
}

local tier_map = {
    ["accumulator"] = { tier = 1, prog_tier = 2 },
    ["large-accumulator"] = { tier = 1, prog_tier = 2, wire = 1, letter = "H" },
    ["large-accumulator-2"] = { tier = 2, prog_tier = 3, wire = 1, letter = "H" },
    ["large-accumulator-3"] = { tier = 3, prog_tier = 4, wire = 1, letter = "H" },
    ["slow-accumulator"] = { tier = 1, prog_tier = 2, wire = 2, letter = "S" },
    ["slow-accumulator-2"] = { tier = 2, prog_tier = 3, wire = 2, letter = "S" },
    ["slow-accumulator-3"] = { tier = 3, prog_tier = 4, wire = 2, letter = "S" },
    ["fast-accumulator"] = { tier = 1, prog_tier = 2, wire = 3, letter = "F" },
    ["fast-accumulator-2"] = { tier = 2, prog_tier = 3, wire = 3, letter = "F" },
    ["fast-accumulator-3"] = { tier = 3, prog_tier = 4, wire = 3, letter = "F" },
}

if reskins.lib.version.is_same_or_newer(mods["bobpower"], "1.1.6") then
    tier_map["accumulator"] = { tier = 1, prog_tier = 2, wire = 1, letter = "H" }
    tier_map["large-accumulator"] = nil
end

local function accumulator_picture_tinted(inputs, repeat_count)
    return
    {
        layers = {
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/power/accumulator/wires/hr-accumulator-" .. inputs.wire .. ".png",
                priority = "high",
                width = 130,
                height = 189,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -11),
                animation_speed = 0.5,
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/power/accumulator/hr-accumulator-mask.png",
                priority = "high",
                width = 130,
                height = 189,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -11),
                tint = inputs.tint,
                animation_speed = 0.5,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/power/accumulator/hr-accumulator-highlights.png",
                priority = "high",
                width = 130,
                height = 189,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -11),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                animation_speed = 0.5,
                scale = 0.5,
            },
            -- Shadow
            {
                filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
                priority = "high",
                width = 234,
                height = 106,
                repeat_count = repeat_count,
                shift = util.by_pixel(29, 6),
                draw_as_shadow = true,
                scale = 0.5,
            },
        },
    }
end

local function accumulator_charge_tinted(inputs)
    return
    {
        layers = {
            accumulator_picture_tinted(inputs, 24),
            {
                filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
                priority = "high",
                width = 178,
                height = 206,
                line_length = 6,
                frame_count = 24,
                draw_as_glow = true,
                shift = util.by_pixel(0, -22),
                scale = 0.5,
            },
        },
    }
end

local function accumulator_discharge_tinted(inputs)
    return
    {
        layers = {
            accumulator_picture_tinted(inputs, 24),
            {
                filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",
                priority = "high",
                width = 170,
                height = 210,
                line_length = 6,
                frame_count = 24,
                draw_as_glow = true,
                shift = util.by_pixel(-1, -23),
                scale = 0.5,
            },
        },
    }
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    ---@type data.AccumulatorPrototype
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Parse map
    local tier = map.tier
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end
    inputs.wire = map.wire

    -- Stick tier labels on the vanilla accumulator
    if name == "accumulator" and reskins.lib.version.is_older(mods["bobpower"], "1.1.6") then
        reskins.lib.tiers.add_tier_labels_to_prototype_by_reference(tier, entity)
        goto continue
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tiers.get_tint(tier)

    -- Setup icon base details
    inputs.icon_base = "accumulator-" .. map.wire

    -- Setup additional icon details
    inputs.icon_extras = reskins.lib.icons.get_letter(map.letter, reskins.lib.tiers.get_tint(tier))

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Fetch remnant
    local remnant = data.raw["corpse"][name .. "-remnants"]

    -- Reskin remnants
    remnant.animation = make_rotated_animation_variations_from_sheet(1, {
        layers = {
            -- Base
            {
                filename = "__reskins-bobs__/graphics/entity/power/accumulator/remnants/wires/hr-accumulator-" .. inputs.wire .. "-remnants.png",
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
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/entity/power/accumulator/remnants/hr-accumulator-remnants-mask.png",
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
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/entity/power/accumulator/remnants/hr-accumulator-remnants-highlights.png",
                line_length = 1,
                width = 172,
                height = 146,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2.5, 3.5),
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
        },
    })

    -- Reskin entities
    entity.picture = accumulator_picture_tinted(inputs)
    entity.charge_animation = accumulator_charge_tinted(inputs)
    entity.discharge_animation = accumulator_discharge_tinted(inputs)

    -- Remove lights
    entity.charge_light = nil
    entity.discharge_light = nil

    -- Label to skip to next iteration
    ::continue::
end
