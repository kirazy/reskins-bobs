-- Copyright (c) 2023 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then return end
if reskins.lib.setting("bobmods-logistics-trains") == false then return end

-- Set input parameters
local inputs = {
    type = "locomotive",
    icon_name = "locomotive",
    base_entity_name = "locomotive",
    mod = "bobs",
    group = "logistics",
    particles = { ["medium"] = 2 },
}

local tier_map = {
    ["locomotive"] = { 1, 2 },
    ["bob-locomotive-2"] = { 2, 3 },
    ["bob-locomotive-3"] = { 3, 4 },
    ["bob-armoured-locomotive"] = { 1, 4 },
    ["bob-armoured-locomotive-2"] = { 2, 5 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Parse map
    local tier = map[1]
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map[2]
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index[tier]

    -- Setup icon details
    if string.find(name, "armoured") then
        inputs.icon_extras = {
            {
                icon = reskins.bobs.directory .. "/graphics/icons/logistics/locomotive/armored-train-symbol.png"
            },
            {
                icon = reskins.bobs.directory .. "/graphics/icons/logistics/locomotive/armored-train-symbol.png",
                tint = reskins.lib.adjust_alpha(reskins.lib.tint_index[tier], 0.75)
            }
        }
    else
        inputs.icon_extras = nil
    end

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- TODO: Reskin remnants?

    -- TODO: Reskin entity?

    -- Label to skip to next iteration
    ::continue::
end
