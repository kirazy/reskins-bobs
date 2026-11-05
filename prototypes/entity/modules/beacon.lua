-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Assets.Base.Entities

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Beacon = require("__reskins-assets-api__.assets.base.entities.beacon")

if mods["classic-beacon"] or not (reskins.bobs and reskins.bobs.triggers.modules.entities) then
	return
end

-- Flag available for Mini-Machines compatibility pass
if reskins.compatibility then
	reskins.compatibility.triggers.minimachines.beacons = true
end

local entities = {
	["beacon"] = { tier = 1, prog_tier = 3 },
	["bob-beacon-2"] = { tier = 2, prog_tier = 4 },
	["bob-beacon-3"] = { tier = 3, prog_tier = 5 },
}

---@type BeaconModuleArtStyle[]
local module_art_styles = {
	{ art_style = "bob-5-lights", creators = Beacon.module_slots.get_tiered_creators(5) },
	{ art_style = "bob-god-base", creators = Beacon.module_slots.get_god_module_creators("base") },
	{ art_style = "bob-god-productivity", creators = Beacon.module_slots.get_god_module_creators("productivity") },
	{ art_style = "bob-god-quality", creators = Beacon.module_slots.get_god_module_creators("quality") },
}

local TYPE = "beacon"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = Beacon.get_sprite_set({
		tint = tint,
		slot_count = entity.module_slots,
		module_art_styles = module_art_styles,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = Beacon.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
