-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check if the setting exists
if not reskins.lib.settings.get_value("reskins-bobs-do-bobelectronics-circuit-style") then return end

local circuits = {
    ["electronic-circuit"] = { tier = 1, prog_tier = 2 },
    ["advanced-circuit"] = { tier = 2, prog_tier = 3 },
    ["processing-unit"] = { tier = 3, prog_tier = 4 },
    ["advanced-processing-unit"] = { tier = 4, prog_tier = 5 },
}

for circuit, map in pairs(circuits) do
    -- Make vanilla-colored sprites
    data:extend({
        {
            type = "sprite",
            name = "reskins-bob-" .. circuit .. "-vanilla",
            filename = "__reskins-bobs__/graphics/icons/sprites/circuits/vanilla/" .. circuit .. ".png",
            size = 40,
            mipmap_count = 2,
            flags = { "gui-icon" },
        }
    })

    -- Make material-colored sprites
    data:extend({
        {
            type = "sprite",
            name = "reskins-bob-" .. circuit .. "-material",
            filename = "__reskins-bobs__/graphics/icons/sprites/circuits/material/" .. circuit .. ".png",
            size = 40,
            mipmap_count = 2,
            flags = { "gui-icon" },
        }
    })

    -- Parse map
    local tier = map.tier
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier
    end

    -- Fetch tint
    local tint = reskins.lib.tiers.get_tint(tier)

    -- Make tier colored sprites
    data:extend({
        {
            type = "sprite",
            name = "reskins-bob-" .. circuit .. "-tier",
            layers = {
                {
                    filename = "__reskins-library__/graphics/icons/sprites/circuits/" .. circuit .. "/" .. circuit .. "-base.png",
                    size = 40,
                    mipmap_count = 2,
                    flags = { "gui-icon" },
                },
                {
                    filename = "__reskins-library__/graphics/icons/sprites/circuits/" .. circuit .. "/" .. circuit .. "-mask.png",
                    size = 40,
                    tint = tint,
                    mipmap_count = 2,
                    flags = { "gui-icon" },
                },
                {
                    filename = "__reskins-library__/graphics/icons/sprites/circuits/" .. circuit .. "/" .. circuit .. "-highlights.png",
                    size = 40,
                    blend_mode = "additive",
                    mipmap_count = 2,
                    flags = { "gui-icon" },
                }
            },
            flags = { "gui-icon" }
        }
    })
end
