-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.warfare.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Armor = require("__reskins-assets-api__.assets.bobs.technologies.armor")
local ArtilleryWagons = require("__reskins-assets-api__.assets.bobs.technologies.artillery-wagons")
local Drone = require("__reskins-assets-api__.assets.bobs.technologies.drone")
local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")
local Spidertron = require("__reskins-assets-api__.assets.bobs.technologies.spidertron")
local Tank = require("__reskins-assets-api__.assets.base.technologies.tank")
local TurretArtillery = require("__reskins-assets-api__.assets.base.technologies.turret-artillery")
local TurretGun = require("__reskins-assets-api__.assets.base.technologies.turret-gun")
local TurretLaser = require("__reskins-assets-api__.assets.base.technologies.turret-laser")
local TurretPlasma = require("__reskins-assets-api__.assets.bobs.technologies.turret-plasma")
local TurretSniper = require("__reskins-assets-api__.assets.bobs.technologies.turret-sniper")

-- The icon of each technology is created by its module, in the tint of its tier or in its own `tint`.
local technologies = {
	-- Gun turrets
	["gun-turret"] = { module = TurretGun, tier = 1 }, -- t1 gun, technically part of revamp
	["bob-turrets-2"] = { module = TurretGun, tier = 2 }, -- t2 turret
	["bob-turrets-3"] = { module = TurretGun, tier = 3 }, -- t3 turret
	["bob-turrets-4"] = { module = TurretGun, tier = 4 }, -- t4 turret
	["bob-turrets-5"] = { module = TurretGun, tier = 5 }, -- t5 turret

	-- Sniper turrets
	["bob-sniper-turrets-1"] = { module = TurretSniper, tier = 1, prog_tier = 1 }, -- t1 sniper
	["bob-sniper-turrets-2"] = { module = TurretSniper, tier = 2, prog_tier = 3 }, -- t3 sniper
	["bob-sniper-turrets-3"] = { module = TurretSniper, tier = 3, prog_tier = 5 }, -- t5 sniper

	-- Laser turrets
	["laser-turret"] = { module = TurretLaser, tier = 1 }, -- t1 laser
	["bob-laser-turrets-2"] = { module = TurretLaser, tier = 2 }, -- t2 laser
	["bob-laser-turrets-3"] = { module = TurretLaser, tier = 3 }, -- t3 laser
	["bob-laser-turrets-4"] = { module = TurretLaser, tier = 4 }, -- t4 laser
	["bob-laser-turrets-5"] = { module = TurretLaser, tier = 5 }, -- t5 laser

	-- Plasma turrets
	["bob-plasma-turrets-1"] = { module = TurretPlasma, tier = 1, prog_tier = 3 }, -- t1 plasma
	["bob-plasma-turrets-2"] = { module = TurretPlasma, tier = 2, prog_tier = 4 },
	["bob-plasma-turrets-3"] = { module = TurretPlasma, tier = 3, prog_tier = 5 },
	["bob-plasma-turrets-4"] = { module = TurretPlasma, tier = 4, prog_tier = 6 },

	-- Artillery and artillery wagons
	["artillery"] = { module = TurretArtillery, tier = 1, prog_tier = 3 }, -- t3 arty/train arty
	["bob-artillery-turret-2"] = { module = TurretArtillery, tier = 2, prog_tier = 4 }, -- t4 arty
	["bob-artillery-turret-3"] = { module = TurretArtillery, tier = 3, prog_tier = 5 }, -- t5 arty
	["bob-artillery-wagon-2"] = { module = ArtilleryWagons, tier = 2, prog_tier = 4 }, -- t4 train arty
	["bob-artillery-wagon-3"] = { module = ArtilleryWagons, tier = 3, prog_tier = 5 }, -- t5 train arty

	-- Military progression
	-- ["military"] = {},
	-- ["military-3"] = {}, -- poison/slowdown capsules, auto shotty, napalm, sniper
	-- ["military-4"] = {}, -- piercing shotgun shells, cluster grenade

	-- Tanks
	["tank"] = { module = Tank, tier = 1, prog_tier = 3 }, -- t2 tank
	["bob-tanks-2"] = { module = Tank, tier = 2, prog_tier = 4 }, -- t4 tank
	["bob-tanks-3"] = { module = Tank, tier = 3, prog_tier = 5 },

	-- Tank robots
	["bob-robot-gun-drones"] = { module = Drone, tint = util.color("#f2f230") },
	["bob-robot-laser-drones"] = { module = Drone, tint = util.color("#30f271") },
	["bob-robot-flamethrower-drones"] = { module = Drone, tint = util.color("#f25730") },
	["bob-robot-plasma-drones"] = { module = Drone, tint = util.color("#30a5f2") },
}

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Armor
	-- ["heavy-armor"] = {}, -- probably fine? Depends how armor is handled
	-- ["bob-armor-making-3"] = { subgroup = "armor", flat_icon = true }, -- invar cobalt-steel armor (heavy-armor-2)
	-- ["bob-armor-making-4"] = { subgroup = "armor", flat_icon = true }, -- titanium-ceramic armor
	-- ["power-armor"] = {}, -- power armor first entry
	-- ["power-armor-mk2"] = {}, -- 2nd power armor
	["bob-power-armor-3"] = { composition = Armor.get_power_armor_3_icon_composition() },
	["bob-power-armor-4"] = { composition = Armor.get_power_armor_4_icon_composition() },
	["bob-power-armor-5"] = { composition = Armor.get_power_armor_5_icon_composition() },

	-- Robots
	["bob-laser-robot"] = { composition = Icons.get_laser_robot_icon_composition() },

	-- Spidertrons
	["bob-walking-vehicle"] = { composition = Spidertron.get_walking_vehicle_icon_composition() }, -- "Antron"
	["bob-tankotron"] = { composition = Spidertron.get_tankotron_icon_composition() }, -- "Tankotron"
	["bob-logistic-spidertron"] = { composition = Spidertron.get_logistic_spidertron_icon_composition() }, -- "Logitron"
	-- ["spidertron"] = {}, -- "Spidertron"
	["bob-heavy-spidertron"] = { composition = Spidertron.get_heavy_spidertron_icon_composition() }, -- "Heavy spidertron"
}

for name, options in pairs(technologies) do
	local tint = options.tint or _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition({ tint = tint }) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
