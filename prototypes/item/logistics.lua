-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if reskins.lib.setting("reskins-bobs-do-boblogistics") == false then return end

local item_list = {
    ["repair-pack"] = {tier = 1, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true},
    ["repair-pack-2"] = {tier = 2, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true},
    ["repair-pack-3"] = {tier = 3, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true},
    ["repair-pack-4"] = {tier = 4, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true},
    ["repair-pack-5"] = {tier = 5, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true},
    ["roboport-chargepad-1"] = {name_tier = 1, ingr_tier = 2, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-1"},
    ["roboport-chargepad-2"] = {name_tier = 2, ingr_tier = 3, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-2"},
    ["roboport-chargepad-3"] = {name_tier = 3, ingr_tier = 4, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-3"},
    ["roboport-chargepad-4"] = {name_tier = 4, ingr_tier = 5, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-4"},
    ["roboport-antenna-1"] = {icon_name = "roboport-antenna", icon_base = "roboport-antenna-1", icon_layers = 1},
    ["roboport-antenna-2"] = {icon_name = "roboport-antenna", icon_base = "roboport-antenna-2", icon_layers = 1},
    ["roboport-antenna-3"] = {icon_name = "roboport-antenna", icon_base = "roboport-antenna-3", icon_layers = 1},
    ["roboport-antenna-4"] = {icon_name = "roboport-antenna", icon_base = "roboport-antenna-4", icon_layers = 1},
    ["roboport-door-1"] = {icon_name = "roboport-door", icon_base = "roboport-door-1", icon_layers = 1},
    ["roboport-door-2"] = {icon_name = "roboport-door", icon_base = "roboport-door-2", icon_layers = 1},
    ["roboport-door-3"] = {icon_name = "roboport-door", icon_base = "roboport-door-3", icon_layers = 1},
    ["roboport-door-4"] = {icon_name = "roboport-door", icon_base = "roboport-door-4", icon_layers = 1},
    ["flying-robot-frame"] = {name_tier = 1, ingr_tier = 2, icon_name = "flying-robot-frame"},
    ["flying-robot-frame-2"] = {name_tier = 2, ingr_tier = 3, icon_name = "flying-robot-frame"},
    ["flying-robot-frame-3"] = {name_tier = 3, ingr_tier = 4, icon_name = "flying-robot-frame"},
    ["flying-robot-frame-4"] = {name_tier = 4, ingr_tier = 5, icon_name = "flying-robot-frame"},
    ["robot-tool-construction"] = {name_tier = 1, ingr_tier = 2, icon_name = "robot-tool-construction"},
    ["robot-tool-construction-2"] = {name_tier = 2, ingr_tier = 3, icon_name = "robot-tool-construction"},
    ["robot-tool-construction-3"] = {name_tier = 3, ingr_tier = 4, icon_name = "robot-tool-construction"},
    ["robot-tool-construction-4"] = {name_tier = 4, ingr_tier = 5, icon_name = "robot-tool-construction"},
    ["robot-tool-logistic"] = {name_tier = 1, ingr_tier = 2, icon_name = "robot-tool-logistic"},
    ["robot-tool-logistic-2"] = {name_tier = 2, ingr_tier = 3, icon_name = "robot-tool-logistic"},
    ["robot-tool-logistic-3"] = {name_tier = 3, ingr_tier = 4, icon_name = "robot-tool-logistic"},
    ["robot-tool-logistic-4"] = {name_tier = 4, ingr_tier = 5, icon_name = "robot-tool-logistic"},
}

-- Disable select items based on Bob's settings
if (reskins.lib.setting("bobmods-logistics-flyingrobotframes") == false or reskins.lib.setting("bobmods-logistics-robotparts") == false) then
    item_list["flying-robot-frame"] = nil
end

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
    inputs.group = "logistics"

    -- Setup input defaults
    reskins.lib.parse_inputs(inputs)

    -- Reskin icons
    reskins.lib.construct_icon(name, tier, inputs)
end