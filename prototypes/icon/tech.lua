-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobtech"] then return end

-- Science Packs
local science_packs = {
    ["automation-science-pack"] = {tier = 1, group = "tech", icon_name = "science-pack"},
    ["logistic-science-pack"] = {tier = 2, group = "tech", icon_name = "science-pack"},
    ["chemical-science-pack"] = {tier = 3, group = "tech", icon_name = "science-pack"},
    ["production-science-pack"] = {tier = 4, group = "tech", icon_name = "science-pack"},
    ["utility-science-pack"] = {tier = 5, group = "tech", icon_name = "science-pack"},
    ["advanced-logistic-science-pack"] = {tint = util.color("de00a3"), group = "tech", icon_name = "science-pack"},
}

-- Alien Science Packs