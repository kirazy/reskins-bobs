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
    ["vehicle-roboport-modular-equipment-1"] = {group = "equipment", icon_name = "modular-equipment", icon_base = "modular-equipment-1", tier = 1, prog_tier = 2},
    ["vehicle-roboport-modular-equipment-2"] = {group = "equipment", icon_name = "modular-equipment", icon_base = "modular-equipment-2", tier = 2, prog_tier = 3},
    ["vehicle-roboport-modular-equipment-3"] = {group = "equipment", icon_name = "modular-equipment", icon_base = "modular-equipment-3", tier = 3, prog_tier = 4},
    ["vehicle-roboport-modular-equipment-4"] = {group = "equipment", icon_name = "modular-equipment", icon_base = "modular-equipment-4", tier = 4, prog_tier = 5},

    -- Fusion cells
    ["vehicle-fusion-cell-equipment-1"] = {icon_name = "vehicle-fusion-cell", tier = 0},
    ["vehicle-fusion-cell-equipment-2"] = {icon_name = "vehicle-fusion-cell", tier = 1},
    ["vehicle-fusion-cell-equipment-3"] = {icon_name = "vehicle-fusion-cell", tier = 2},
    ["vehicle-fusion-cell-equipment-4"] = {icon_name = "vehicle-fusion-cell", tier = 3},
    ["vehicle-fusion-cell-equipment-5"] = {icon_name = "vehicle-fusion-cell", tier = 4},
    ["vehicle-fusion-cell-equipment-6"] = {icon_name = "vehicle-fusion-cell", tier = 5},

    -- Solar panels
    ["vehicle-solar-panel-equipment-1"] = {group = "equipment", icon_name = "solar-panel", tier = 0},
    ["vehicle-solar-panel-equipment-2"] = {group = "equipment", icon_name = "solar-panel", tier = 1},
    ["vehicle-solar-panel-equipment-3"] = {group = "equipment", icon_name = "solar-panel", tier = 2},
    ["vehicle-solar-panel-equipment-4"] = {group = "equipment", icon_name = "solar-panel", tier = 3},
    ["vehicle-solar-panel-equipment-5"] = {group = "equipment", icon_name = "solar-panel", tier = 4},
    ["vehicle-solar-panel-equipment-6"] = {group = "equipment", icon_name = "solar-panel", tier = 5},

    -- Batteries
    ["vehicle-battery-equipment-1"] = {icon_name = "vehicle-battery", tier = 0},
    ["vehicle-battery-equipment-2"] = {icon_name = "vehicle-battery", tier = 1},
    ["vehicle-battery-equipment-3"] = {icon_name = "vehicle-battery", tier = 2},
    ["vehicle-battery-equipment-4"] = {icon_name = "vehicle-battery", tier = 3},
    ["vehicle-battery-equipment-5"] = {icon_name = "vehicle-battery", tier = 4},
    ["vehicle-battery-equipment-6"] = {icon_name = "vehicle-battery", tier = 5},

    -- Laser defense
    ["vehicle-laser-defense-equipment-1"] = {group = "equipment", icon_name = "laser-defense", tier = 0},
    ["vehicle-laser-defense-equipment-2"] = {group = "equipment", icon_name = "laser-defense", tier = 1},
    ["vehicle-laser-defense-equipment-3"] = {group = "equipment", icon_name = "laser-defense", tier = 2},
    ["vehicle-laser-defense-equipment-4"] = {group = "equipment", icon_name = "laser-defense", tier = 3},
    ["vehicle-laser-defense-equipment-5"] = {group = "equipment", icon_name = "laser-defense", tier = 4},
    ["vehicle-laser-defense-equipment-6"] = {group = "equipment", icon_name = "laser-defense", tier = 5},
}

reskins.lib.create_icons_from_list(technologies, inputs)