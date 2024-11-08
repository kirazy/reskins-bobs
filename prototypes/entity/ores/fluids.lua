-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.ores.entities) then return end

local fluids = {
    "ground-water",
    "lithia-water",
}

for _, name in pairs(fluids) do
    -- Fetch entity
    local entity = data.raw["resource"][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    ---@type DeferrableIconDatum
    local deferrable_icon = {
        name = entity.name,
        type_name = entity.type,
        icon_datum = {
            icon = "__reskins-bobs__/graphics/icons/ores/ores/" .. name .. "/" .. name .. ".png",
            icon_size = 64,
            scale = 0.5,
        },
    }

    reskins.lib.icons.assign_deferrable_icon(deferrable_icon)

    -- Reskin entity
    entity.stages = {
        sheet = {
            filename = "__reskins-bobs__/graphics/entity/ores/" .. name .. "/hr-" .. name .. ".png",
            priority = "extra-high",
            width = 148,
            height = 120,
            frame_count = 4,
            variation_count = 1,
            shift = util.by_pixel(0, -2),
            scale = 0.5,
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
