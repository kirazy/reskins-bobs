-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Assets.Base.Entities

local _framework = { settings = require("__reskins-framework__.api.settings") }

---Defines the fuel a nuclear reactor burns, and the color of that fuel.
---@class NuclearReactorFuelEntry
---The fuel the reactor burns.
---@field fuel NuclearReactorFuel
---The color of the fuel. When `nil`, the reactor is colored according to its tier.
---@field tint? Color

---@type table<NuclearReactorFuel, Color>
local fuel_tints = {
	["uranium"] = util.color("#3acc0b"),
	["thorium"] = util.color("#cca500"),
	["deuterium-blue"] = util.color("#008ed0"),
	["deuterium-pink"] = util.color("#d00049"),
}

-- Bob's Metals, Chemicals and Intermediates gives the tier 2 and 3 reactors their own fuels.
local has_fuel_per_tier = mods["bobplates"] ~= nil and _framework.settings.get_value("bobmods-power-nuclear") == true
local color_by_fuel = has_fuel_per_tier
	and _framework.settings.get_value("reskins-bobs-do-bobrevamp-reactor-color") == true

---@type NuclearReactorFuel
local deuterium = _framework.settings.get_value("bobmods-plates-bluedeuterium") == true and "deuterium-blue"
	or "deuterium-pink"

---@type table<string, NuclearReactorFuel>
local fuels = {
	["nuclear-reactor"] = "uranium",
	["bob-nuclear-reactor-2"] = has_fuel_per_tier and "thorium" or "uranium",
	["bob-nuclear-reactor-3"] = has_fuel_per_tier and deuterium or "uranium",
}

---The fuel entry of each nuclear reactor, by the name of the reactor.
---@type table<string, NuclearReactorFuelEntry>
local nuclear_reactors = {}
for name, fuel in pairs(fuels) do
	nuclear_reactors[name] = {
		fuel = fuel,
		tint = color_by_fuel and fuel_tints[fuel] or nil,
	}
end

return nuclear_reactors
