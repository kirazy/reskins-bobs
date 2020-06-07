-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobgreenhouse"] then return end
if settings.startup["reskins-bobs-do-bobgreenhouse"].value == false then return end

-- bob-greenhouse