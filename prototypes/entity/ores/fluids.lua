-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

if not (reskins.bobs and reskins.bobs.triggers.ores.entities) then
	return
end

local fluids = {
	"bob-ground-water",
	"bob-lithia-water",
}

for _, name in pairs(fluids) do
	local entity = data.raw["resource"][name]
	if not entity then
		goto continue
	end

	_sprite_utils.icons.apply_icon_assignment({
		name = entity.name,
		type_name = entity.type,
		icon_datum = {
			icon = "__reskins-bobs__/graphics/icons/ores/ores/" .. name .. "/" .. name .. ".png",
			icon_size = 64,
			scale = 0.5,
		},
	})

	entity.stages = {
		sheet = {
			filename = "__reskins-bobs__/graphics/entity/ores/" .. name .. "/" .. name .. ".png",
			priority = "extra-high",
			width = 148,
			height = 120,
			frame_count = 4,
			variation_count = 1,
			shift = util.by_pixel(0, -2),
			scale = 0.5,
		},
	}

	::continue::
end
