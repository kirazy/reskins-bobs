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
    ["bob-wooden-board"]              = { subgroup = "circuits" },
    ["bob-phenolic-board"]            = { subgroup = "circuits" },
    ["bob-fibreglass-board"]          = { subgroup = "circuits" },

    -- Circuits, standard coloring
    ["bob-basic-circuit-board"]       = { subgroup = "circuits" },
    ["bob-circuit-board"]             = { subgroup = "circuits" },
    ["bob-superior-circuit-board"]    = { subgroup = "circuits" },
    ["bob-multi-layer-circuit-board"] = { subgroup = "circuits" },
    ["electronic-circuit"]            = { subgroup = "circuits" },
    ["advanced-circuit"]              = { subgroup = "circuits" },
    ["processing-unit"]               = { subgroup = "circuits" },
    ["bob-advanced-processing-unit"]  = { subgroup = "circuits" },
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
                scale = 0.5,
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
        circuits["bob-basic-circuit-board"]       = get_circuit_overrides("circuits-custom", 1, 2, "bob-basic-circuit-board")
        circuits["bob-circuit-board"]             = get_circuit_overrides("circuits-custom", 2, 3, "bob-circuit-board")
        circuits["bob-superior-circuit-board"]    = get_circuit_overrides("circuits-custom", 3, 4, "bob-superior-circuit-board")
        circuits["bob-multi-layer-circuit-board"] = get_circuit_overrides("circuits-custom", 4, 5, "bob-multi-layer-circuit-board")

        -- Completed
        circuits["electronic-circuit"]            = get_circuit_overrides("circuits-custom", 1, 2, "electronic-circuit")
        circuits["advanced-circuit"]              = get_circuit_overrides("circuits-custom", 2, 3, "advanced-circuit")
        circuits["processing-unit"]               = get_circuit_overrides("circuits-custom", 3, 4, "processing-unit")
        circuits["bob-advanced-processing-unit"]  = get_circuit_overrides("circuits-custom", 4, 5, "bob-advanced-processing-unit")
    else
        if tier_mapping == "traditional-map" then
            circuits["bob-basic-circuit-board"]       = { subgroup = "circuits-name" }
            circuits["bob-circuit-board"]             = { subgroup = "circuits-name" }
            circuits["bob-superior-circuit-board"]    = { subgroup = "circuits-name" }
            circuits["bob-multi-layer-circuit-board"] = { subgroup = "circuits-name" }

            circuits["electronic-circuit"]            = { subgroup = "circuits-name" }
            circuits["advanced-circuit"]              = { subgroup = "circuits-name" }
            circuits["processing-unit"]               = { subgroup = "circuits-name" }
            circuits["bob-advanced-processing-unit"]  = { subgroup = "circuits-name" }
        elseif tier_mapping == "progression-map" then
            circuits["bob-basic-circuit-board"]       = { subgroup = "circuits-progression" }
            circuits["bob-circuit-board"]             = { subgroup = "circuits-progression" }
            circuits["bob-superior-circuit-board"]    = { subgroup = "circuits-progression" }
            circuits["bob-multi-layer-circuit-board"] = { subgroup = "circuits-progression" }

            circuits["electronic-circuit"]            = { subgroup = "circuits-progression" }
            circuits["advanced-circuit"]              = { subgroup = "circuits-progression" }
            circuits["processing-unit"]               = { subgroup = "circuits-progression" }
            circuits["bob-advanced-processing-unit"]  = { subgroup = "circuits-progression" }
        end
    end
elseif circuit_color_style == "colored-vanilla" then
    circuits["bob-basic-circuit-board"]       = { subgroup = "circuits-vanilla" }
    circuits["bob-circuit-board"]             = { subgroup = "circuits-vanilla" }
    circuits["bob-superior-circuit-board"]    = { subgroup = "circuits-vanilla" }
    circuits["bob-multi-layer-circuit-board"] = { subgroup = "circuits-vanilla" }

    circuits["electronic-circuit"]            = { subgroup = "circuits-vanilla" }
    circuits["advanced-circuit"]              = { subgroup = "circuits-vanilla" }
    circuits["processing-unit"]               = { subgroup = "circuits-vanilla" }
    circuits["bob-advanced-processing-unit"]  = { subgroup = "circuits-vanilla" }
end

reskins.internal.create_icons_from_list(circuits, inputs)
