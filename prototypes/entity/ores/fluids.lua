-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobores"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Ores = require("__reskins-assets-api__.assets.bobs.items.ores")

_framework.tiers.assign_icons_with_tier_labels("resource", {
	["bob-ground-water"] = { composition = Ores.get_ground_water_icon_composition() },
	["bob-lithia-water"] = { composition = Ores.get_lithia_water_icon_composition() },
})

local fluids = {
	"bob-ground-water",
	"bob-lithia-water",
}

for _, name in pairs(fluids) do
	local entity = data.raw["resource"][name]
	if not entity then
		goto continue
	end

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
