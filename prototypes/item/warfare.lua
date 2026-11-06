-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.warfare.items) then
	return
end

local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	sprites = require("__reskins-assets-api__.api.sprites"),
}
local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Armor = require("__reskins-assets-api__.assets.bobs.items.armor")
local ArtilleryShells = require("__reskins-assets-api__.assets.bobs.items.artillery-shells")
local BulletMagazines = require("__reskins-assets-api__.assets.bobs.items.bullet-magazines")
local BulletProjectiles = require("__reskins-assets-api__.assets.bobs.items.bullet-projectiles")
local Bullets = require("__reskins-assets-api__.assets.bobs.items.bullets")
local Capsules = require("__reskins-assets-api__.assets.bobs.items.capsules")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")
local LaserRifleBatteries = require("__reskins-assets-api__.assets.bobs.items.laser-rifle-batteries")
local RobotToolCombat = require("__reskins-assets-api__.assets.bobs.items.robot-tool-combat")
local RocketWarheads = require("__reskins-assets-api__.assets.bobs.items.rocket-warheads")
local Rockets = require("__reskins-assets-api__.assets.bobs.items.rockets")
local Shot = require("__reskins-assets-api__.assets.bobs.items.shot")
local ShotgunShells = require("__reskins-assets-api__.assets.bobs.items.shotgun-shells")

local light = _assets.defines.light

local plasma_tint = util.color("#1280b2")
local uranium_tint = util.color("#12b222")

---Gets the definition of the given `composition`.
---@param composition IconComposition The icon.
---@return TieredIconDefinition
local function icon(composition)
	return { composition = composition }
end

---Gets the definition of the given `composition`, with the light of the given `light_name` in its pictures.
---@param composition IconComposition The icon.
---@param light_name Light The light.
---@param tint? Color The tint of the light.
---@return TieredIconDefinition
local function lit(composition, light_name, tint)
	return { composition = composition:add_light(_assets.sprites.get_sprite_light_layer(light_name, tint)) }
end

---Gets the definition of the combat robot tool in the tint of the tier given by `options`, with the tier label of that
---tier.
---@param options PrototypeTierValue The tier of the robot tool.
---@return TieredIconDefinition
local function robot_tool_combat(options)
	local tier = _framework.tiers.get_tier(options)

	return {
		composition = RobotToolCombat.get_icon_composition({ tint = _framework.tiers.get_tint(tier) }),
		tier = tier,
	}
end

---Gets the definition of the icon from the base game with the given `name`.
---@param name string The name of the file in `__base__/graphics/icons`, without its extension.
---@return TieredIconDefinition
local function base_icon(name)
	return { icon_datum = { icon = "__base__/graphics/icons/" .. name .. ".png", icon_size = 64 } }
end

