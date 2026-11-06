-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobvehicleequipment"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	icons = require("__reskins-assets-api__.api.icons"),
}

local EquipmentBattery2 = require("__reskins-assets-api__.assets.base.technologies.equipment-battery-2")
local EquipmentFissionReactor = require("__reskins-assets-api__.assets.bobs.technologies.equipment-fission-reactor")
local EquipmentLaserDefense = require("__reskins-assets-api__.assets.base.technologies.equipment-laser-defense")
local EquipmentModular = require("__reskins-assets-api__.assets.bobs.technologies.equipment-modular")
local EquipmentPersonalRoboport1 =
	require("__reskins-assets-api__.assets.base.technologies.equipment-personal-roboport-1")
local EquipmentPersonalRoboport2 =
	require("__reskins-assets-api__.assets.base.technologies.equipment-personal-roboport-2")
local EquipmentSolarPanel = require("__reskins-assets-api__.assets.base.technologies.equipment-solar-panel")
local EquipmentVehicleEnergyShield =
	require("__reskins-assets-api__.assets.bobs.technologies.equipment-vehicle-energy-shield")
local EquipmentVehicleFissionCell =
	require("__reskins-assets-api__.assets.bobs.technologies.equipment-vehicle-fission-cell")
local EquipmentVehiclePlasmaTurret =
	require("__reskins-assets-api__.assets.bobs.technologies.equipment-vehicle-plasma-turret")
local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")

