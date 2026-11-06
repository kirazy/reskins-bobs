-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

local nuclear_reactors = require("prototypes.functions.nuclear-reactors")

if not mods["bobpower"] then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local NuclearPower = require("__reskins-assets-api__.assets.base.technologies.nuclear-power")
local SteamEngine = require("__reskins-assets-api__.assets.bobs.technologies.steam-engine")

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Bob technology burner phase
	["bob-steam-engine-1"] = {
		composition = SteamEngine.get_icon_composition({ tint = _framework.tiers.get_tint(1) }),
	},
}

-- Nuclear reactors
if _framework.settings.get_value("bobmods-power-nuclear") then
	-- The technology of each reactor shows the fuel, material, and color of the reactor it unlocks.
	local technologies = {
		["nuclear-power"] = "nuclear-reactor",
		["bob-nuclear-power-2"] = "bob-nuclear-reactor-2",
		["bob-nuclear-power-3"] = "bob-nuclear-reactor-3",
	}

	for name, reactor_name in pairs(technologies) do
		local reactor = nuclear_reactors[reactor_name]

		definitions[name] = {
			composition = NuclearPower.get_fuel_icon_composition({
				fuel = reactor.fuel,
				material = reactor.material,
				tint = reactor.tint,
			}),
		}
	end
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