---@type table<string, TieredIconDefinition>
local items = {
	-- Robot tools
	["bob-robot-tool-combat"] = robot_tool_combat({ tier = 1, prog_tier = 2 }),
	["bob-robot-tool-combat-2"] = robot_tool_combat({ tier = 2, prog_tier = 3 }),
	["bob-robot-tool-combat-3"] = robot_tool_combat({ tier = 3, prog_tier = 4 }),
	["bob-robot-tool-combat-4"] = robot_tool_combat({ tier = 4, prog_tier = 5 }),

	-- Bullets
	["bob-bullet"] = icon(Bullets.get_bullet_icon_composition()),
	["bob-acid-bullet"] = icon(Bullets.get_acid_bullet_icon_composition()),
	["bob-ap-bullet"] = icon(Bullets.get_ap_bullet_icon_composition()),
	["bob-electric-bullet"] = lit(Bullets.get_electric_bullet_icon_composition(), light.electric_bullet),
	["bob-flame-bullet"] = icon(Bullets.get_flame_bullet_icon_composition()),
	["bob-he-bullet"] = icon(Bullets.get_he_bullet_icon_composition()),
	["bob-plasma-bullet"] = lit(Bullets.get_plasma_bullet_icon_composition(), light.aura_bullet, plasma_tint),
	["bob-poison-bullet"] = icon(Bullets.get_poison_bullet_icon_composition()),
	["bob-uranium-bullet"] = lit(Bullets.get_uranium_bullet_icon_composition(), light.aura_bullet, uranium_tint),

	-- Projectiles
	["bob-bullet-projectile"] = icon(BulletProjectiles.get_bullet_projectile_icon_composition()),
	["bob-acid-bullet-projectile"] = icon(BulletProjectiles.get_acid_bullet_projectile_icon_composition()),
	["bob-ap-bullet-projectile"] = icon(BulletProjectiles.get_ap_bullet_projectile_icon_composition()),
	["bob-electric-bullet-projectile"] = lit(
		BulletProjectiles.get_electric_bullet_projectile_icon_composition(),
		light.electric_projectile
	),
	["bob-flame-bullet-projectile"] = icon(BulletProjectiles.get_flame_bullet_projectile_icon_composition()),
	["bob-he-bullet-projectile"] = icon(BulletProjectiles.get_he_bullet_projectile_icon_composition()),
	["bob-plasma-bullet-projectile"] = lit(
		BulletProjectiles.get_plasma_bullet_projectile_icon_composition(),
		light.aura_projectile,
		plasma_tint
	),
	["bob-poison-bullet-projectile"] = icon(BulletProjectiles.get_poison_bullet_projectile_icon_composition()),
	["bob-uranium-bullet-projectile"] = lit(
		BulletProjectiles.get_uranium_bullet_projectile_icon_composition(),
		light.aura_projectile,
		uranium_tint
	),

	-- Warheads
	["bob-rocket-warhead"] = icon(RocketWarheads.get_rocket_warhead_icon_composition()),
	["bob-acid-rocket-warhead"] = icon(RocketWarheads.get_acid_rocket_warhead_icon_composition()),
	["bob-piercing-rocket-warhead"] = icon(RocketWarheads.get_piercing_rocket_warhead_icon_composition()),
	["bob-electric-rocket-warhead"] = lit(
		RocketWarheads.get_electric_rocket_warhead_icon_composition(),
		light.electric_warhead
	),
	["bob-explosive-rocket-warhead"] = icon(RocketWarheads.get_explosive_rocket_warhead_icon_composition()),
	["bob-flame-rocket-warhead"] = icon(RocketWarheads.get_flame_rocket_warhead_icon_composition()),
	["bob-plasma-rocket-warhead"] = lit(
		RocketWarheads.get_plasma_rocket_warhead_icon_composition(),
		light.aura_warhead,
		plasma_tint
	),
	["bob-poison-rocket-warhead"] = icon(RocketWarheads.get_poison_rocket_warhead_icon_composition()),

	-- Components
	["bob-laser-rifle-battery-case"] = icon(Icons.get_laser_rifle_battery_case_icon_composition()),
	["bob-bullet-casing"] = icon(Icons.get_bullet_casing_icon_composition()),
	["bob-magazine"] = icon(BulletMagazines.get_blank_magazine_icon_composition()),
	["bob-cordite"] = icon(Icons.get_cordite_icon_composition()),
	["bob-rocket-engine"] = icon(Icons.get_rocket_engine_icon_composition()),
	-- ["rocket-body"] = {subgroup = "components"},
	["bob-petroleum-jelly"] = icon(Icons.get_petroleum_jelly_icon_composition()),
	["bob-shot"] = icon(Shot.get_icon_composition()),
	["bob-shotgun-shell-casing"] = icon(Icons.get_shotgun_shell_casing_icon_composition()),

	-- Weapons
	["bob-spidertron-cannon"] = icon(Icons.get_spidertron_cannon_icon_composition()),

	-- Robots
	["bob-defender-robot"] = base_icon("defender"),
	["bob-distractor-robot"] = base_icon("distractor"),
	["bob-destroyer-robot"] = base_icon("destroyer"),
	["bob-laser-robot"] = icon(Icons.get_laser_robot_icon_composition()),

	-- Drone tank
	["bob-robot-drone-frame"] = icon(Icons.get_robot_drone_frame_icon_composition()),
	["bob-robot-drone-frame-large"] = icon(Icons.get_robot_drone_frame_large_icon_composition()),

	-- Mech parts
	["bob-mech-armor-plate"] = icon(Icons.get_mech_armor_plate_icon_composition()),
	-- TODO: https://github.com/kirazy/reskins-bobs/issues/32 Model and render out robot/mech brains
	-- ["mech-brain"] = {type = "item", subgroup = "mech-parts"},
	["bob-mech-frame"] = icon(Icons.get_mech_frame_icon_composition()),
	["bob-mech-foot"] = icon(Icons.get_mech_foot_icon_composition()),
	["bob-mech-hip"] = icon(Icons.get_mech_hip_icon_composition()),
	["bob-mech-knee"] = icon(Icons.get_mech_knee_icon_composition()),
	["bob-mech-leg"] = icon(Icons.get_mech_leg_icon_composition()),
	["bob-mech-leg-segment"] = icon(Icons.get_mech_leg_segment_icon_composition()),
}

