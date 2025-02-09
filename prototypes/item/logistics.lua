-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.logistics.items) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "bobs",
    group = "logistics",
}

---@type CreateIconsFromListTable
local items = {
    -- Repair packs
    ["repair-pack"] = { tier = 1, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true },
    ["repair-pack-2"] = { tier = 2, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true },
    ["repair-pack-3"] = { tier = 3, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true },
    ["repair-pack-4"] = { tier = 4, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true },
    ["repair-pack-5"] = { tier = 5, icon_name = "repair-pack", type = "repair-tool", make_entity_pictures = true },

    -- Roboport parts
    ["roboport-chargepad-1"] = { tier = 1, prog_tier = 2, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-1" },
    ["roboport-chargepad-2"] = { tier = 2, prog_tier = 3, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-2" },
    ["roboport-chargepad-3"] = { tier = 3, prog_tier = 4, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-3" },
    ["roboport-chargepad-4"] = { tier = 4, prog_tier = 5, icon_name = "roboport-chargepad", icon_base = "roboport-chargepad-4" },

    ["roboport-antenna-1"] = { subgroup = "roboport-antenna", flat_icon = true, make_icon_pictures = false },
    ["roboport-antenna-2"] = { subgroup = "roboport-antenna", flat_icon = true, make_icon_pictures = false },
    ["roboport-antenna-3"] = { subgroup = "roboport-antenna", flat_icon = true, make_icon_pictures = false },
    ["roboport-antenna-4"] = { subgroup = "roboport-antenna", flat_icon = true, make_icon_pictures = false },

    ["roboport-door-1"] = { subgroup = "roboport-door", flat_icon = true, make_icon_pictures = false },
    ["roboport-door-2"] = { subgroup = "roboport-door", flat_icon = true, make_icon_pictures = false },
    ["roboport-door-3"] = { subgroup = "roboport-door", flat_icon = true, make_icon_pictures = false },
    ["roboport-door-4"] = { subgroup = "roboport-door", flat_icon = true, make_icon_pictures = false },

    -- Robot tools and parts
    ["flying-robot-frame"] = { tier = 1, prog_tier = 2, icon_name = "flying-robot-frame" },
    ["flying-robot-frame-2"] = { tier = 2, prog_tier = 3, icon_name = "flying-robot-frame" },
    ["flying-robot-frame-3"] = { tier = 3, prog_tier = 4, icon_name = "flying-robot-frame" },
    ["flying-robot-frame-4"] = { tier = 4, prog_tier = 5, icon_name = "flying-robot-frame" },

    ["bob-robot-tool"] = { tier = 1, prog_tier = 2, icon_name = "robot-tool" },
    ["bob-robot-tool-2"] = { tier = 2, prog_tier = 3, icon_name = "robot-tool" },
    ["bob-robot-tool-3"] = { tier = 3, prog_tier = 4, icon_name = "robot-tool" },
    ["bob-robot-tool-4"] = { tier = 4, prog_tier = 5, icon_name = "robot-tool" },
}

-- Disable select items based on Bob's settings
if (reskins.lib.settings.get_value("bobmods-logistics-flyingrobotframes") == false or reskins.lib.settings.get_value("bobmods-logistics-robotparts") == false) then
    items["flying-robot-frame"] = nil
end

reskins.internal.create_icons_from_list(items, inputs)
