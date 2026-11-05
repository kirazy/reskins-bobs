-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

local nuclear_reactors = require("prototypes.functions.nuclear-reactors")

if not (reskins.bobs and reskins.bobs.triggers.power.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

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
if reskins.bobs.triggers.power.nuclear then
	-- The technology of each reactor shows its fuel and material, in the color of its fuel or of its tier.
	local technologies = {
		["nuclear-power"] = {
			reactor = "nuclear-reactor",
			material = "aluminum-invar",
			tier = 1,
			prog_tier = 3,
		},
		["bob-nuclear-power-2"] = {
			reactor = "bob-nuclear-reactor-2",
			material = "silver-titanium",
			tier = 2,
			prog_tier = 4,
		},
		["bob-nuclear-power-3"] = {
			reactor = "bob-nuclear-reactor-3",
			material = "gold-copper",
			tier = 3,
			prog_tier = 5,
		},
	}

	for name, options in pairs(technologies) do
		local reactor = nuclear_reactors[options.reactor]

		definitions[name] = {
			composition = NuclearPower.get_fuel_icon_composition({
				fuel = reactor.fuel,
				material = options.material,
				tint = reactor.tint or _framework.tiers.get_tint(_framework.tiers.get_tier(options)),
			}),
		}
	end
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)
