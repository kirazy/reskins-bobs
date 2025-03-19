-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if reskins.lib.settings.get_value("cp-override-modules") == false then
    -- Do nothing.
elseif mods["CircuitProcessing"] then
    return
end
if not (reskins.bobs and reskins.bobs.triggers.modules.items) then return end

local modules_map = {
    ["speed"] = { color = "blue" },
    ["efficiency"] = { color = "yellow" },
    ["productivity"] = { color = "red" },
    ["pollution-create"] = { color = "brown" },
    ["pollution-clean"] = { color = "pine" },
    ["green"] = { color = "green" },
}

---@type SetupStandardEntityInputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    type = "module",
    make_icon_pictures = false,
}

reskins.lib.set_inputs_defaults(inputs)

local function get_real_module_name(class, tier)
    -- Vanilla modules have no 'bob-' prefix
    local modules_name_map = {
        ["bob-productivity-module-1"] = "productivity-module",
        ["bob-productivity-module-2"] = "productivity-module-2",
        ["bob-productivity-module-3"] = "productivity-module-3",
        ["bob-efficiency-module-1"] = "efficiency-module",
        ["bob-efficiency-module-2"] = "efficiency-module-2",
        ["bob-efficiency-module-3"] = "efficiency-module-3",
        ["bob-speed-module-1"] = "speed-module",
        ["bob-speed-module-2"] = "speed-module-2",
        ["bob-speed-module-3"] = "speed-module-3",
    }

    local name = 'bob-' .. class .. "-module-" .. tier

    if modules_name_map[name] then
        name = modules_name_map[name]
    end

    return name
end

for class, map in pairs(modules_map) do
    for tier = 1, 5 do
        local name = get_real_module_name(class, tier)

        ---@type data.ModulePrototype
        local entity = data.raw[inputs.type][name]
        if not entity then goto continue end

        inputs.icon_filename = "__reskins-bobs__/graphics/icons/modules/module/" .. map.color .. "/" .. map.color .. "_" .. tier .. ".png"

        reskins.lib.construct_icon(name, 0, inputs)

        entity.art_style = "artisan-reskin-8-lights"
        entity.beacon_tint = reskins.bobs.module_color_map[map.color]

        ::continue::
    end
end

-- Reskin God module entities
if reskins.lib.settings.get_value("bobmods-modules-enablegodmodules") then
    local bob_god_modules = {
        "bob-god-module",
        -- "bob-god-module-productivity",
        -- "bob-god-module-quality",
    }
    for _, name in ipairs(bob_god_modules) do
        if data.raw.module[name] then
            ---@type data.ModulePrototype
            local entity = data.raw[inputs.type][name]
            if not entity then goto continue end

            inputs.icon_filename = "__reskins-bobs__/graphics/icons/modules/god-module/" .. name .. ".png"
            inputs.icon_layers = 1

            reskins.lib.construct_icon(name, 0, inputs)

            entity.art_style = "artisan-reskin-5-lights"
            entity.beacon_tint = reskins.bobs.module_color_map["gray"]

            ::continue::
        end
    end
end
