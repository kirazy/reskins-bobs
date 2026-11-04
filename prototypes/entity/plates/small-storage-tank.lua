-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local StorageTankSmall = require("__reskins-assets-api__.assets.bobs.entities.storage-tank-small")

if not (reskins.bobs and reskins.bobs.triggers.plates.entities) then
	return
end

local entities = {
	["bob-small-storage-tank"] = { variant = "standard" },
	["bob-small-inline-storage-tank"] = { variant = "inline" },
}

local TYPE = "storage-tank"
local BASE_ENTITY_NAME = "storage-tank"
local TINT = util.color("#b29270")

for name, options in pairs(entities) do
	---@type data.StorageTankPrototype
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
		tint = TINT,
		particles = {
			["big"] = 1,
		},
	})

	entity.corpse = "small-remnants"

	local sprite_set = StorageTankSmall.get_sprite_set({ variant = options.variant })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = StorageTankSmall.get_icon({ variant = options.variant })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end

-- Fix the pipe connection positions.
local all_way_storage_tank = data.raw["storage-tank"]["bob-small-storage-tank"]
if all_way_storage_tank then
	all_way_storage_tank.fluid_box.pipe_connections = {
		{ direction = defines.direction.north, position = { 0, 0 } },
		{ direction = defines.direction.south, position = { 0, 0 } },
		{ direction = defines.direction.west, position = { 0, 0 } },
		{ direction = defines.direction.east, position = { 0, 0 } },
	}
end

local inline_storage_tank = data.raw["storage-tank"]["bob-small-inline-storage-tank"]
if inline_storage_tank then
	inline_storage_tank.fluid_box.pipe_connections = {
		{ direction = defines.direction.north, position = { 0, 0 } },
		{ direction = defines.direction.south, position = { 0, 0 } },
	}
end
