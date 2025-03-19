-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.vehicle_equipment.equipment) then return end

-- Note that for equipment, the icons property is not used, so omit type information
-- so that an icon is not set on the equipment prototype.
local inputs = {
    icon_name = "vehicle-battery",
    equipment_category = "energy",
    mod = "bobs",
    group = "vehicle-equipment",
}

-- Setup defaults
reskins.lib.set_inputs_defaults(inputs)

local batteries = {
    ["bob-vehicle-battery-equipment-1"] = { tier = 0 },
    ["bob-vehicle-battery-equipment-2"] = { tier = 1 },
    ["bob-vehicle-battery-equipment-3"] = { tier = 2 },
    ["bob-vehicle-battery-equipment-4"] = { tier = 3 },
    ["bob-vehicle-battery-equipment-5"] = { tier = 4 },
    ["bob-vehicle-battery-equipment-6"] = { tier = 5 },
}

-- Reskin equipment
for name, map in pairs(batteries) do
    -- Fetch equipment
    local equipment = data.raw["battery-equipment"][name]

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
                filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-battery/vehicle-battery-equipment-base.png",
                size = 64,
                priority = "medium",
                flags = { "no-crop" },
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-battery/vehicle-battery-equipment-mask.png",
                size = 64,
                priority = "medium",
                flags = { "no-crop" },
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-bobs__/graphics/equipment/vehicle-equipment/vehicle-battery/vehicle-battery-equipment-highlights.png",
                size = 64,
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
