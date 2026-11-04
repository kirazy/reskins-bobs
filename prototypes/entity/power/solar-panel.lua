-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { icons = require("__reskins-assets-api__.api.icons") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local SolarPanelSmall = require("__reskins-assets-api__.assets.base.entities.solar-panel-small")
local SolarPanelMedium = require("__reskins-assets-api__.assets.base.entities.solar-panel-standard")
local SolarPanelLarge = require("__reskins-assets-api__.assets.base.entities.solar-panel-large")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.solar) then
	return
end

local entities = {
	["bob-solar-panel-small"] = {
		tier = 1,
		prog_tier = 2,
		letter = "S",
		assets = SolarPanelSmall,
	},
	["bob-solar-panel-small-2"] = {
		tier = 2,
		prog_tier = 3,
		letter = "S",
		assets = SolarPanelSmall,
	},
	["bob-solar-panel-small-3"] = {
		tier = 3,
		prog_tier = 4,
		letter = "S",
		assets = SolarPanelSmall,
	},
	["solar-panel"] = {
		tier = 1,
		prog_tier = 2,
		letter = "M",
		assets = SolarPanelMedium,
	},
	["bob-solar-panel-2"] = {
		tier = 2,
		prog_tier = 3,
		letter = "M",
		assets = SolarPanelMedium,
	},
	["bob-solar-panel-3"] = {
		tier = 3,
		prog_tier = 4,
		letter = "M",
		assets = SolarPanelMedium,
	},
	["bob-solar-panel-large"] = {
		tier = 1,
		prog_tier = 2,
		letter = "L",
		assets = SolarPanelLarge,
	},
	["bob-solar-panel-large-2"] = {
		tier = 2,
		prog_tier = 3,
		letter = "L",
		assets = SolarPanelLarge,
	},
	["bob-solar-panel-large-3"] = {
		tier = 3,
		prog_tier = 4,
		letter = "L",
		assets = SolarPanelLarge,
	},
}

local TYPE = "solar-panel"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = options.assets.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = _sprite_utils.icons.compose_icons(
		"default",
		options.assets.get_icon({ tint = tint }),
		_assets.icons.get_letter(options.letter, tint)
	)
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
