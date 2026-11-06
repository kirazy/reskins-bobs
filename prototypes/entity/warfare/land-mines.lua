-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Mine = require("__reskins-assets-api__.assets.base.entities.mine")

if not mods["bobwarfare"] then
	return
end

local entities = {
	["bob-distractor-mine"] = { variant = "distractor" },
	["bob-poison-mine"] = { variant = "poison" },
	["bob-slowdown-mine"] = { variant = "slowdown" },
}

local TYPE = "land-mine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local sprite_set = Mine.get_sprite_set({ variant = options.variant })
	Applicators.apply_sprite_set(entity, sprite_set)

	-- The corpse and the dying explosion are shared with other entities.
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = Mine.get_icon({ variant = options.variant }),
		options = {
			infer_explosion = false,
			infer_corpse = false,
		},
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
