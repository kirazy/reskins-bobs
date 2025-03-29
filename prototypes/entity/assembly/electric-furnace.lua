-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and (reskins.bobs.triggers.assembly.entities or reskins.bobs.triggers.plates.entities)) then
	return
end

-- Flag available for Mini-Machines compatibility pass
if reskins.compatibility then
	reskins.compatibility.triggers.minimachines.furnaces = true
end

local electric_furnace_map = {
	-- Standard furnaces
	["electric-furnace"] = { icon_name = "electric-furnace", furnace = "standard", tier = 3, type = "furnace", tint = reskins.bobs.furnace_tint_index.standard },
	["bob-electric-furnace-2"] = { icon_name = "electric-furnace", furnace = "standard", tier = 4, type = "furnace" },
	["bob-electric-furnace-3"] = { icon_name = "electric-furnace", furnace = "standard", tier = 5, type = "furnace" },
	-- Mixing furnace
	["bob-electric-mixing-furnace"] = { furnace = "mixing", tier = 3, type = "assembling-machine", tint = reskins.bobs.furnace_tint_index.mixing },
	-- Chemical furnace
	["bob-electric-chemical-furnace"] = { furnace = "chemical", tier = 3, type = "assembling-machine", tint = reskins.bobs.furnace_tint_index.chemical, has_fluids = true },
	-- Chemical mixing furnaces
	["bob-electric-chemical-mixing-furnace"] = { icon_name = "bob-electric-chemical-mixing-furnace", furnace = "chemical-mixing", tier = 4, type = "assembling-machine", has_fluids = true },
	["bob-electric-chemical-mixing-furnace-2"] = { icon_name = "bob-electric-chemical-mixing-furnace", furnace = "chemical-mixing", tier = 5, type = "assembling-machine", has_fluids = true },
}

-- Angel's Compatibility
if mods["angelssmelting"] then
	-- Use metal-mixing sprites to be consistent with new "Filtering Furnace" progression
	electric_furnace_map["bob-electric-chemical-mixing-furnace"].furnace = "mixing"
	electric_furnace_map["bob-electric-chemical-mixing-furnace"].icon_name = "bob-electric-mixing-furnace"
	electric_furnace_map["bob-electric-chemical-mixing-furnace-2"].furnace = "mixing"
	electric_furnace_map["bob-electric-chemical-mixing-furnace-2"].icon_name = "bob-electric-mixing-furnace"
end

local function furnace_heater_animation()
	return {
		filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/animations/electric-furnace-heater.png",
		priority = "high",
		width = 60,
		height = 56,
		frame_count = 12,
		animation_speed = 0.5,
		shift = util.by_pixel(2, 33),
		draw_as_glow = true,
		scale = 0.5,
	}
end

local function furnace_heater(has_fluids)
	if has_fluids then
		return {
			fadeout = true,
			north_animation = furnace_heater_animation(),
			east_animation = furnace_heater_animation(),
			west_animation = furnace_heater_animation(),
		}
	else
		return {
			fadeout = true,
			animation = furnace_heater_animation(),
		}
	end
end

local function furnace_working_light(type, has_partial)
	local working_type = "electric-furnace-light"
	if type then
		if has_partial then
			working_type = "electric-" .. type .. "-furnace-light-obstructed"
		else
			working_type = "electric-" .. type .. "-furnace-light"
		end
	end

	return {
		filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/lights/" .. working_type .. ".png",
		priority = "high",
		width = 238,
		height = 212,
		shift = util.by_pixel(1, 1),
		blend_mode = "additive",
		draw_as_glow = true,
		scale = 0.5,
	}
end

local function furnace_ground_light()
	return {
		filename = "__base__/graphics/entity/electric-furnace/electric-furnace-ground-light.png",
		blend_mode = "additive",
		width = 166,
		height = 124,
		shift = util.by_pixel(3, 69),
		draw_as_light = true,
		scale = 0.5,
	}
end

local function furnace_large_propeller()
	return {
		animation = {
			filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/animations/propeller-large.png",
			priority = "high",
			width = 38,
			height = 26,
			frame_count = 4,
			animation_speed = 0.5,
			shift = util.by_pixel(-20, -18),
			scale = 0.5,
		},
	}
end

local function furnace_small_propeller(is_shifted)
	local shift = util.by_pixel(4, -37.5)
	if is_shifted then
		shift = util.by_pixel(1, -24)
	end

	return {
		animation = {
			filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/animations/propeller-small.png",
			priority = "high",
			width = 24,
			height = 16,
			frame_count = 4,
			animation_speed = 0.5,
			shift = shift,
			scale = 0.5,
		},
	}
end

