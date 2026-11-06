-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.plates.items) then
	return
end

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
}

local Fluids = require("__reskins-assets-api__.assets.bobs.items.fluids")
local Icons = require("__reskins-assets-api__.assets.bobs.items.icons")
local Plates = require("__reskins-assets-api__.assets.bobs.items.plates")

---
---Validates that a value is exists at the end of a path described by a series
---of keys in a given `root` table, and if so returns that value.
---
---Provides similar behavior to the null-conditional operator `?` in C#.
---
---Examples:
---```
---local leaf = get_value(root, "trunk", "branch", "twig", "leaf")
---```
---
---@param root table # The root table.
---@param ... string|integer # Keys that describe a path to a value in `root`.
---@return any # The value at the end of the path if it is exists; otherwise, `nil`.
local function get_value(root, ...)
	local current_obj = root

	for _, key in pairs({ ... }) do
		if type(current_obj) == "table" and current_obj[key] ~= nil then
			current_obj = current_obj[key]
		else
			return nil
		end
	end

	return current_obj
end

---
--- Evaluates the given `condition` and returns the appropriate value.
---
--- Note that both `if_true` and `if_false` are evaluated. Be cautious of
--- side effects.
---
---@param condition boolean # The condition to evaluate.
---@param if_true any # The value returned when `condition` is `true`.
---@param if_false any # The value returned when `condition` is `false`.
---@return any # When `condition == true`, returns `if_true`; otherwise, returns `if_false`.
local function ternary(condition, if_true, if_false)
	if condition then
		return if_true
	else
		return if_false
	end
end

---Gets the definition of the alloy for the given `alloy`.
---@param alloy string
---@return TieredIconDefinition
local function alloy(alloy)
	return { composition = Plates.get_alloy_icon_composition({ alloy = alloy }) }
end

---@type table<string, TieredIconDefinition>
local items = {
	-- Plates
	["bob-brass-alloy"] = alloy("brass"),
	["bob-bronze-alloy"] = alloy("bronze"),
	["bob-cobalt-steel-alloy"] = alloy("cobalt-steel"),
	["bob-gunmetal-alloy"] = alloy("gunmetal"),
	["bob-invar-alloy"] = alloy("invar"),
	["bob-nitinol-alloy"] = alloy("nitinol"),

	-- Powders
	["bob-alumina"] = ternary(
		get_value(angelsmods, "trigger", "smelting_products", "aluminium", "ingot"),
		nil,
		{ composition = Icons.get_alumina_icon_composition() }
	),
	["bob-cobalt-oxide"] = ternary(
		get_value(angelsmods, "trigger", "smelting_products", "cobalt", "ingot"),
		nil,
		{ composition = Icons.get_cobalt_oxide_icon_composition() }
	),
	["bob-tungsten-oxide"] = ternary(
		get_value(angelsmods, "trigger", "smelting_products", "tungsten", "powder"),
		nil,
		{ composition = Icons.get_tungsten_oxide_icon_composition() }
	),
	["bob-powdered-tungsten"] = ternary(
		get_value(angelsmods, "trigger", "smelting_products", "tungsten", "powder"),
		nil,
		{ composition = Icons.get_powdered_tungsten_icon_composition() }
	),
	["bob-lead-oxide"] = ternary(
		get_value(angelsmods, "trigger", "smelting_products", "lead", "ingot"),
		nil,
		{ composition = Icons.get_lead_oxide_icon_composition() }
	),
	["bob-silver-nitrate"] = ternary(
		get_value(angelsmods, "trigger", "smelting_products", "silver", "ingot"),
		nil,
		{ composition = Icons.get_silver_nitrate_icon_composition() }
	),
	["bob-silicon-powder"] = { composition = Icons.get_silicon_powder_icon_composition() },
}

_framework.tiers.assign_icons_with_tier_labels("item", items)

_framework.tiers.assign_icons_with_tier_labels("fluid", {
	["bob-lithia-water"] = { composition = Fluids.get_lithia_water_icon_composition() }, -- Shared with Bob's Ores, Angels
})

-- Angel's Petrochem replaces nuclear fuel reprocessing with a recipe and icon of its own.
if not mods["angelspetrochem"] then
	_framework.tiers.assign_icons_with_tier_labels("recipe", {
		["nuclear-fuel-reprocessing"] = { composition = Icons.get_nuclear_fuel_reprocessing_icon_composition() },
	})
end
