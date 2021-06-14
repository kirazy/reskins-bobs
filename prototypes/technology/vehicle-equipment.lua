-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.vehicle_equipment.technologies) then return end

-- Setup inputs
local inputs = {
    mod = "bobs",
    group = "vehicle-equipment",
    type = "technology",
    technology_icon_extras = {reskins.lib.technology_equipment_overlay{is_vehicle = true, scale = 1}},
    technology_icon_size = 256,
    technology_icon_mipmaps = 4,
}

local technologies = {
    -- Plasma cannons
    -- ["vehicle-big-turret-equipment-1"] = {tier = 0},
    -- ["vehicle-big-turret-equipment-2"] = {tier = 1},
    -- ["vehicle-big-turret-equipment-3"] = {tier = 2},
    -- ["vehicle-big-turret-equipment-4"] = {tier = 3},
    -- ["vehicle-big-turret-equipment-5"] = {tier = 4},
    -- ["vehicle-big-turret-equipment-6"] = {tier = 5},

    -- Roboport modular equipment
    ["vehicle-roboport-modular-equipment-1"] = {group = "equipment", icon_name = "modular-equipment", tier = 1, prog_tier = 2},
    ["vehicle-roboport-modular-equipment-2"] = {group = "equipment", icon_name = "modular-equipment", tier = 2, prog_tier = 3},
    ["vehicle-roboport-modular-equipment-3"] = {group = "equipment", icon_name = "modular-equipment", tier = 3, prog_tier = 4},
    ["vehicle-roboport-modular-equipment-4"] = {group = "equipment", icon_name = "modular-equipment", tier = 4, prog_tier = 5},

    -- Fusion cells
    ["vehicle-fusion-cell-equipment-1"] = {icon_name = "vehicle-fusion-cell", tier = 0},
    ["vehicle-fusion-cell-equipment-2"] = {icon_name = "vehicle-fusion-cell", tier = 1},
    ["vehicle-fusion-cell-equipment-3"] = {icon_name = "vehicle-fusion-cell", tier = 2},
    ["vehicle-fusion-cell-equipment-4"] = {icon_name = "vehicle-fusion-cell", tier = 3},
    ["vehicle-fusion-cell-equipment-5"] = {icon_name = "vehicle-fusion-cell", tier = 4},
    ["vehicle-fusion-cell-equipment-6"] = {icon_name = "vehicle-fusion-cell", tier = 5},
}

reskins.lib.create_icons_from_list(technologies, inputs)