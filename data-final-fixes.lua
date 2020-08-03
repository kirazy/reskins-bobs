-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

----------------------------------------------------------------------------------------------------
-- TECHNOLOGIES
----------------------------------------------------------------------------------------------------
require("prototypes.technology.logistics")
require("prototypes.technology.power")

----------------------------------------------------------------------------------------------------
-- DEFERRED ASSIGNMENTS
----------------------------------------------------------------------------------------------------
-- Item Icons
if reskins.bobs.icons and reskins.bobs.icons["data-final-fixes"] then
    for name, inputs in pairs(reskins.bobs.icons["data-final-fixes"]) do
        reskins.lib.assign_icons(name, inputs)
    end
end

-- Technology Icons
if reskins.bobs.technology and reskins.bobs.technology["data-final-fixes"] then
    for name, inputs in pairs(reskins.bobs.technology["data-final-fixes"]) do
        reskins.lib.assign_technology_icons(name, inputs)
    end
end

----------------------------------------------------------------------------------------------------
-- COMPATIBILITY
----------------------------------------------------------------------------------------------------
require("prototypes.compatibility.mini-machines") -- This must be called after icons are handled
require("prototypes.compatibility.deadlock-crating") -- DeadlockCrating sets up machines in data-final-fixes