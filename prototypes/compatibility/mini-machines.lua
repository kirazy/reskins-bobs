-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check for mini-machines
if not mods["mini-machines"] then return end

local function rescale_minimachines_icon(name, source_name, type, pattern, replacement)
    -- Initialize paths
    local destination = data.raw["item"][name]
    local source = data.raw["item"][source_name]

    -- Check to make sure this entity is valid
    if not destination then return end

    -- Transcribe icons and pictures
    local working_icons = table.deepcopy(source.icons)
    local working_pictures = table.deepcopy(source.pictures)

    -- Retarget image location
    for n = 1, #working_icons do
        working_icons[n].icon = string.gsub(working_icons[n].icon, "/"..pattern.."/", "/"..replacement.."/mini-")
    end

    for m = 1, #working_pictures.layers do
        working_pictures.layers[m].filename = string.gsub(working_pictures.layers[m].filename, "/"..pattern.."/", "/"..replacement.."/mini-")
    end

    -- Prepare for icon assignment
    local inputs = {
        type = type,
        icon_size = 64,
        icon_mipmaps = 4,
        icon = working_icons,
        icon_picture = working_pictures
    }

    -- Assign icons
    reskins.lib.assign_icons(name, inputs)
end

-- Electrolysers
local electrolysers = {
    ["mini-electro-1"] = "electrolyser",
    ["mini-electro-2"] = "electrolyser-2",
    ["mini-electro-3"] = "electrolyser-3",
    ["mini-electro-4"] = "electrolyser-4",
    ["mini-electro-5"] = "electrolyser-5",
}

for mini, origin in pairs(electrolysers) do
    rescale_minimachines_icon(mini, origin, "assembling-machine", "electrolyser", "electrolyser")
end

-- Assembling machines
local assemblers = {
    ["mini-assembler-1"] = "assembling-machine-1",
    ["mini-assembler-2"] = "assembling-machine-2",
    ["mini-assembler-3"] = "assembling-machine-3",
    ["mini-assembler-4"] = "assembling-machine-4",
    ["mini-assembler-5"] = "assembling-machine-5",
    ["mini-assembler-6"] = "assembling-machine-6",
}

for mini, origin in pairs(assemblers) do
    rescale_minimachines_icon(mini, origin, "assembling-machine", "assembling%-machine", "assembling-machine")
end

-- Chemical plants
local chemplants = {
    ["mini-chemplant-1"] = "chemical-plant",
    ["mini-chemplant-2"] = "chemical-plant-2",
    ["mini-chemplant-3"] = "chemical-plant-3",
    ["mini-chemplant-4"] = "chemical-plant-4",
}

for mini, origin in pairs(chemplants) do
    rescale_minimachines_icon(mini, origin, "assembling-machine", "chemical%-plant", "chemical-plant")
end