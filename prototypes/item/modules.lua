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
    ["speed"] = { color = "blue", has_no_number_at_tier_one = true },
    ["effectivity"] = { color = "yellow", has_no_number_at_tier_one = true },
    ["productivity"] = { color = "red", has_no_number_at_tier_one = true },
    ["pollution-create"] = { color = "brown" },
    ["pollution-clean"] = { color = "pine" },
    ["raw-speed"] = { color = "cyan" },
    ["green"] = { color = "green" },
    ["raw-productivity"] = { color = "pink" },
}

---@type SetupStandardEntityInputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    type = "module",
    make_icon_pictures = false,
}

reskins.lib.set_inputs_defaults(inputs)

for class, map in pairs(modules_map) do
    for tier = 1, 8 do
        local name = class .. "-module-" .. tier
        if tier == 1 and map.has_no_number_at_tier_one then
            name = class .. "-module"
        end

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
    if not data.raw.module["god-module-6"] then
        for i = 1, 5 do
            local name = "god-module-" .. i

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
