-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local circuit_names = {
	"basic-circuit-board",
	"basic-electronic-circuit-board",
	"electronic-circuit-board",
	"electronic-logic-board",
	"electronic-processing-board",
}

for tier, circuit_name in pairs(circuit_names) do
	-- Make the standard sprites.
	data:extend({
		{
			type = "sprite",
			name = "ar-" .. circuit_name .. "-standard",
			filename = "__reskins-bobs__/graphics/icons/sprites/circuits/standard/" .. circuit_name .. ".png",
			size = 40,
			mipmap_count = 2,
			flags = { "gui-icon" },
		},
	})

	-- Fetch tint, ensure it has no alpha; circuits do not support partial transparency.
	local tint = reskins.lib.tiers.get_tint(tier)
	local sanitized_tint = util.get_color_with_alpha(tint, 1)

	-- Make tier colored sprites
	data:extend({
		{
			type = "sprite",
			name = "ar-" .. circuit_name .. "-colored",
			layers = {
				{
					filename = "__reskins-bobs__/graphics/icons/sprites/circuits/colored/" .. circuit_name .. "/" .. circuit_name .. "-base.png",
					size = 40,
					tint = sanitized_tint,
					mipmap_count = 2,
					flags = { "gui-icon" },
				},
				{
					filename = "__reskins-bobs__/graphics/icons/sprites/circuits/colored/" .. circuit_name .. "/" .. circuit_name .. "-highlights.png",
					size = 40,
					blend_mode = "additive",
					mipmap_count = 2,
					flags = { "gui-icon" },
				},
				{
					filename = "__reskins-bobs__/graphics/icons/sprites/circuits/colored/" .. circuit_name .. "/" .. circuit_name .. "-traces.png",
					size = 40,
					mipmap_count = 2,
					flags = { "gui-icon" },
				},
			},
			flags = { "gui-icon" },
		},
	})
end
