-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if mods["ScienceCostTweakerM"] then return end -- May not be needed, but labs?...
if not (reskins.bobs and reskins.bobs.triggers.technology.technologies) then return end

-- Setup standard inputs
local inputs = {
    mod = "bobs",
    group = "technology",
    type = "technology",
}

local technologies = {
    -- Steam power-related unlocks
    ["basic-automation"] = {group = "assembly", icon_name = "automation", tint = util.color("262626")},
    ["steam-automation"] = {group = "assembly", icon_name = "automation", tint = util.color("d9d9d9")},
    -- ["steam-power"] = {}, -- unlocks boiler/steam drill/inserter/pump, conditional on steam setting, currently a steam cloud
    -- ["electricity"] = {}, -- inserter/miner/radar/pole/fluid burner gen

    -- Labs
    -- ["lab"] = {}, -- lab 1
    -- ["advanced-research"] = {}, -- lab 2
    -- ["alien-research"] = {}, -- alien science packs, alien lab

    -- TECHNOLOGY EFFECTS
    ["bob-infinite-worker-robots-storage-1"] = {technology_icon_filename = "__base__/graphics/technology/worker-robots-storage.png", technology_icon_extras = {reskins.lib.return_technology_effect_icon("capacity")}, technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = true},
}

reskins.lib.create_icons_from_list(technologies, inputs)

-- Overwrite icons for technology effects
data.raw["utility-sprites"].default.worker_robot_storage_modifier_icon = util.merge{data.raw["utility-sprites"].default.worker_robot_storage_modifier_icon, {
    filename = "__base__/graphics/icons/logistic-robot.png",
    width = 64,
    height = 64,
    mipmap_count = 4,
}}

data.raw["utility-sprites"].default.worker_robot_speed_modifier_icon = util.merge{data.raw["utility-sprites"].default.worker_robot_speed_modifier_icon, {
    filename = "__base__/graphics/icons/logistic-robot.png",
    width = 64,
    height = 64,
    mipmap_count = 4,
}}

-- Set infer_icon properties for associated technologies
data.raw.technology["worker-robots-storage-1"].effects[1].infer_icon = false
data.raw.technology["worker-robots-storage-2"].effects[1].infer_icon = false
data.raw.technology["worker-robots-storage-3"].effects[1].infer_icon = false
data.raw.technology["bob-infinite-worker-robots-storage-1"].effects[1].infer_icon = false

-- TODO: Redesign this to be a function that scans through technology table for a whitelist of effects and then sets infer_icon for those effects
-- TODO: Move tech effect icon overwrites to its own function/file, along with the above