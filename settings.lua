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
        type = "string-setting",
        name = "reskin-series-tier-mapping",
        setting_type = "startup",
        default_value = "name-map",
        allowed_values = {"ingredients-map","name-map"}
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