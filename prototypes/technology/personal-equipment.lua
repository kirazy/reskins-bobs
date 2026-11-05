-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not (reskins.bobs and reskins.bobs.triggers.equipment.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	icons = require("__reskins-assets-api__.api.icons"),
}

local EquipmentBattery = require("__reskins-assets-api__.assets.base.technologies.equipment-battery-1")
local EquipmentEnergyShield = require("__reskins-assets-api__.assets.base.technologies.equipment-energy-shield")
local EquipmentExoskeleton = require("__reskins-assets-api__.assets.base.technologies.equipment-exoskeleton")
local EquipmentFissionReactor = require("__reskins-assets-api__.assets.bobs.technologies.equipment-fission-reactor")
local EquipmentLaserDefense = require("__reskins-assets-api__.assets.base.technologies.equipment-laser-defense")
local EquipmentModular = require("__reskins-assets-api__.assets.bobs.technologies.equipment-modular")
local EquipmentNightVision = require("__reskins-assets-api__.assets.base.technologies.equipment-night-vision")
local EquipmentPersonalRoboport1 =
	require("__reskins-assets-api__.assets.base.technologies.equipment-personal-roboport-1")
local EquipmentPersonalRoboport2 =
	require("__reskins-assets-api__.assets.base.technologies.equipment-personal-roboport-2")
local EquipmentSolarPanel = require("__reskins-assets-api__.assets.base.technologies.equipment-solar-panel")

-- The `params` of a technology are passed to the creator of its icon, with the tint of its tier.
local technologies = {
	-- Roboport modular equipment
	["bob-personal-roboport-modular-equipment-1"] = {
		module = EquipmentModular,
		params = { tier = 1 },
		tier = 1,
		prog_tier = 2,
	},
	["bob-personal-roboport-modular-equipment-2"] = {
		module = EquipmentModular,
		params = { tier = 2 },
		tier = 2,
		prog_tier = 3,
	},
	["bob-personal-roboport-modular-equipment-3"] = {
		module = EquipmentModular,
		params = { tier = 3 },
		tier = 3,
		prog_tier = 4,
	},
	["bob-personal-roboport-modular-equipment-4"] = {
		module = EquipmentModular,
		params = { tier = 4 },
		tier = 4,
		prog_tier = 5,
	},

	-- Solar panels
	["solar-panel-equipment"] = { module = EquipmentSolarPanel, tier = 1, prog_tier = 2 },
	["bob-solar-panel-equipment-2"] = { module = EquipmentSolarPanel, tier = 2, prog_tier = 3 },
	["bob-solar-panel-equipment-3"] = { module = EquipmentSolarPanel, tier = 3, prog_tier = 4 },
	["bob-solar-panel-equipment-4"] = { module = EquipmentSolarPanel, tier = 4, prog_tier = 5 },

	-- Batteries
	["battery-equipment"] = { module = EquipmentBattery, tier = 1 },
	["battery-mk2-equipment"] = { module = EquipmentBattery, tier = 2 },
	["battery-mk3-equipment"] = { module = EquipmentBattery, tier = 3 },
	["bob-battery-equipment-4"] = { module = EquipmentBattery, tier = 4 },
	["bob-battery-equipment-5"] = { module = EquipmentBattery, tier = 5 },

	-- Shields
	["energy-shield-equipment"] = { module = EquipmentEnergyShield, tier = 1 },
	["energy-shield-mk2-equipment"] = { module = EquipmentEnergyShield, tier = 2 },
	["bob-energy-shield-equipment-3"] = { module = EquipmentEnergyShield, tier = 3 },
	["bob-energy-shield-equipment-4"] = { module = EquipmentEnergyShield, tier = 4 },
	["bob-energy-shield-equipment-5"] = { module = EquipmentEnergyShield, tier = 5 },
	["bob-energy-shield-equipment-6"] = { module = EquipmentEnergyShield, tier = 6 },

	-- Laser defense
	["personal-laser-defense-equipment"] = { module = EquipmentLaserDefense, tier = 1 },
	["bob-personal-laser-defense-equipment-2"] = { module = EquipmentLaserDefense, tier = 2 },
	["bob-personal-laser-defense-equipment-3"] = { module = EquipmentLaserDefense, tier = 3 },
	["bob-personal-laser-defense-equipment-4"] = { module = EquipmentLaserDefense, tier = 4 },
	["bob-personal-laser-defense-equipment-5"] = { module = EquipmentLaserDefense, tier = 5 },
	["bob-personal-laser-defense-equipment-6"] = { module = EquipmentLaserDefense, tier = 6 },

	-- Fission reactors
	["fission-reactor-equipment"] = { module = EquipmentFissionReactor, tier = 1, prog_tier = 3 },
	["bob-fission-reactor-equipment-2"] = { module = EquipmentFissionReactor, tier = 2, prog_tier = 4 },
	["bob-fission-reactor-equipment-3"] = { module = EquipmentFissionReactor, tier = 3, prog_tier = 5 },
	["bob-fission-reactor-equipment-4"] = { module = EquipmentFissionReactor, tier = 4, prog_tier = 6 },

	-- Night vision
	["night-vision-equipment"] = { module = EquipmentNightVision, tier = 1, prog_tier = 2 },
	["bob-night-vision-equipment-2"] = { module = EquipmentNightVision, tier = 2, prog_tier = 3 },
	["bob-night-vision-equipment-3"] = { module = EquipmentNightVision, tier = 3, prog_tier = 5 },

	-- Exoskeleton
	["exoskeleton-equipment"] = { module = EquipmentExoskeleton, tier = 1, prog_tier = 2 },
	["bob-exoskeleton-equipment-2"] = { module = EquipmentExoskeleton, tier = 2, prog_tier = 3 },
	["bob-exoskeleton-equipment-3"] = { module = EquipmentExoskeleton, tier = 3, prog_tier = 5 },

	-- Roboports
	["personal-roboport-equipment"] = { module = EquipmentPersonalRoboport1, tier = 1, prog_tier = 2 },
	["personal-roboport-mk2-equipment"] = { module = EquipmentPersonalRoboport1, tier = 2, prog_tier = 3 },
	["bob-personal-roboport-mk3-equipment"] = { module = EquipmentPersonalRoboport2, tier = 3, prog_tier = 4 },
	["bob-personal-roboport-mk4-equipment"] = { module = EquipmentPersonalRoboport2, tier = 4, prog_tier = 5 },
}

---@type table<string, TieredIconDefinition>
local definitions = {}

for name, options in pairs(technologies) do
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	local params = util.copy(options.params or {})
	params.tint = tint

	definitions[name] = {
		composition = options.module.get_icon_composition(params):add_symbol(
			_assets.icons.get_technology_equipment_overlay(_assets.defines.equipment_overlay.personal)
		),
	}
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
