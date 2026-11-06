-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Electrolyser = require("__reskins-assets-api__.assets.bobs.entities.electrolyser")

if not mods["bobassembly"] then
	return
end

local entities = {
	["bob-electrolyser"] = { tier = 1 },
	["bob-electrolyser-2"] = { tier = 2 },
	["bob-electrolyser-3"] = { tier = 3 },
	["bob-electrolyser-4"] = { tier = 4 },
	["bob-electrolyser-5"] = { tier = 5 },
}

local TYPE = "assembling-machine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = Electrolyser.get_sprite_set({ tint = tint, tier = options.tier })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = Electrolyser.get_icon({ tint = tint, tier = options.tier })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
