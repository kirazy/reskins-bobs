-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Core functions
require("prototypes.functions")

-- Make mod directory available
reskins.bobs_structures = {directory = "__reskin-series-bobs-structures__"}

-- Entities

-- Bob's Logistics
require("prototypes.entity.logistics.storage-tank-all-corners")
require("prototypes.entity.logistics.storage-tank")



-- Bob's Power
require("prototypes.entity.power.big-electric-pole")
require("prototypes.entity.power.boiler")
require("prototypes.entity.power.heat-pipe")
require("prototypes.entity.power.medium-electric-pole")
require("prototypes.entity.power.solar-panel")
require("prototypes.entity.power.steam-engine")
require("prototypes.entity.power.steam-turbine")
require("prototypes.entity.power.substation")

-- Bob's Warfare
require("prototypes.entity.warfare.gun-turret")