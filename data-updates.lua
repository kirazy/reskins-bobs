----------------------------------------------------------------------------------------------------
-- ENTITIES
----------------------------------------------------------------------------------------------------
-- Bob's Assembly
require("prototypes.entity.assembly-updates")

-- Bob's Greenhouse
require("prototypes.entity.greenhouse.greenhouse") -- Nauvis Day tries to operate on Bob's Greenhouse in data-updates, need to execute after

-- Bob's Power
require("prototypes.entity.power.nuclear-reactor") -- Bob reskins in data-updates

-- Bob's Ores
require("prototypes.entity.ores.ores-updates")

----------------------------------------------------------------------------------------------------
-- ITEMS
----------------------------------------------------------------------------------------------------
require("prototypes.item.electronics.circuits") -- Bob has circuit coloring in data-updates
require("prototypes.item.plates.battery") -- Bob has some battery updates in data-updates
require("prototypes.item.plates-updates")

----------------------------------------------------------------------------------------------------
-- TECHNOLOGIES
----------------------------------------------------------------------------------------------------
require("prototypes.technology.electronics-updates")
require("prototypes.technology.power-updates")
require("prototypes.technology.revamp-updates") -- Bob does tech updates in data-updates
require("prototypes.technology.technology-updates") -- Bob does tech updates in data-updates
require("prototypes.technology.warfare-updates") -- Bob does tech updates in data-updates

----------------------------------------------------------------------------------------------------
-- GUI Modifications
----------------------------------------------------------------------------------------------------
-- FIXME: This is a temporary disablement of the item group icons, until new ones are created.
-- https://github.com/kirazy/reskins-bobs/issues/100
-- require("prototypes.item-group.item-group")
