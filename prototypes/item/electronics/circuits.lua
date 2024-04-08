-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobelectronics"] then return end
if reskins.lib.settings.get_value("reskins-bobs-do-bobelectronics-circuit-style") == "off" then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "bobs",
    group = "electronics",
    make_icon_pictures = false,
    flat_icon = true,
    tier_labels = false,
}

---@type CreateIconsFromListTable
local circuits = {
    -- Boards
    ["wooden-board"]              = { subgroup = "circuits" },
    ["phenolic-board"]            = { subgroup = "circuits" },
    ["fibreglass-board"]          = { subgroup = "circuits" },

    -- Circuits, standard coloring
    ["basic-circuit-board"]       = { subgroup = "circuits" },
    ["circuit-board"]             = { subgroup = "circuits" },
    ["superior-circuit-board"]    = { subgroup = "circuits" },
    ["multi-layer-circuit-board"] = { subgroup = "circuits" },
    ["electronic-circuit"]        = { subgroup = "circuits" },
    ["advanced-circuit"]          = { subgroup = "circuits" },
    ["processing-unit"]           = { subgroup = "circuits" },
    ["advanced-processing-unit"]  = { subgroup = "circuits" },
}

local circuit_color_style = reskins.lib.settings.get_value("reskins-bobs-do-bobelectronics-circuit-style")
local tier_mapping = reskins.lib.settings.get_value("reskins-lib-tier-mapping")
local custom_color = reskins.lib.settings.get_value("reskins-lib-customize-tier-colors")

---@param subgroup? string # The directory under `graphics/icons/electronics` where the icon is located.
---@param tier? integer # The tier of the icon. An integer value from 0 to 6. Default `0`.
---@param prog_tier? integer # The tier of the icon, as determined by the progression map. An integer value from 0 to 6. Default `0`.
---@param name? string # The name of the icon.
local function get_circuit_overrides(subgroup, tier, prog_tier, name)
    ---@type CreateIconsFromListOverrides
    local override = {
        subgroup = subgroup,
        tier = tier,
        prog_tier = prog_tier,
        icon_name = name,
        icon_picture_extras = {
            {
                filename = "__reskins-bobs__/graphics/icons/electronics/circuits-custom/" .. name .. "/" .. name .. "-circuitry.png",
                size = 64,
                mipmaps = 4,
                scale = 0.25,
            },
        },
        flat_icon = false,
        make_icon_pictures = true,
    }

    return override
end

-- Check if we're using tier or vanilla coloring
if circuit_color_style == "colored-tier" then
    if custom_color then
        -- Intermediates
        circuits["basic-circuit-board"]       = get_circuit_overrides("circuits-custom", 1, 2, "basic-circuit-board")
        circuits["circuit-board"]             = get_circuit_overrides("circuits-custom", 2, 3, "circuit-board")
        circuits["superior-circuit-board"]    = get_circuit_overrides("circuits-custom", 3, 4, "superior-circuit-board")
        circuits["multi-layer-circuit-board"] = get_circuit_overrides("circuits-custom", 4, 5, "multi-layer-circuit-board")

        -- Completed
        circuits["electronic-circuit"]        = get_circuit_overrides("circuits-custom", 1, 2, "electronic-circuit")
        circuits["advanced-circuit"]          = get_circuit_overrides("circuits-custom", 2, 3, "advanced-circuit")
        circuits["processing-unit"]           = get_circuit_overrides("circuits-custom", 3, 4, "processing-unit")
        circuits["advanced-processing-unit"]  = get_circuit_overrides("circuits-custom", 4, 5, "advanced-processing-unit")
    else
        if tier_mapping == "traditional-map" then
            circuits["basic-circuit-board"]       = { subgroup = "circuits-name" }
            circuits["circuit-board"]             = { subgroup = "circuits-name" }
            circuits["superior-circuit-board"]    = { subgroup = "circuits-name" }
            circuits["multi-layer-circuit-board"] = { subgroup = "circuits-name" }

            circuits["electronic-circuit"]        = { subgroup = "circuits-name" }
            circuits["advanced-circuit"]          = { subgroup = "circuits-name" }
            circuits["processing-unit"]           = { subgroup = "circuits-name" }
            circuits["advanced-processing-unit"]  = { subgroup = "circuits-name" }
        elseif tier_mapping == "progression-map" then
            circuits["basic-circuit-board"]       = { subgroup = "circuits-progression" }
            circuits["circuit-board"]             = { subgroup = "circuits-progression" }
            circuits["superior-circuit-board"]    = { subgroup = "circuits-progression" }
            circuits["multi-layer-circuit-board"] = { subgroup = "circuits-progression" }

            circuits["electronic-circuit"]        = { subgroup = "circuits-progression" }
            circuits["advanced-circuit"]          = { subgroup = "circuits-progression" }
            circuits["processing-unit"]           = { subgroup = "circuits-progression" }
            circuits["advanced-processing-unit"]  = { subgroup = "circuits-progression" }
        end
    end
elseif circuit_color_style == "colored-vanilla" then
    circuits["basic-circuit-board"]       = { subgroup = "circuits-vanilla" }
    circuits["circuit-board"]             = { subgroup = "circuits-vanilla" }
    circuits["superior-circuit-board"]    = { subgroup = "circuits-vanilla" }
    circuits["multi-layer-circuit-board"] = { subgroup = "circuits-vanilla" }

    circuits["electronic-circuit"]        = { subgroup = "circuits-vanilla" }
    circuits["advanced-circuit"]          = { subgroup = "circuits-vanilla" }
    circuits["processing-unit"]           = { subgroup = "circuits-vanilla" }
    circuits["advanced-processing-unit"]  = { subgroup = "circuits-vanilla" }
end

reskins.internal.create_icons_from_list(circuits, inputs)
