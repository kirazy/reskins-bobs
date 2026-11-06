-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local FurnaceElectric = require("__reskins-assets-api__.assets.base.entities.furnace-electric")

local furnace_tints = require("prototypes.functions.furnace-tints")

if not (mods["bobassembly"] or mods["bobplates"]) then
	return
end

local entities = {
	-- Standard furnaces
	["electric-furnace"] = {
		type = "furnace",
		variant = "standard",
		tier = 3,
		tint = furnace_tints.standard,
	},
	["bob-electric-furnace-2"] = {
		type = "furnace",
		variant = "standard",
		tier = 4,
	},
	["bob-electric-furnace-3"] = {
		type = "furnace",
		variant = "standard",
		tier = 5,
	},
	-- Mixing furnace
	["bob-electric-mixing-furnace"] = {
		type = "assembling-machine",
		variant = "mixing",
		tier = 3,
		tint = furnace_tints.mixing,
	},
	-- Chemical furnace
	["bob-electric-chemical-furnace"] = {
		type = "assembling-machine",
		variant = "chemical",
		tier = 3,
		tint = furnace_tints.chemical,
	},
	-- Chemical mixing furnaces
	["bob-electric-chemical-mixing-furnace"] = {
		type = "assembling-machine",
		variant = "chemical-mixing",
		tier = 4,
	},
	["bob-electric-chemical-mixing-furnace-2"] = {
		type = "assembling-machine",
		variant = "chemical-mixing",
		tier = 5,
	},
}

-- Angel's Compatibility
if mods["angelssmelting"] then
	-- Use metal-mixing sprites to be consistent with new "Filtering Furnace" progression
	entities["bob-electric-chemical-mixing-furnace"].variant = "mixing"
	entities["bob-electric-chemical-mixing-furnace-2"].variant = "mixing"
end

for name, options in pairs(entities) do
	local entity = data.raw[options.type][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = options.tint or _framework.tiers.get_tint(tier)

	local sprite_set = FurnaceElectric.get_sprite_set({
		tint = tint,
		variant = options.variant,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	entity.fluid_boxes_off_when_no_fluid_recipe = true

	local icon_data = FurnaceElectric.get_icon({
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
