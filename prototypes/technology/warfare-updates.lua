-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobwarfare"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local ArtilleryShells = require("__reskins-assets-api__.assets.bobs.technologies.artillery-shells")
local BulletMagazines = require("__reskins-assets-api__.assets.bobs.technologies.bullet-magazines")
local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")
local LaserRifleAmmo = require("__reskins-assets-api__.assets.bobs.technologies.laser-rifle-ammo")
local Mines = require("__reskins-assets-api__.assets.bobs.technologies.mines")
local Radar = require("__reskins-assets-api__.assets.bobs.technologies.radar")
local Rocketry = require("__reskins-assets-api__.assets.bobs.technologies.rocketry")
local ShotgunShells = require("__reskins-assets-api__.assets.bobs.technologies.shotgun-shells")

-- The icon of each technology is created by its module, in the tint of its tier.
local technologies = {
	-- Radars
	["radar"] = { module = Radar, tier = 1 },
	["bob-radar-2"] = { module = Radar, tier = 2 },
	["bob-radar-3"] = { module = Radar, tier = 3 },
	["bob-radar-4"] = { module = Radar, tier = 4 },
	["bob-radar-5"] = { module = Radar, tier = 5 },
}

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Miscellaneous
	["bob-reinforced-wall"] = { composition = Icons.get_reinforced_wall_icon_composition() },
	["bob-laser-rifle"] = { composition = Icons.get_laser_rifle_icon_composition() },
	["bob-scatter-cannon-shells"] = { composition = Icons.get_scatter_cannon_shells_icon_composition() },
	["bob-cordite-processing"] = { composition = Icons.get_cordite_processing_icon_composition() },

	-- Laser rifle ammo
	["bob-laser-rifle-ammo-1"] = { composition = LaserRifleAmmo.get_laser_rifle_ammo_1_icon_composition() },
	["bob-laser-rifle-ammo-2"] = { composition = LaserRifleAmmo.get_laser_rifle_ammo_2_icon_composition() },
	["bob-laser-rifle-ammo-3"] = { composition = LaserRifleAmmo.get_laser_rifle_ammo_3_icon_composition() },
	["bob-laser-rifle-ammo-4"] = { composition = LaserRifleAmmo.get_laser_rifle_ammo_4_icon_composition() },
	["bob-laser-rifle-ammo-5"] = { composition = LaserRifleAmmo.get_laser_rifle_ammo_5_icon_composition() },
	["bob-laser-rifle-ammo-6"] = { composition = LaserRifleAmmo.get_laser_rifle_ammo_6_icon_composition() },

	-- Rocketry
	["rocketry"] = { composition = Rocketry.get_rocketry_icon_composition() },
	["bob-rocket"] = { composition = Rocketry.get_rocket_icon_composition() },
	["bob-piercing-rocket"] = { composition = Rocketry.get_piercing_rocket_icon_composition() },
	["bob-electric-rocket"] = { composition = Rocketry.get_electric_rocket_icon_composition() },
	["bob-acid-rocket"] = { composition = Rocketry.get_acid_rocket_icon_composition() },
	["bob-explosive-rocket"] = { composition = Rocketry.get_explosive_rocket_icon_composition() },
	["bob-poison-rocket"] = { composition = Rocketry.get_poison_rocket_icon_composition() },
	["bob-flame-rocket"] = { composition = Rocketry.get_flame_rocket_icon_composition() },
	["bob-plasma-rocket"] = { composition = Rocketry.get_plasma_rocket_icon_composition() },

	-- Artillery shells
	["bob-poison-artillery-shells"] = { composition = ArtilleryShells.get_poison_artillery_shells_icon_composition() },
	["bob-fire-artillery-shells"] = { composition = ArtilleryShells.get_fire_artillery_shells_icon_composition() },
	["bob-explosive-artillery-shells"] = {
		composition = ArtilleryShells.get_explosive_artillery_shells_icon_composition(),
	},
	["bob-distractor-artillery-shells"] = {
		composition = ArtilleryShells.get_distractor_artillery_shells_icon_composition(),
	},
	["bob-atomic-artillery-shell"] = { composition = ArtilleryShells.get_atomic_artillery_shell_icon_composition() },

	-- Mines
	["bob-poison-mine"] = { composition = Mines.get_poison_mine_icon_composition() },
	["bob-slowdown-mine"] = { composition = Mines.get_slowdown_mine_icon_composition() },
	["bob-distractor-mine"] = { composition = Mines.get_distractor_mine_icon_composition() },

	-- Shotgun shells
	["bob-shotgun-acid-shells"] = { composition = ShotgunShells.get_acid_shotgun_shells_icon_composition() },
	["bob-shotgun-ap-shells"] = { composition = ShotgunShells.get_ap_shotgun_shells_icon_composition() },
	["bob-shotgun-electric-shells"] = { composition = ShotgunShells.get_electric_shotgun_shells_icon_composition() },
	["bob-shotgun-flame-shells"] = { composition = ShotgunShells.get_flame_shotgun_shells_icon_composition() },
	["bob-shotgun-explosive-shells"] = { composition = ShotgunShells.get_explosive_shotgun_shells_icon_composition() },
	["bob-shotgun-plasma-shells"] = { composition = ShotgunShells.get_plasma_shotgun_shells_icon_composition() },
	["bob-shotgun-poison-shells"] = { composition = ShotgunShells.get_poison_shotgun_shells_icon_composition() },
	["bob-shotgun-shells"] = { composition = ShotgunShells.get_shotgun_shells_icon_composition() },

	-- Bullet magazines
	["bob-acid-bullets"] = { composition = BulletMagazines.get_acid_bullet_magazines_icon_composition() },
	["bob-ap-bullets"] = { composition = BulletMagazines.get_ap_bullet_magazines_icon_composition() },
	["bob-bullets"] = { composition = BulletMagazines.get_bullet_magazines_icon_composition() },
	["bob-electric-bullets"] = { composition = BulletMagazines.get_electric_bullet_magazines_icon_composition() },
	["bob-flame-bullets"] = { composition = BulletMagazines.get_flame_bullet_magazines_icon_composition() },
	["bob-he-bullets"] = { composition = BulletMagazines.get_he_bullet_magazines_icon_composition() },
	["bob-plasma-bullets"] = { composition = BulletMagazines.get_plasma_bullet_magazines_icon_composition() },
	["bob-poison-bullets"] = { composition = BulletMagazines.get_poison_bullet_magazines_icon_composition() },
	["uranium-ammo"] = { composition = BulletMagazines.get_uranium_ammo_icon_composition() },
}

for name, options in pairs(technologies) do
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition({ tint = tint }) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
