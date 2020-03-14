-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-fluidgenerator"].value == false then return end
if settings.startup["reskins-bobs-do-bobpower"].value == false then return end 

-- fluid-generator
-- fluid-generator-2
-- fluid-generator-3
-- hydrazine-generator -- This is a revamp product and contingent on a few things