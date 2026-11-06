-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Assets.Base.Entities
---@using Reskins.Framework

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

---Defines the entry of a nuclear reactor.
---@class NuclearReactorEntry : PrototypeTierValue
---The material from which the reactor is built.
---@field material NuclearReactorMaterial
---The fuel the reactor burns.
---@field fuel NuclearReactorFuel
---The color of the reactor. It is the color of the fuel when the reactors are colored by their fuels, and the color of
---the tier for the reactor otherwise.
---@field tint Color

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

---The entry of each nuclear reactor, by the name of the reactor.
---@type table<string, NuclearReactorEntry>
local nuclear_reactors = {
	["nuclear-reactor"] = {
		tier = 1,
		prog_tier = 3,
		material = "aluminum-invar",
		fuel = "uranium",
		tint = {},
	},
	["bob-nuclear-reactor-2"] = {
		tier = 2,
		prog_tier = 4,
		material = "silver-titanium",
		fuel = has_fuel_per_tier and "thorium" or "uranium",
		tint = {},
	},
	["bob-nuclear-reactor-3"] = {
		tier = 3,
		prog_tier = 5,
		material = "gold-copper",
		fuel = has_fuel_per_tier and deuterium or "uranium",
		tint = {},
	},
}

for _, reactor in pairs(nuclear_reactors) do
	reactor.tint = color_by_fuel and util.copy(fuel_tints[reactor.fuel])
		or _framework.tiers.get_tint(_framework.tiers.get_tier(reactor))
end

return nuclear_reactors
