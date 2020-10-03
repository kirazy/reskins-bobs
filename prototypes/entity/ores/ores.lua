-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobores"] then return end
if reskins.lib.setting("reskins-bobs-do-bobores") == false then return end

local inputs = {
    type = "resource",
    mod = "bobs",
    group = "ores",
}

reskins.lib.parse_inputs(inputs)

local ores = {
    -- Pure Bob's
    -- ["gem-ore"] = {},
    ["lead-ore"] = {}, -- 404040
    ["rutile-ore"] = {},
    ["sulfur"] = {},
    ["thorium-ore"] = {},
    -- ["tin-ore"] = {},

    -- Shared with Angel's
    -- ["bauxite-ore"] = {mod = "lib", group = "shared"},
    ["cobalt-ore"] = {mod = "lib", group = "shared"},
    ["gold-ore"] = {mod = "lib", group = "shared"},
    ["nickel-ore"] = {mod = "lib", group = "shared"}, -- 408073
    ["quartz"] = {mod = "lib", group = "shared"}, -- 999999
    ["silver-ore"] = {mod = "lib", group = "shared"},
    -- ["tungsten-ore"] = {mod = "lib", group = "shared"},
    ["zinc-ore"] = {mod = "lib", group = "shared"},
}

for name, params in pairs(ores) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Fetch mod information
    local mod = params.mod or inputs.mod
    local group = params.group or inputs.group

    -- Setup icons
    if name == "sulfur" then
        inputs.icon = "__base__/graphics/icons/sulfur.png"
        inputs.icon_picture = nil
    else
        inputs.icon = reskins[mod].directory.."/graphics/icons/"..group.."/ores/"..name.."/"..name..".png"
        inputs.icon_picture = {
            { size = 64, filename = reskins[mod].directory.."/graphics/icons/"..group.."/ores/"..name.."/"..name..".png",   scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = reskins[mod].directory.."/graphics/icons/"..group.."/ores/"..name.."/"..name.."-1.png", scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = reskins[mod].directory.."/graphics/icons/"..group.."/ores/"..name.."/"..name.."-2.png", scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = reskins[mod].directory.."/graphics/icons/"..group.."/ores/"..name.."/"..name.."-3.png", scale = 0.25, mipmap_count = 4 }
        }
    end

    reskins.lib.assign_icons(name, inputs)

    -- Reskin entity
    entity.stages = {
        sheet = {
            filename = reskins.bobs.directory.."/graphics/entity/ores/"..name.."/"..name..".png",
            priority = "extra-high",
            size = 64,
            frame_count = 8,
            variation_count = 8,
            hr_version = {
                filename = reskins.bobs.directory.."/graphics/entity/ores/"..name.."/hr-"..name..".png",
                priority = "extra-high",
                size = 128,
                frame_count = 8,
                variation_count = 8,
                scale = 0.5
            }
        }
    }

    -- Radioactive glow
    if name == "thorium" then
        entity.stages_effect = {
            sheet = {
                filename = reskins.bobs.directory.."/graphics/entity/ores/"..name.."/"..name.."-glow.png",
                priority = "extra-high",
                width = 64,
                height = 64,
                frame_count = 8,
                variation_count = 8,
                blend_mode = "additive",
                flags = {"light"},
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/ores/"..name.."/hr-"..name.."-glow.png",
                    priority = "extra-high",
                    width = 128,
                    height = 128,
                    frame_count = 8,
                    variation_count = 8,
                    scale = 0.5,
                    blend_mode = "additive",
                    flags = {"light"}
                }
            }
        }
    end

    -- Label to skip to next iteration
    ::continue::
end