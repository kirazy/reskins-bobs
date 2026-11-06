-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Spidertron = require("__reskins-assets-api__.assets.bobs.entities.spidertron")

if not mods["bobwarfare"] then
	return
end

local entities = {
	["bob-antron"] = { variant = "antron" },
	["bob-tankotron"] = { variant = "tankotron" },
	["bob-logistic-spidertron"] = { variant = "logistic" },
	["bob-heavy-spidertron"] = { variant = "heavy" },
}

local TYPE = "spider-vehicle"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local icon_data = Spidertron.get_icon({ variant = options.variant })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
		-- The explosion and remnants are shared with the vanilla spidertron.
		options = {
			infer_explosion = false,
			infer_corpse = false,
		},
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	local item = data.raw["item-with-entity-data"][entity.name]
	if item then
		item.icon_tintables = Spidertron.get_tintable_icon({ variant = options.variant })
		item.icon_tintable_masks = Spidertron.get_tintable_mask_icon({ variant = options.variant })
	end

	::continue::
end
