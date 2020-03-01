-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Core functions
require("prototypes.functions")

-- Make mod directory available
reskins.bobs_structures = {directory = "__reskin-series-bobs-structures__"}

-- Entities

-- Bob's Power
require("prototypes.entity.big-electric-pole")
require("prototypes.entity.boiler")
require("prototypes.entity.heat-pipe")
require("prototypes.entity.medium-electric-pole")
require("prototypes.entity.solar-panel")
require("prototypes.entity.steam-engine")
require("prototypes.entity.steam-turbine")
require("prototypes.entity.substation")

-- Bob's Logistics
require("prototypes.entity.storage-tank-all-corners")
require("prototypes.entity.storage-tank")

-- Bob's Warfare
require("prototypes.entity.gun-turret")

-- Mining Drill Animation Test
-- data.raw["mining-drill"]["electric-mining-drill"]["animations"]["east"] = 
-- {
--     priority = "high",
--     filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E.png",
--     line_length = 8,
--     width = 105,
--     height = 98,
--     frame_count = 32,
--     animation_speed = 0.5,
--     direction_count = 1,
--     shift = util.by_pixel(3.5, -1),
--     run_mode = "forward-then-backward",
--     hr_version =
--     {
--         priority = "high",
--         filename = reskins.bobs_structures.directory.."/graphics/entity/electric-mining-drill/test/large-miner-test.png",
--         line_length = 8,
--         width = 211,
--         height = 197,
--         frame_count = 32,
--         animation_speed = 0.5,
--         direction_count = 1,
--         shift = util.by_pixel(3.75, -1.25),
--         run_mode = "forward-then-backward",
--         scale = 0.5
--     }
-- }