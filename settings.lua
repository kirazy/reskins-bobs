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