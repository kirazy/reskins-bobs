-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Assets.Base.Entities

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local NuclearReactor = require("__reskins-assets-api__.assets.base.entities.nuclear-reactor")

local nuclear_reactors = require("prototypes.functions.nuclear-reactors")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.nuclear) then
	return
end

local entities = {
	["nuclear-reactor"] = {
		tier = 1,
		prog_tier = 3,
		material = "aluminum-invar",
	},
	["bob-nuclear-reactor-2"] = {
		tier = 2,
		prog_tier = 4,
		material = "silver-titanium",
	},
	["bob-nuclear-reactor-3"] = {
		tier = 3,
		prog_tier = 5,
		material = "gold-copper",
	},
}

local TYPE = "reactor"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local reactor = nuclear_reactors[name]
	local tint = reactor.tint or _framework.tiers.get_tint(tier)

	local sprite_set = NuclearReactor.get_sprite_set({
		tint = tint,
		pipe_material = options.material,
		use_fuel_glow_color = true,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = NuclearReactor.get_fuel_icon_composition({
		fuel = reactor.fuel,
		material = options.material,
		tint = tint,
	})
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
