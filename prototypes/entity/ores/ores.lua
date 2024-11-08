-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.ores.entities) then return end

local ores = {
    -- Pure Bob's
    -- ["gem-ore"] = { key = "bobs", subfolder = "ores" },
    ["lead-ore"]     = { key = "lib", subfolder = "shared" }, -- 404040
    ["rutile-ore"]   = { key = "bobs", subfolder = "ores" },
    ["sulfur"]       = { key = "bobs", subfolder = "ores" },
    ["thorium-ore"]  = { key = "bobs", subfolder = "ores", is_light = true },
    ["tin-ore"]      = { key = "lib", subfolder = "shared", num_variations = 8 },

    -- Shared with Angel's
    ["bauxite-ore"]  = { key = "lib", subfolder = "shared", num_variations = 8 },
    ["cobalt-ore"]   = { key = "lib", subfolder = "shared" },
    ["gold-ore"]     = { key = "lib", subfolder = "shared" },
    ["nickel-ore"]   = { key = "lib", subfolder = "shared" }, -- 408073
    ["quartz"]       = { key = "lib", subfolder = "shared" }, -- 999999
    ["silver-ore"]   = { key = "lib", subfolder = "shared" },
    ["tungsten-ore"] = { key = "lib", subfolder = "shared", num_variations = 8 },
    ["zinc-ore"]     = { key = "lib", subfolder = "shared" },
}

for name, params in pairs(ores) do
    -- Fetch entity
    local entity = data.raw["resource"][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    if name == "sulfur" then
        reskins.lib.icons.assign_deferrable_icon({
            name = entity.name,
            type_name = entity.type,
            icon_datum = {
                icon = "__base__/graphics/icons/sulfur.png",
                icon_size = 64,
                icon_mipmaps = 4,
                scale = 0.5,
            },
        })
    else
        reskins.lib.icons.assign_deferrable_icon({
            name = entity.name,
            type_name = entity.type,
            icon_data = { {
                icon = reskins[params.key].directory .. "/graphics/icons/" .. params.subfolder .. "/ores/" .. name .. "/" .. name .. ".png",
                icon_size = 64,
                icon_mipmaps = 4,
                scale = 0.5,
            } },
            pictures = reskins.internal.create_sprite_variations(params.key, params.subfolder .. "/ores", name, params.num_variations or 4, params.is_light),
        })
    end

    -- Reskin entity
    entity.stages = {
        sheet = {
            filename = "__reskins-bobs__/graphics/entity/ores/" .. name .. "/hr-" .. name .. ".png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5,
        },
    }

    -- Radioactive glow
    if name == "thorium" then
        entity.stages_effect = {
            sheet = {
                filename = "__reskins-bobs__/graphics/entity/ores/" .. name .. "/hr-" .. name .. "-glow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                frame_count = 8,
                variation_count = 8,
                scale = 0.5,
                blend_mode = "additive",
                flags = { "light" },
            },
        }
    end

    -- Label to skip to next iteration
    ::continue::
end
