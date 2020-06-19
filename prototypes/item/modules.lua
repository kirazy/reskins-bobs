-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobmodules"] then return end
if settings.startup["reskins-bobs-do-bobmodules"].value == false then return end

-- Modules
local color_map = {
    ["blue"] = {"70b6ff", "63f8ff"},
    ["brown"] = {"9c7c60", "e8edd3"},
    ["cyan"] = {"70f1ff", "63ffde"},
    ["green"] = {"95e26c", "5eff5e"},
    ["pine"] = {"7a9e96", "a1dfb4"},
    ["pink"] = {"ff93de", "ffdaf2"},
    ["red"] = {"f27c52", "ffff85"},
    ["yellow"] = {"ffdd45", "ffff85"},
}

local modules_map = {
    ["speed"] = {"blue", true},
    ["effectivity"] = {"green", true},
    ["productivity"] = {"red", true},
    ["pollution-create"] = {"brown"},
    ["pollution-clean"] = {"pine"},
    ["raw-speed"] = {"cyan"},
    ["green"] = {"yellow"},
    ["raw-productivity"] = {"pink"},
}

for class, map in pairs(modules_map) do
    inputs = {
        directory = reskins.bobs.directory,
        mod = "bobs",
        type = "module",
    }

    -- Setup input defaults
    reskins.lib.parse_inputs(inputs)

    -- Parse map
    local color = map[1]
    local is_exception = map[2]

    -- Do all tiers
    for tier = 1, 8 do
        -- Naming convention exception handling
        if tier == 1 and is_exception then
            name = class.."-module"
        else
            name = class.."-module-"..tier
        end

        -- Fetch entity
        local entity = data.raw[inputs.type][name]

        -- Check if entity exists, if not, skip this iteration
        if not entity then goto continue end

        -- Setup icon path
        inputs.icon_filename = inputs.directory.."/graphics/icons/modules/module/"..color.."/"..color.."_"..tier..".png"

        reskins.lib.construct_icon(name, 0, inputs)

        -- Set beacon art style
        -- entity.art_style = "artisan-reskin"

        -- Overwrite beacon_tint property
        entity.beacon_tint = {
            primary = util.color(color_map[color][1]),
            secondary = util.color(color_map[color][2])
        }

        -- Label to skip to next iteration
        ::continue::
    end    
end