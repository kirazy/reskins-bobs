-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Compatibility with ShinyBobGFX
if mods["ShinyBobGFX"] then
    require("shiny-bob-compatibility")
end
----------------------------------------------------------------------------------------------------
-- ITEMS
----------------------------------------------------------------------------------------------------
-- require("prototypes.item.electronics.circuits") -- Bob has circuit coloring in data-updates
require("prototypes.item.plates.battery") -- Bob has some battery updates in data-updates

----------------------------------------------------------------------------------------------------
-- ENTITIES
----------------------------------------------------------------------------------------------------
-- Bob's Assembly
require("prototypes.entity.assembly.assembling-machine") -- Bob reskins in data-updates
require("prototypes.entity.assembly.chemical-plant") -- Bob reskins in data-updates

-- Bob's Power
require("prototypes.entity.power.nuclear-reactor") -- Bob reskins in data-updates

----------------------------------------------------------------------------------------------------
-- COMPATIBILITY
----------------------------------------------------------------------------------------------------
require("prototypes.compatibility.deadlock-stacking-beltboxes")