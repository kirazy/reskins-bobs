-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check for mini-machines
if not mods["mini-machines"] then return end

local function rescale_minimachine(table, type)
    -- Prepare a basic inputs table
    local inputs = {
        icon_size = 64,
        icon_mipmaps = 4,
        type = type,
    }

    -- Shrink the icon
    for name, source in pairs(table) do
        reskins.lib.shrink_icon(name, source, 0.85, inputs)
    end
end

-- Electrolysers
local electrolysers = {
    ["mini-electro-1"] = "electrolyser",
    ["mini-electro-2"] = "electrolyser-2",
    ["mini-electro-3"] = "electrolyser-3",
    ["mini-electro-4"] = "electrolyser-4",
    ["mini-electro-5"] = "electrolyser-5",
}

rescale_minimachine(electrolysers, "assembling-machine")

-- Assembling machines
local assemblers = {
    ["mini-assembler-1"] = "assembling-machine-1",
    ["mini-assembler-2"] = "assembling-machine-2",
    ["mini-assembler-3"] = "assembling-machine-3",
    ["mini-assembler-4"] = "assembling-machine-4",
    ["mini-assembler-5"] = "assembling-machine-5",
    ["mini-assembler-6"] = "assembling-machine-6",
}

rescale_minimachine(assemblers, "assembling-machine")

-- Chemical plants
local chemplants = {
    ["mini-chemplant-1"] = "chemical-plant",
    ["mini-chemplant-2"] = "chemical-plant-2",
    ["mini-chemplant-3"] = "chemical-plant-3",
    ["mini-chemplant-4"] = "chemical-plant-4",
}

rescale_minimachine(chemplants, "assembling-machine")

-- Mining drills
local miners = {
    ["mini-miner-1"] = "electric-mining-drill",
    ["mini-miner-2"] = "bob-mining-drill-1",
    ["mini-miner-3"] = "bob-mining-drill-2",
    ["mini-miner-4"] = "bob-mining-drill-3",
    ["mini-miner-5"] = "bob-mining-drill-4",
}

rescale_minimachine(miners, "mining-drill")

-- Radars
local radars = {
    ["mini-radar-1"] = "radar",
    ["mini-radar-2"] = "radar-2",
    ["mini-radar-3"] = "radar-3",
    ["mini-radar-4"] = "radar-4",
    ["mini-radar-5"] = "radar-5",
}

rescale_minimachine(radars, "radar")

-- Oil refineries
local refineries = {
    ["mini-refinery-1"] = "oil-refinery",
    ["mini-refinery-2"] = "oil-refinery-2",
    ["mini-refinery-3"] = "oil-refinery-3",
    ["mini-refinery-4"] = "oil-refinery-4",
}

rescale_minimachine(refineries, "assembling-machine")

-- Storage tanks
local storage_tanks = {
    ["mini-tank-1"] = "storage-tank",
    ["mini-tank-2"] = "storage-tank-2",
    ["mini-tank-3"] = "storage-tank-3",
    ["mini-tank-4"] = "storage-tank-4",
}

rescale_minimachine(storage_tanks, "storage-tank")