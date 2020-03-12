-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Settings to be exported to Reskin Series: Library
data:extend(
{
    {
        type = "bool-setting",
        name = "reskin-series-icon-tier-labeling",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "reskin-series-customize-tier-colors",
        setting_type = "startup",
        default_value = false,
    },
    {
        type = "int-setting",
        name = "reskin-series-target-drone-health",
        setting_type = "startup",
        default_value = 50000000,
        maximum_value = 2147483648,
        minimum_value = 1000
    },
    {
        type = "string-setting",
        name = "reskin-series-tier-mapping",
        setting_type = "startup",
        default_value = "name-map",
        allowed_values = {"ingredients-map","name-map"}
    }
})

-- Customize tier coloring settings
data:extend(
{
    {
        type = "string-setting",
        name = "reskin-series-custom-colors-tier-0",
        setting_type ="startup",
        default_value = "4d4d4d",
    },
    {
        type = "string-setting",
        name = "reskin-series-custom-colors-tier-1",
        setting_type ="startup",
        default_value = "de9400",
    },
    {
        type = "string-setting",
        name = "reskin-series-custom-colors-tier-2",
        setting_type ="startup",
        default_value = "c20600",
    },
    {
        type = "string-setting",
        name = "reskin-series-custom-colors-tier-3",
        setting_type ="startup",
        default_value = "1b87c2",
    },
    {
        type = "string-setting",
        name = "reskin-series-custom-colors-tier-4",
        setting_type ="startup",
        default_value = "a600bf",
    },
    {
        type = "string-setting",
        name = "reskin-series-custom-colors-tier-5",
        setting_type ="startup",
        default_value = "23de55",
    }
})

-- Settings to disable select reskins by mod
if mods["bobassembly"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobassembly",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobgreenhouse"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobgreenhouse",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["boblogistics"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-boblogistics",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobmining"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobmining",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobmodules"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobmodules",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobplates"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobplates",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobpower"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobpower",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobrevamp"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobrevamp",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobtech"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobtech",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["bobwarfare"] then
    data:extend(
    {
        {
            type = "bool-setting",
            name = "reskin-series-do-bobwarfare",
            setting_type = "startup",
            default_value = true,
        }
    })
end