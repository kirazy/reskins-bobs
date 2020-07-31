-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobelectronics"] then return end

-- Setup inputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "electronics",
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

-- Wires
local wires_inputs = util.copy(inputs)

local wires = {
    "gilded-copper-cable",
    "tinned-copper-cable",
    "insulated-cable",
}

for _, name in pairs(wires) do
    -- Fetch item
    local item = data.raw.item[name]

    -- Check if item exists, if not, skip this iteration
    if not item then goto continue end

    wires_inputs.icon_filename = wires_inputs.directory.."/graphics/icons/electronics/wires/"..name..".png"

    reskins.lib.construct_icon(name, 0, wires_inputs)

    -- Label to skip to next iteration
    ::continue::
end