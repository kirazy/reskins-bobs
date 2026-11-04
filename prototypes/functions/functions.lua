-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---Mod path for Artisanal Reskins: Bob's Mods.
reskins.bobs.directory = "__reskins-bobs__"

---Table of colors for the three types of furnaces added by bobplates.
reskins.bobs.furnace_tint_index = {
	standard = reskins.lib.settings.get_value("reskins-bobs-do-custom-furnace-variants")
			and reskins.lib.settings.get_value("reskins-bobs-standard-furnace-color")
		or util.color("#ffb700"),
	mixing = reskins.lib.settings.get_value("reskins-bobs-do-custom-furnace-variants")
			and reskins.lib.settings.get_value("reskins-bobs-mixing-furnace-color")
		or util.color("#00bfff"),
	chemical = reskins.lib.settings.get_value("reskins-bobs-do-custom-furnace-variants")
			and reskins.lib.settings.get_value("reskins-bobs-chemical-furnace-color")
		or util.color("#f21f0c"),
}

-- PIPE-RELATED PICTURE AND COVER GENERATION

---Returns a table of colored assembly machine style pipe pictures.
---@param tint data.Color
---@return table animation #[Types/Animation4Way](https://wiki.factorio.com/Types/Animation4Way)
function reskins.bobs.assembly_pipe_pictures(tint)
	return {
		north = {
			layers = {
				-- Base
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-N-base.png",
					priority = "extra-high",
					width = 71,
					height = 38,
					shift = util.by_pixel(2.25, 13.5),
					scale = 0.5,
				},
				-- Mask
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-N-mask.png",
					priority = "extra-high",
					width = 71,
					height = 38,
					shift = util.by_pixel(2.25, 13.5),
					tint = tint,
					scale = 0.5,
				},
				-- Highlights
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-N-highlights.png",
					priority = "extra-high",
					width = 71,
					height = 38,
					shift = util.by_pixel(2.25, 13.5),
					blend_mode = reskins.lib.settings.blend_mode, -- "additive",
					scale = 0.5,
				},
			},
		},
		east = {
			layers = {
				-- Base
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-E-base.png",
					priority = "extra-high",
					width = 42,
					height = 76,
					shift = util.by_pixel(-24.5, 1),
					scale = 0.5,
				},
				-- Mask
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-E-mask.png",
					priority = "extra-high",
					width = 42,
					height = 76,
					shift = util.by_pixel(-24.5, 1),
					tint = tint,
					scale = 0.5,
				},
				-- Highlights
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-E-highlights.png",
					priority = "extra-high",
					width = 42,
					height = 76,
					shift = util.by_pixel(-24.5, 1),
					blend_mode = reskins.lib.settings.blend_mode, -- "additive",
					scale = 0.5,
				},
			},
		},
		south = {
			layers = {
				-- Base
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-S-base.png",
					priority = "extra-high",
					width = 88,
					height = 61,
					shift = util.by_pixel(0, -31.25),
					scale = 0.5,
				},
				-- Mask
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-S-mask.png",
					priority = "extra-high",
					width = 88,
					height = 61,
					shift = util.by_pixel(0, -31.25),
					tint = tint,
					scale = 0.5,
				},
				-- Highlights
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-S-highlights.png",
					priority = "extra-high",
					width = 88,
					height = 61,
					shift = util.by_pixel(0, -31.25),
					blend_mode = reskins.lib.settings.blend_mode, -- "additive",
					scale = 0.5,
				},
			},
		},
		west = {
			layers = {
				-- Base
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-W-base.png",
					priority = "extra-high",
					width = 39,
					height = 73,
					shift = util.by_pixel(25.75, 1.25),
					scale = 0.5,
				},
				-- Mask
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-W-mask.png",
					priority = "extra-high",
					width = 39,
					height = 73,
					shift = util.by_pixel(25.75, 1.25),
					tint = tint,
					scale = 0.5,
				},
				-- Highlights
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/assembling-machine/pipes/assembling-machine-pipe-W-highlights.png",
					priority = "extra-high",
					width = 39,
					height = 73,
					shift = util.by_pixel(25.75, 1.25),
					blend_mode = reskins.lib.settings.blend_mode, -- "additive",
					scale = 0.5,
				},
			},
		},
	}
end

---Returns a table of colored electric chemical furnace style pipe pictures.
---@param tint data.Color
---@return table animation #[Types/Animation4Way](https://wiki.factorio.com/Types/Animation4Way)
function reskins.bobs.furnace_pipe_pictures(tint)
	return {
		north = {
			filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-N-base.png",
			priority = "extra-high",
			width = 70,
			height = 26,
			shift = util.by_pixel(2.5, 10),
			scale = 0.5,
		},
		east = {
			layers = {
				-- Base
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-E-base.png",
					priority = "extra-high",
					width = 30,
					height = 70,
					shift = util.by_pixel(-20.5, 3),
					scale = 0.5,
				},
				-- Mask
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-E-mask.png",
					priority = "extra-high",
					width = 30,
					height = 70,
					shift = util.by_pixel(-20.5, 3),
					tint = tint,
					scale = 0.5,
				},
				-- Highlights
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-E-highlights.png",
					priority = "extra-high",
					width = 30,
					height = 70,
					shift = util.by_pixel(-20.5, 3),
					blend_mode = reskins.lib.settings.blend_mode, -- "additive",
					scale = 0.5,
				},
			},
		},
		south = {
			layers = {
				-- Base
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-S-base.png",
					priority = "extra-high",
					width = 76,
					height = 58,
					shift = util.by_pixel(0.5, -30.5),
					scale = 0.5,
				},
				-- Mask
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-S-mask.png",
					priority = "extra-high",
					width = 76,
					height = 58,
					shift = util.by_pixel(0.5, -30.5),
					tint = tint,
					scale = 0.5,
				},
				-- Highlights
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-S-highlights.png",
					priority = "extra-high",
					width = 76,
					height = 58,
					shift = util.by_pixel(0.5, -30.5),
					blend_mode = reskins.lib.settings.blend_mode, -- "additive",
					scale = 0.5,
				},
			},
		},
		west = {
			layers = {
				-- Base
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-W-base.png",
					priority = "extra-high",
					width = 22,
					height = 68,
					shift = util.by_pixel(21.5, 2),
					scale = 0.5,
				},
				-- Mask
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-W-mask.png",
					priority = "extra-high",
					width = 22,
					height = 68,
					shift = util.by_pixel(21.5, 2),
					tint = tint,
					scale = 0.5,
				},
				-- Highlights
				{
					filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/pipes/electric-furnace-pipe-W-highlights.png",
					priority = "extra-high",
					width = 22,
					height = 68,
					shift = util.by_pixel(21.5, 2),
					blend_mode = reskins.lib.settings.blend_mode, -- "additive",
					scale = 0.5,
				},
			},
		},
	}
