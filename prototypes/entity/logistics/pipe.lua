-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = { defines = require("__reskins-assets-api__.api.defines") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Pipe = require("__reskins-assets-api__.assets.base.entities.pipe")
local PipeToGround = require("__reskins-assets-api__.assets.base.entities.pipe-to-ground")

-- Check to see if reskinning needs to be done
if not mods["boblogistics"] then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

local pipe_material_map = {
	["pipe"] = {
		tier = 1,
		pipe_material = "iron",
	},
	["bob-copper-pipe"] = {
		tier = 1,
		pipe_material = "copper",
	},
	["bob-bronze-pipe"] = {
		tier = 2,
		pipe_material = "bronze",
	},
	["bob-steel-pipe"] = {
		tier = 2,
		pipe_material = "steel",
	},
	["bob-plastic-pipe"] = {
		tier = 3,
		pipe_material = "plastic",
	},
	["bob-aluminium-pipe"] = {
		tier = 3,
		pipe_material = "aluminum",
	},
	["bob-brass-pipe"] = {
		tier = 4,
		pipe_material = "brass",
	},
	["bob-titanium-pipe"] = {
		tier = 4,
		pipe_material = "titanium",
	},
	["bob-tungsten-pipe"] = {
		tier = 5,
		pipe_material = "tungsten",
	},
	["bob-copper-tungsten-pipe"] = {
		tier = 5,
		pipe_material = "copper-tungsten",
	},
}

local function do_pipe(name, options)
	local entity = data.raw["pipe"][name]
	if not entity then
		return
	end

	local tier = _framework.tiers.get_tier(options)
	local sprite_set = Pipe.get_sprite_set({ pipe_material = options.pipe_material })

	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = name,
		type_name = "pipe",
		icon_data = Pipe.get_icon({ material = options.pipe_material }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)
end

local function do_pipe_to_ground(name, options)
	local entity = data.raw["pipe-to-ground"][name]
	if not entity then
		return
	end

	local tier = _framework.tiers.get_tier(options)
	local sprite_set = PipeToGround.get_sprite_set({ pipe_material = options.pipe_material })

	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = name,
		type_name = "pipe-to-ground",
		icon_data = PipeToGround.get_icon({ material = options.pipe_material }),
	})

	_sprite_utils.icons.apply_icon_assignment(icon_assignment)
end

for name, options in pairs(pipe_material_map) do
	do_pipe(name, options)
	do_pipe_to_ground(name .. "-to-ground", options)
end
