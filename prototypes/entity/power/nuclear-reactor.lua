-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Assets.Base.Entities

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local NuclearReactor = require("__reskins-assets-api__.assets.base.entities.nuclear-reactor")

local nuclear_reactors = require("prototypes.functions.nuclear-reactors")

if not mods["bobpower"] then
	return
end
if not _framework.settings.get_value("bobmods-power-nuclear") then
	return
end

local TYPE = "reactor"

for name, reactor in pairs(nuclear_reactors) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(reactor)

	local sprite_set = NuclearReactor.get_sprite_set({
		tint = reactor.tint,
		pipe_material = reactor.material,
		use_fuel_glow_color = true,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = NuclearReactor.get_fuel_icon_composition({
		fuel = reactor.fuel,
		material = reactor.material,
		tint = reactor.tint,
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
