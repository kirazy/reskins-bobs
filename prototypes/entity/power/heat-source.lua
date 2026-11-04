-- cspell: words heatsources

-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local HeatSource = require("__reskins-assets-api__.assets.bobs.entities.heat-source")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.heatsources) then
	return
end

local entities = {
	["bob-burner-reactor"] = { tier = 1, prog_tier = 2, variant = "burner", pipe_material = "base" },
	["bob-burner-reactor-2"] = { tier = 2, prog_tier = 3, variant = "burner", pipe_material = "aluminum-invar" },
	["bob-fluid-reactor"] = { tier = 1, prog_tier = 2, variant = "fluid", pipe_material = "base" },
	["bob-fluid-reactor-2"] = { tier = 2, prog_tier = 3, variant = "fluid", pipe_material = "aluminum-invar" },
}

local TYPE = "reactor"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = HeatSource.get_sprite_set({
		tint = tint,
		variant = options.variant,
		pipe_material = options.pipe_material,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = HeatSource.get_icon({ variant = options.variant, tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
