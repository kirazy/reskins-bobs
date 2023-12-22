-- Copyright (c) 2023 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if reskins.lib.setting("cp-override-modules") == false then --[[ Do nothing ]]
elseif mods["CircuitProcessing"] then
    return
end
if not (reskins.bobs and reskins.bobs.triggers.modules.items) then return end

-- Modules
local modules_map = {
    ["speed"] = { "blue", true },
    ["effectivity"] = { "yellow", true },
    ["productivity"] = { "red", true },
    ["pollution-create"] = { "brown" },
    ["pollution-clean"] = { "pine" },
    ["raw-speed"] = { "cyan" },
    ["green"] = { "green" },
    ["raw-productivity"] = { "pink" },
}

local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    type = "module",
    make_icon_pictures = false,
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

for class, map in pairs(modules_map) do
    -- Parse map
    local color = map[1]
    local is_exception = map[2]

    -- Do all tiers
    for tier = 1, 8 do
        -- Naming convention exception handling
        local name = class .. "-module-" .. tier
        if tier == 1 and is_exception then
            name = class .. "-module"
        end

        -- Fetch entity
        local entity = data.raw[inputs.type][name]

        -- Check if entity exists, if not, skip this iteration
        if not entity then goto continue end

        -- Setup icon path
        inputs.icon_filename = reskins.bobs.directory .. "/graphics/icons/modules/module/" .. color .. "/" .. color .. "_" .. tier .. ".png"

        reskins.lib.construct_icon(name, 0, inputs)

        -- Set beacon art style
        entity.art_style = "artisan-reskin-8-lights"

        -- Overwrite beacon_tint property
        entity.beacon_tint = reskins.bobs.module_color_map[color]

        -- Label to skip to next iteration
        ::continue::
    end
end

-- Reskin God module entities
if reskins.lib.setting("bobmods-modules-enablegodmodules") then
    if not data.raw.module["god-module-6"] then
        for i = 1, 5 do
            -- Fetch entity
            local name = "god-module-" .. i
            local entity = data.raw[inputs.type][name]

            -- Check if entity exists, if not, skip this iteration
            if not entity then goto continue end

            -- Setup icon path
            inputs.icon_filename = reskins.bobs.directory .. "/graphics/icons/modules/god-module/" .. name .. ".png"
            inputs.icon_layers = 1

            reskins.lib.construct_icon(name, 0, inputs)

            -- Set beacon art style
            entity.art_style = "artisan-reskin-5-lights"

            -- Overwrite beacon_tint property
            entity.beacon_tint = reskins.bobs.module_color_map["gray"]

            -- Label to skip to next iteration
            ::continue::
        end
    end
end

-- Intermediates, courtesy of Maxi (mxcop).
-- https://github.com/mxcop/maxi-reskins/tree/main

local intermediate_inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "modules",
    make_icon_pictures = false,
    flat_icon = true,
}

-- Setup input defaults
reskins.lib.parse_inputs(intermediate_inputs)

-- Host for item icon instructions.
local items = {
    ["module-contact"] = { subgroup = "intermediates" },
    ["module-processor-board"] = { subgroup = "intermediates" },
    ["module-processor-board-2"] = { subgroup = "intermediates" },
    ["module-processor-board-3"] = { subgroup = "intermediates" },
}

local tools = {
    ["module-case"] = { subgroup = "intermediates" },
    ["module-circuit-board"] = { subgroup = "intermediates" },
}

local intermediates_map = {
    ["speed"] = { color = "blue" },
    ["effectivity"] = { color = "yellow" },
    ["productivity"] = { color = "red" },
    ["pollution-create"] = { color = "brown" },
    ["pollution-clean"] = { color = "green" },
}

for name, map in pairs(intermediates_map) do
    tools[name .. "-processor"] = { subgroup = "intermediates/" .. map.color, image = map.color .. "-processor" }
    items[name .. "-processor-2"] = { subgroup = "intermediates/" .. map.color, image = map.color .. "-processor-2" }
    items[name .. "-processor-3"] = { subgroup = "intermediates/" .. map.color, image = map.color .. "-processor-3" }
end

reskins.lib.create_icons_from_list(items, intermediate_inputs)

tool_inputs = util.copy(intermediate_inputs)
tool_inputs.type = "tool"
reskins.lib.create_icons_from_list(tools, tool_inputs)

test = "stop"