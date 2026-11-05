-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.electronics.items) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Fluids = require("__reskins-assets-api__.assets.bobs.items.fluids")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")
local Plates = require("__reskins-assets-api__.assets.bobs.items.plates")
local Wires = require("__reskins-assets-api__.assets.bobs.items.wires")

---@type table<string, TieredIconDefinition>
local items = {
	-- Wires
	["bob-gilded-copper-cable"] = { composition = Wires.get_icon_composition({ material = "gilded-copper" }) },
	["bob-tinned-copper-cable"] = { composition = Wires.get_icon_composition({ material = "tinned-copper" }) },
	["bob-insulated-cable"] = { composition = Wires.get_icon_composition({ material = "insulated" }) },

	-- Intermediates
	["bob-solder"] = { composition = Icons.get_solder_icon_composition() },
}

-- Items and recipes shared with other mods within Bob's suite
if not mods["bobplates"] then
	-- Intermediates
	items["bob-solder-alloy"] = { composition = Plates.get_alloy_icon_composition({ alloy = "solder" }) }
	items["bob-rubber"] = { composition = Icons.get_rubber_icon_composition() }
	items["bob-resin"] = { composition = Icons.get_resin_icon_composition() }
	items["bob-silicon-wafer"] = { composition = Icons.get_silicon_wafer_icon_composition() }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

if not mods["bobplates"] then
	_framework.tiers.assign_icons_with_tier_labels("fluid", {
		["bob-ferric-chloride-solution"] = { composition = Fluids.get_ferric_chloride_solution_icon_composition() },
	})

	-- Recipes
	_framework.tiers.assign_icons_with_tier_labels("recipe", {
		["bob-coal-cracking"] = { composition = Icons.get_coal_cracking_icon_composition() },
		["bob-synthetic-wood"] = { composition = Icons.get_synthetic_wood_icon_composition() },
		["bob-resin-wood"] = { composition = Icons.get_resin_wood_icon_composition() },
		["bob-resin-oil"] = { composition = Icons.get_resin_oil_icon_composition() },
	})
end