end

-- MINING DRILL FUNCTIONS
-- Apparently relying on vanilla globals can be dangerous when other mods break them

---Duplicate of vanilla Factorio `electric_mining_drill_smoke()` for compatibility purposes.
---@return data.Animation
function reskins.bobs.electric_mining_drill_smoke()
	---@type data.Animation
	local animation = {
		priority = "high",
		filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke.png",
		line_length = 6,
		width = 48,
		height = 72,
		frame_count = 30,
		animation_speed = 0.4,
		shift = util.by_pixel(0, 3),
		scale = 0.5,
	}

	return animation
end

---Duplicate of vanilla Factorio `electric_mining_drill_smoke_front()` for compatibility purposes.
---@return data.Animation
function reskins.bobs.electric_mining_drill_smoke_front()
	---@type data.Animation
	local animation = {
		priority = "high",
		filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke-front.png",
		line_length = 6,
		width = 148,
		height = 132,
		frame_count = 30,
		animation_speed = 0.4,
		shift = util.by_pixel(-3, 9),
		scale = 0.5,
	}

	return animation
end

---Duplicate of vanilla Factorio `electric_drill_animation_sequence` for compatibility purposes.
-- stylua: ignore
reskins.bobs.electric_drill_animation_sequence = {
	1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
	21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1
}

---Duplicate of vanilla Factorio `electric_drill_animation_shadow_sequence` for compatibility purposes.
-- stylua: ignore
reskins.bobs.electric_drill_animation_shadow_sequence = {
	1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1
}

---Duplicate of vanilla Factory `electric_mining_drill_status_leds_working_visualisation()` for compatibility purposes.
---@return data.WorkingVisualisation
function reskins.bobs.electric_mining_drill_status_leds_working_visualisation()
	local led_blend_mode = nil -- "additive"
	local led_tint = { 1, 1, 1 }

	---@type data.WorkingVisualisation
	local status_leds_working_visualisation = {
		apply_tint = "status",
		always_draw = true,
		north_animation = {
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-light.png",
			width = 32,
			height = 32,
			blend_mode = led_blend_mode,
			tint = led_tint,
			draw_as_glow = true,
			shift = util.by_pixel(26, -48),
			scale = 0.5,
		},
		east_animation = {
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-light.png",
			width = 32,
			height = 34,
			blend_mode = led_blend_mode,
			tint = led_tint,
			draw_as_glow = true,
			shift = util.by_pixel(38, -32),
			scale = 0.5,
		},
		south_animation = {
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-light.png",
			width = 38,
			height = 46,
			blend_mode = led_blend_mode,
			tint = led_tint,
			draw_as_glow = true,
			shift = util.by_pixel(26, 26),
			scale = 0.5,
		},
		west_animation = {
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-light.png",
			width = 32,
			height = 34,
			blend_mode = led_blend_mode,
			tint = led_tint,
			draw_as_glow = true,
			shift = util.by_pixel(-39, -32),
			scale = 0.5,
		},
	}

	return status_leds_working_visualisation
end

---Duplicate of vanilla Factorio `electric_mining_drill_add_light_offsets()` for compatibility purposes.\
---Sets the north/south/east/west positions in table `t` to those of the current electric mining drill sprites.
---@param t data.WorkingVisualisation
---@return data.WorkingVisualisation --`t` with the north, east, south and west positions modified.
local function electric_mining_drill_add_light_offsets(t)
	t.north_position = { 0.8, -1.5 }
	t.east_position = { 1.2, -1 }
	t.south_position = { 0.8, 0.8 }
	t.west_position = { -1.2, -1 }
	return t
end

---Duplicate of vanilla Factorio `electric_mining_drill_primary_light` for compatibility purposes.
reskins.bobs.electric_mining_drill_primary_light = electric_mining_drill_add_light_offsets({
	light = { intensity = 1, size = 3, color = { r = 1, g = 1, b = 1 }, minimum_darkness = 0.1 },
})

---Duplicate of vanilla Factorio `electric_mining_drill_secondary_light` for compatibility purposes.
reskins.bobs.electric_mining_drill_secondary_light = electric_mining_drill_add_light_offsets({
	always_draw = true,
	apply_tint = "status",
	light = { intensity = 0.2, size = 2, color = { r = 1, g = 1, b = 1 }, minimum_darkness = 0.1 },
})
