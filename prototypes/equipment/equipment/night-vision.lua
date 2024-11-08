-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.equipment.equipment) then return end

-- Note that for equipment, the icons property is not used, so omit type information
-- so that an icon is not set on the equipment prototype.
local inputs = {
    icon_name = "night-vision",
    mod = "bobs",
    group = "equipment",
}

-- Setup defaults
reskins.lib.set_inputs_defaults(inputs)

local night_vision = {
    ["night-vision-equipment"] = { tier = 1, prog_tier = 2 },
    ["night-vision-equipment-2"] = { tier = 2, prog_tier = 3 },
    ["night-vision-equipment-3"] = { tier = 3, prog_tier = 4 },
}

-- Reskin equipment
for name, map in pairs(night_vision) do
    -- Fetch equipment
    local equipment = data.raw["night-vision-equipment"][name]

    -- Check if entity exists, if not, skip this iteration
    if not equipment then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tiers.get_tint(tier)

    -- Construct icon
    reskins.lib.construct_icon(name, tier, inputs)

    -- Reskin the equipment
    equipment.sprite = {
        layers = {
            -- Base
            {
                filename = "__base__/graphics/equipment/night-vision-equipment.png",
                size = 128,
                priority = "medium",
                flags = { "no-crop" },
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/equipment/equipment/night-vision/hr-night-vision-equipment-mask.png",
                size = 128,
                priority = "medium",
                flags = { "no-crop" },
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/equipment/equipment/night-vision/hr-night-vision-equipment-highlights.png",
                size = 128,
                priority = "medium",
                flags = { "no-crop" },
                blend_mode = reskins.lib.settings.blend_mode, -- "additive",
                scale = 0.5,
            },
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
