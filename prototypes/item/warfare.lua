-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobwarfare"] then return end
if reskins.lib.setting("reskins-bobs-do-bobwarfare") == false then return end

local item_list = {
    ["robot-tool-combat"] = {name_tier = 1, ingr_tier = 2, icon_name = "robot-tool-combat"},
    ["robot-tool-combat-2"] = {name_tier = 2, ingr_tier = 3, icon_name = "robot-tool-combat"},
    ["robot-tool-combat-3"] = {name_tier = 3, ingr_tier = 4, icon_name = "robot-tool-combat"},
    ["robot-tool-combat-4"] = {name_tier = 4, ingr_tier = 5, icon_name = "robot-tool-combat"},
}

for name, inputs in pairs(item_list) do
    -- Handle tier details
    local tier = inputs.name_tier or inputs.tier or 0
    if reskins.lib.setting("reskins-lib-tier-mapping") == "ingredients-map" then
        tier = inputs.ingr_tier or inputs.tier or 0
    end

    -- Handle defaults, tints
    inputs.tint = inputs.tint or reskins.lib.tint_index["tier-"..tier]
    inputs.directory = reskins.bobs.directory
    inputs.mod = "bobs"
    inputs.group = "warfare"

    -- Setup input defaults
    reskins.lib.parse_inputs(inputs)

    -- Reskin icons
    reskins.lib.construct_icon(name, tier, inputs)
end