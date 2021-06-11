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
}

reskins.lib.create_icons_from_list(technologies, inputs)