-- Reskin entities, create and assign extra details
for name, map in pairs(electric_furnace_map) do
	local tier = reskins.lib.tiers.get_tier(map)

	local inputs = {
		type = map.type,
		base_entity_name = "electric-furnace",
		directory = reskins.bobs.directory,
		mod = "bobs",
		group = "assembly",
		particles = { ["medium"] = 2 },
		tint = map.tint or reskins.lib.tiers.get_tint(tier),
		icon_name = map.icon_name or name,
	}

	if reskins.lib.settings.get_value("reskins-bobs-do-furnace-tier-labeling") == true then
		inputs.tier_labels = true
	else
		inputs.tier_labels = false
	end

	---@type data.FurnacePrototype|data.AssemblingMachinePrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Fetch remnant
	local remnant = data.raw["corpse"][name .. "-remnants"]

	-- Reskin remnants
	remnant.animation = {
		layers = {
			-- Base
			{
				filename = "__base__/graphics/entity/electric-furnace/remnants/electric-furnace-remnants.png",
				line_length = 1,
				width = 454,
				height = 448,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(-3.25, 7.25),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/remnants/electric-furnace-remnants-mask.png",
				line_length = 1,
				width = 214,
				height = 208,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(-3.25, 7.25),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/remnants/electric-furnace-remnants-highlights.png",
				line_length = 1,
				width = 214,
				height = 208,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(-3.25, 7.25),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
		},
	}

	-- Reskin entities
	entity.graphics_set.animation = {
		layers = {
			-- Base
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/" .. inputs.icon_name .. "-base.png",
				priority = "high",
				width = 238,
				height = 212,
				shift = util.by_pixel(1, 1),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/" .. inputs.icon_name .. "-mask.png",
				priority = "high",
				width = 238,
				height = 212,
				shift = util.by_pixel(1, 1),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/" .. inputs.icon_name .. "-highlights.png",
				priority = "high",
				width = 238,
				height = 212,
				shift = util.by_pixel(1, 1),
				blend_mode = reskins.lib.settings.blend_mode, -- "additive",
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/electric-furnace-shadow.png",
				priority = "high",
				width = 228,
				height = 172,
				shift = util.by_pixel(10.75, 7.25),
				draw_as_shadow = true,
				scale = 0.5,
			},
		},
	}

	if map.furnace == "chemical" then
		entity.graphics_set.working_visualisations = {
			-- Furnace Heater
			furnace_heater(true),

			-- Furnace Light
			{
				fadeout = true,
				north_animation = furnace_working_light("chemical"),
				east_animation = furnace_working_light("chemical"),
				west_animation = furnace_working_light("chemical"),
			},

			-- Furnace Ground Light
			{
				fadeout = true,
				north_animation = furnace_ground_light(),
				east_animation = furnace_ground_light(),
				west_animation = furnace_ground_light(),
			},
		}

		-- Add chemical furnace remnants details
		table.insert(remnant.animation.layers, {
			filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/remnants/chemical-furnace-remnants-overlay.png",
			line_length = 1,
			width = 214,
			height = 208,
			frame_count = 1,
			direction_count = 1,
			shift = util.by_pixel(-3.25, 7.25),
			scale = 0.5,
		})
	elseif map.furnace == "mixing" then
		entity.graphics_set.working_visualisations = {
			-- Furnace Heater
			furnace_heater(),

			-- Furnace Light
			{
				fadeout = true,
				animation = furnace_working_light("mixing"),
			},

			-- Furnace Ground Light
			{
				fadeout = true,
				animation = furnace_ground_light(),
			},

			-- Propellers
			furnace_large_propeller(),
			furnace_small_propeller(true),
		}
	elseif map.furnace == "chemical-mixing" then
		entity.graphics_set.working_visualisations = {
			-- Furnace Heater
			furnace_heater(true),

			-- Furnace Light
			{
				fadeout = true,
				north_animation = furnace_working_light("chemical-mixing"),
				east_animation = furnace_working_light("chemical-mixing"),
				south_animation = furnace_working_light("chemical-mixing", true),
				west_animation = furnace_working_light("chemical-mixing"),
			},

			-- Furnace Ground Light
			{
				fadeout = true,
				north_animation = furnace_ground_light(),
				east_animation = furnace_ground_light(),
				west_animation = furnace_ground_light(),
			},

			-- Propeller
			furnace_small_propeller(true),
		}

		-- Add chemical-mixing furnace remnants details
		table.insert(remnant.animation.layers, {
			filename = "__reskins-bobs__/graphics/entity/assembly/electric-furnace/remnants/chemical-mixing-furnace-remnants-overlay.png",
			line_length = 1,
			width = 214,
			height = 208,
			frame_count = 1,
			direction_count = 1,
			shift = util.by_pixel(-3.25, 7.25),
			scale = 0.5,
		})
	elseif map.furnace == "standard" then
		entity.graphics_set.working_visualisations = {
			-- Furnace Heater
			furnace_heater(),

			-- Furnace Light
			{
				fadeout = true,
				animation = furnace_working_light(),
			},

			-- Furnace Ground Light
			{
				fadeout = true,
				animation = furnace_ground_light(),
			},

			-- Propellers
			furnace_large_propeller(),
			furnace_small_propeller(),
		}
	end

	-- Handle pipe pictures
	-- TODO Rework this for the revised fluid box manager prototype.
	-- Should not need to re-define the fluid box to reskin the pictures...
	-- if map.has_fluids then
	--     entity.fluid_boxes = {
	--         {
	--             production_type = "input",
	--             pipe_picture = reskins.bobs.furnace_pipe_pictures(inputs.tint),
	--             pipe_covers = pipecoverspictures(),
	--             base_area = 10,
	--             base_level = -1,
	--             pipe_connections = { { type = "input", position = { 0, -2 } } },
	--             secondary_draw_orders = { north = -1 },
	--         },
	--         off_when_no_fluid_recipe = true,
	--     }
	-- end

	if name ~= "electric-furnace" then
		entity.water_reflection = util.copy(data.raw["furnace"]["electric-furnace"].water_reflection)
	end

	::continue::
end