-- The `params` of a technology are passed to the creator of its icon, with the tint of its tier.
local technologies = {
	-- Plasma cannons
	["bob-vehicle-big-turret-equipment-1"] = { module = EquipmentVehiclePlasmaTurret, tier = 1, prog_tier = 3 },
	["bob-vehicle-big-turret-equipment-2"] = { module = EquipmentVehiclePlasmaTurret, tier = 2, prog_tier = 4 },
	["bob-vehicle-big-turret-equipment-3"] = { module = EquipmentVehiclePlasmaTurret, tier = 3, prog_tier = 5 },
	["bob-vehicle-big-turret-equipment-4"] = { module = EquipmentVehiclePlasmaTurret, tier = 4, prog_tier = 6 },

	-- Roboport modular equipment
	["bob-vehicle-roboport-modular-equipment-1"] = {
		module = EquipmentModular,
		params = { tier = 1 },
		tier = 1,
		prog_tier = 2,
	},
	["bob-vehicle-roboport-modular-equipment-2"] = {
		module = EquipmentModular,
		params = { tier = 2 },
		tier = 2,
		prog_tier = 3,
	},
	["bob-vehicle-roboport-modular-equipment-3"] = {
		module = EquipmentModular,
		params = { tier = 3 },
		tier = 3,
		prog_tier = 4,
	},
	["bob-vehicle-roboport-modular-equipment-4"] = {
		module = EquipmentModular,
		params = { tier = 4 },
		tier = 4,
		prog_tier = 5,
	},

	-- Fusion cells
	["bob-vehicle-fission-cell-equipment-1"] = { module = EquipmentVehicleFissionCell, tier = 1 },
	["bob-vehicle-fission-cell-equipment-2"] = { module = EquipmentVehicleFissionCell, tier = 2 },
	["bob-vehicle-fission-cell-equipment-3"] = { module = EquipmentVehicleFissionCell, tier = 3 },
	["bob-vehicle-fission-cell-equipment-4"] = { module = EquipmentVehicleFissionCell, tier = 4 },
	["bob-vehicle-fission-cell-equipment-5"] = { module = EquipmentVehicleFissionCell, tier = 5 },
	["bob-vehicle-fission-cell-equipment-6"] = { module = EquipmentVehicleFissionCell, tier = 6 },

	-- Solar panels
	["bob-vehicle-solar-panel-equipment-1"] = { module = EquipmentSolarPanel, tier = 1, prog_tier = 2 },
	["bob-vehicle-solar-panel-equipment-2"] = { module = EquipmentSolarPanel, tier = 2, prog_tier = 3 },
	["bob-vehicle-solar-panel-equipment-3"] = { module = EquipmentSolarPanel, tier = 3, prog_tier = 4 },
	["bob-vehicle-solar-panel-equipment-4"] = { module = EquipmentSolarPanel, tier = 4, prog_tier = 5 },
	["bob-vehicle-solar-panel-equipment-5"] = { module = EquipmentSolarPanel, tier = 5, prog_tier = 6 },

	-- Batteries
	["bob-vehicle-battery-equipment-1"] = { module = EquipmentBattery2, tier = 1 },
	["bob-vehicle-battery-equipment-2"] = { module = EquipmentBattery2, tier = 2 },
	["bob-vehicle-battery-equipment-3"] = { module = EquipmentBattery2, tier = 3 },
	["bob-vehicle-battery-equipment-4"] = { module = EquipmentBattery2, tier = 4 },
	["bob-vehicle-battery-equipment-5"] = { module = EquipmentBattery2, tier = 5 },
	["bob-vehicle-battery-equipment-6"] = { module = EquipmentBattery2, tier = 6 },

	-- Laser defense
	["bob-vehicle-laser-defense-equipment-1"] = { module = EquipmentLaserDefense, tier = 1 },
	["bob-vehicle-laser-defense-equipment-2"] = { module = EquipmentLaserDefense, tier = 2 },
	["bob-vehicle-laser-defense-equipment-3"] = { module = EquipmentLaserDefense, tier = 3 },
	["bob-vehicle-laser-defense-equipment-4"] = { module = EquipmentLaserDefense, tier = 4 },
	["bob-vehicle-laser-defense-equipment-5"] = { module = EquipmentLaserDefense, tier = 5 },
	["bob-vehicle-laser-defense-equipment-6"] = { module = EquipmentLaserDefense, tier = 6 },

	-- Fusion reactors
	["bob-vehicle-fission-reactor-equipment-1"] = { module = EquipmentFissionReactor, tier = 1 },
	["bob-vehicle-fission-reactor-equipment-2"] = { module = EquipmentFissionReactor, tier = 2 },
	["bob-vehicle-fission-reactor-equipment-3"] = { module = EquipmentFissionReactor, tier = 3 },
	["bob-vehicle-fission-reactor-equipment-4"] = { module = EquipmentFissionReactor, tier = 4 },
	["bob-vehicle-fission-reactor-equipment-5"] = { module = EquipmentFissionReactor, tier = 5 },
	["bob-vehicle-fission-reactor-equipment-6"] = { module = EquipmentFissionReactor, tier = 6 },

	-- Energy Shields
	["bob-vehicle-shield-equipment-1"] = { module = EquipmentVehicleEnergyShield, tier = 1 },
	["bob-vehicle-shield-equipment-2"] = { module = EquipmentVehicleEnergyShield, tier = 2 },
	["bob-vehicle-shield-equipment-3"] = { module = EquipmentVehicleEnergyShield, tier = 3 },
	["bob-vehicle-shield-equipment-4"] = { module = EquipmentVehicleEnergyShield, tier = 4 },
	["bob-vehicle-shield-equipment-5"] = { module = EquipmentVehicleEnergyShield, tier = 5 },
	["bob-vehicle-shield-equipment-6"] = { module = EquipmentVehicleEnergyShield, tier = 6 },

	-- Roboports
	["bob-vehicle-roboport-equipment-1"] = { module = EquipmentPersonalRoboport1, tier = 1, prog_tier = 2 },
	["bob-vehicle-roboport-equipment-2"] = { module = EquipmentPersonalRoboport1, tier = 2, prog_tier = 3 },
	["bob-vehicle-roboport-equipment-3"] = { module = EquipmentPersonalRoboport2, tier = 3, prog_tier = 4 },
	["bob-vehicle-roboport-equipment-4"] = { module = EquipmentPersonalRoboport2, tier = 4, prog_tier = 5 },
}

-- Mobility
local flat_technologies = {
	["bob-vehicle-motor-equipment"] = Icons.get_vehicle_motor_equipment_icon_composition,
	["bob-vehicle-engine-equipment"] = Icons.get_vehicle_engine_equipment_icon_composition,
	["bob-vehicle-belt-immunity-equipment"] = Icons.get_vehicle_belt_immunity_equipment_icon_composition,
}

---@type table<string, TieredIconDefinition>
local definitions = {}

for name, options in pairs(technologies) do
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	local params = util.copy(options.params or {})
	params.tint = tint

	definitions[name] = {
		composition = options.module.get_icon_composition(params):add_symbol(
			_assets.icons.get_technology_equipment_overlay(_assets.defines.equipment_overlay.vehicle)
		),
	}
end

for name, get_icon_composition in pairs(flat_technologies) do
	definitions[name] = {
		composition = get_icon_composition():add_symbol(
			_assets.icons.get_technology_equipment_overlay(_assets.defines.equipment_overlay.vehicle)
		),
	}
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
