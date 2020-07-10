-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobplates"] then return end

-- Battery
local battery_inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "plates",
    icon_name = "battery",
    tier_labels = false,
}

-- Setup input defaults
reskins.lib.parse_inputs(battery_inputs)

local batteries = {
    ["battery"] = {1, 2, "battery"},
    ["lithium-ion-battery"] = {2, 3, "battery-2"},
    ["silver-zinc-battery"] = {3, 4, "battery-3"},
}

for name, map in pairs(batteries) do
    -- Fetch item
    local item = data.raw.item[name]

    -- Check if item exists, if not, skip this iteration
    if not item then goto continue end

    -- Parse map
    local tier = map[1]
    if reskins.lib.setting("reskins-lib-tier-mapping") == "ingredient-map" then
        tier = map[2]
    end
    local technology = map[3]

    -- Determine what tint we're using
    battery_inputs.tint = reskins.lib.tint_index["tier-"..tier]

    reskins.lib.construct_icon(name, tier, battery_inputs)

    if data.raw.technology[technology] then
        reskins.lib.construct_technology_icon(technology, battery_inputs)
    end

    -- Label to skip to next iteration
    ::continue::
end