---@type table<string, TieredIconDefinition>
local ammo = {
	-- Magazines
	["bob-bullet-magazine"] = icon(BulletMagazines.get_bullet_magazine_icon_composition()),
	["bob-acid-bullet-magazine"] = icon(BulletMagazines.get_acid_bullet_magazine_icon_composition()),
	["bob-ap-bullet-magazine"] = icon(BulletMagazines.get_ap_bullet_magazine_icon_composition()),
	["bob-electric-bullet-magazine"] = icon(BulletMagazines.get_electric_bullet_magazine_icon_composition()),
	["bob-flame-bullet-magazine"] = icon(BulletMagazines.get_flame_bullet_magazine_icon_composition()),
	["bob-he-bullet-magazine"] = icon(BulletMagazines.get_he_bullet_magazine_icon_composition()),
	["bob-plasma-bullet-magazine"] = lit(
		BulletMagazines.get_plasma_bullet_magazine_icon_composition(),
		light.rounds_magazine
	),
	["bob-poison-bullet-magazine"] = icon(BulletMagazines.get_poison_bullet_magazine_icon_composition()),
	["uranium-rounds-magazine"] = lit(
		BulletMagazines.get_uranium_rounds_magazine_icon_composition(),
		light.rounds_magazine
	),

	-- Rockets
	["bob-rocket"] = icon(Rockets.get_rocket_icon_composition()),
	["bob-acid-rocket"] = icon(Rockets.get_acid_rocket_icon_composition()),
	["bob-piercing-rocket"] = icon(Rockets.get_piercing_rocket_icon_composition()),
	["bob-electric-rocket"] = lit(Rockets.get_electric_rocket_icon_composition(), light.electric_rocket),
	["bob-flame-rocket"] = icon(Rockets.get_flame_rocket_icon_composition()),
	["bob-explosive-rocket"] = icon(Rockets.get_explosive_rocket_icon_composition()),
	["bob-plasma-rocket"] = lit(Rockets.get_plasma_rocket_icon_composition(), light.aura_rocket, plasma_tint),
	["bob-poison-rocket"] = icon(Rockets.get_poison_rocket_icon_composition()),

	-- Shotgun Shells
	["bob-better-shotgun-shell"] = icon(ShotgunShells.get_better_shotgun_shell_icon_composition()),
	["bob-shotgun-acid-shell"] = icon(ShotgunShells.get_shotgun_acid_shell_icon_composition()),
	["bob-shotgun-ap-shell"] = icon(ShotgunShells.get_shotgun_ap_shell_icon_composition()),
	["bob-shotgun-electric-shell"] = lit(
		ShotgunShells.get_shotgun_electric_shell_icon_composition(),
		light.electric_shotgun_shell
	),
	["bob-shotgun-explosive-shell"] = icon(ShotgunShells.get_shotgun_explosive_shell_icon_composition()),
	["bob-shotgun-flame-shell"] = icon(ShotgunShells.get_shotgun_flame_shell_icon_composition()),
	["bob-shotgun-plasma-shell"] = lit(
		ShotgunShells.get_shotgun_plasma_shell_icon_composition(),
		light.aura_shotgun_shell,
		plasma_tint
	),
	["bob-shotgun-poison-shell"] = icon(ShotgunShells.get_shotgun_poison_shell_icon_composition()),
	["bob-shotgun-uranium-shell"] = lit(
		ShotgunShells.get_shotgun_uranium_shell_icon_composition(),
		light.aura_shotgun_shell,
		uranium_tint
	),

	-- Laser rifle batteries
	["bob-laser-rifle-battery"] = lit(
		LaserRifleBatteries.get_laser_rifle_battery_icon_composition(),
		light.laser_rifle_battery,
		util.color("#b3b3b3")
	),
	["bob-laser-rifle-battery-ruby"] = lit(
		LaserRifleBatteries.get_laser_rifle_battery_ruby_icon_composition(),
		light.laser_rifle_battery,
		util.color("#fa1928")
	),
	["bob-laser-rifle-battery-sapphire"] = lit(
		LaserRifleBatteries.get_laser_rifle_battery_sapphire_icon_composition(),
		light.laser_rifle_battery,
		util.color("#0033ff")
	),
	["bob-laser-rifle-battery-emerald"] = lit(
		LaserRifleBatteries.get_laser_rifle_battery_emerald_icon_composition(),
		light.laser_rifle_battery,
		util.color("#13e35c")
	),
	["bob-laser-rifle-battery-amethyst"] = lit(
		LaserRifleBatteries.get_laser_rifle_battery_amethyst_icon_composition(),
		light.laser_rifle_battery,
		util.color("#d414ff")
	),
	["bob-laser-rifle-battery-topaz"] = lit(
		LaserRifleBatteries.get_laser_rifle_battery_topaz_icon_composition(),
		light.laser_rifle_battery,
		util.color("#f0b414")
	),
	["bob-laser-rifle-battery-diamond"] = lit(
		LaserRifleBatteries.get_laser_rifle_battery_diamond_icon_composition(),
		light.laser_rifle_battery,
		util.color("#ffffff")
	),

	-- Artillery shells
	["bob-atomic-artillery-shell"] = lit(
		ArtilleryShells.get_atomic_artillery_shell_icon_composition(),
		light.atomic_artillery_shell,
		uranium_tint
	),
	["bob-distractor-artillery-shell"] = icon(ArtilleryShells.get_distractor_artillery_shell_icon_composition()),
	["bob-explosive-artillery-shell"] = icon(ArtilleryShells.get_explosive_artillery_shell_icon_composition()),
	["bob-fire-artillery-shell"] = icon(ArtilleryShells.get_fire_artillery_shell_icon_composition()),
	["bob-poison-artillery-shell"] = icon(ArtilleryShells.get_poison_artillery_shell_icon_composition()),

	-- Cannon shells
	["bob-scatter-cannon-shell"] = icon(Icons.get_scatter_cannon_shell_icon_composition()),
}

