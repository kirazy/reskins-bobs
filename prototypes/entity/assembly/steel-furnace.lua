-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local FurnaceSteel = require("__reskins-assets-api__.assets.base.entities.furnace-steel")

if not (mods["bobassembly"] or mods["bobplates"]) then
	return
end

local entities = {
	-- Standard furnaces
	["steel-furnace"] = {
		type = "furnace",
		variant = "standard",
		tint = reskins.bobs.furnace_tint_index.standard,
	},
	["bob-fluid-furnace"] = {
		type = "furnace",
		variant = "fluid",
		tint = reskins.bobs.furnace_tint_index.standard,
	},
	-- Mixing furnaces
	["bob-steel-mixing-furnace"] = {
		type = "assembling-machine",
		variant = "standard",
		tint = reskins.bobs.furnace_tint_index.mixing,
	},
	["bob-fluid-mixing-furnace"] = {
		type = "assembling-machine",
		variant = "fluid",
		tint = reskins.bobs.furnace_tint_index.mixing,
	},
	-- Chemical furnaces
	["bob-steel-chemical-furnace"] = {
		type = "assembling-machine",
		variant = "chemical",
		tint = reskins.bobs.furnace_tint_index.chemical,
	},
	["bob-fluid-chemical-furnace"] = {
		type = "assembling-machine",
		variant = "chemical-fluid",
		tint = reskins.bobs.furnace_tint_index.chemical,
	},
}

for name, options in pairs(entities) do
	local entity = data.raw[options.type][name]
	if not entity then
		goto continue
	end

	local tier = 2
	local tint = options.tint or _framework.tiers.get_tint(tier)

	local sprite_set = FurnaceSteel.get_sprite_set({
		tint = tint,
		variant = options.variant,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = FurnaceSteel.get_icon({
		tint = tint,
		variant = options.variant,
	})
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
