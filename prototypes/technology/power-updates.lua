-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.power.technologies) then return end

-- Setup standard inputs
local inputs = {
    mod = "bobs",
    group = "power",
    type = "technology",
}

local technologies = {
    ["bob-steam-engine-1"] = {tier = 1, icon_name = "steam-engine"},
}

reskins.lib.create_icons_from_list(technologies, inputs)