---@type table<string, TieredIconDefinition>
local guns = {
	-- Weapons
	["bob-laser-rifle"] = icon(Icons.get_laser_rifle_icon_composition()),
	["bob-rifle"] = icon(Icons.get_rifle_icon_composition()),
	["bob-sniper-rifle"] = icon(Icons.get_sniper_rifle_icon_composition()),
	["bob-spidertron-gatling-gun"] = icon(Icons.get_spidertron_gatling_gun_icon_composition()),
	["bob-spidertron-cannon-1"] = icon(Icons.get_spidertron_cannon_icon_composition()),
	["bob-spidertron-cannon-2"] = icon(Icons.get_spidertron_cannon_icon_composition()),
}

---@type table<string, TieredIconDefinition>
local armor = {
	-- Armor
	-- ["heavy-armor-2"] = { type = "armor", subgroup = "armor" },
	-- ["heavy-armor-3"] = { type = "armor", subgroup = "armor" },
	["bob-power-armor-mk3"] = icon(Armor.get_power_armor_mk3_icon_composition()),
	["bob-power-armor-mk4"] = icon(Armor.get_power_armor_mk4_icon_composition()),
	["bob-power-armor-mk5"] = icon(Armor.get_power_armor_mk5_icon_composition()),
}

---@type table<string, TieredIconDefinition>
local capsules = {
	-- Capsules
	["bob-fire-capsule"] = icon(Capsules.get_fire_capsule_icon_composition()),
	["defender-capsule"] = icon(Capsules.get_defender_capsule_icon_composition()),
	["distractor-capsule"] = icon(Capsules.get_distractor_capsule_icon_composition()),
	["destroyer-capsule"] = icon(Capsules.get_destroyer_capsule_icon_composition()),
	["bob-laser-robot-capsule"] = icon(Capsules.get_laser_robot_capsule_icon_composition()),
}

_framework.tiers.assign_icons_with_tier_labels("item", items)
_framework.tiers.assign_icons_with_tier_labels("ammo", ammo)
_framework.tiers.assign_icons_with_tier_labels("gun", guns)
_framework.tiers.assign_icons_with_tier_labels("armor", armor)
_framework.tiers.assign_icons_with_tier_labels("capsule", capsules)
