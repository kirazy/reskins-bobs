-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Pumpjack = require("__reskins-assets-api__.assets.base.entities.pumpjack")

if not (reskins.bobs and reskins.bobs.triggers.mining.entities) then
	return
end

local entities = {
	["pumpjack"] = { tier = 1, prog_tier = 2 },
	["bob-pumpjack-1"] = { tier = 2, prog_tier = 3 },
	["bob-pumpjack-2"] = { tier = 3, prog_tier = 4 },
	["bob-pumpjack-3"] = { tier = 4, prog_tier = 5 },
	["bob-water-miner-1"] = { tier = 1, is_water_miner = true },
	["bob-water-miner-2"] = { tier = 2, is_water_miner = true },
	["bob-water-miner-3"] = { tier = 3, is_water_miner = true },
	["bob-water-miner-4"] = { tier = 4, is_water_miner = true },
}

local TYPE = "mining-drill"
local BASE_ENTITY_NAME = "pumpjack"

local WATER_TINT = util.color("#3083bf")
local WATER_ACCENT_TINT = util.color("#ff8533")

-- Rescale pumpjack animation playback speed to something visually appealing
local max_playback = 2 -- Maximum animation playback speed
local min_playback = 0.5 -- Minimum animation playback speed

local mining_speeds = {}

-- Loop through all the pumpjacks, figure out the mining speeds
for name, _ in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if entity then
		table.insert(mining_speeds, entity.mining_speed)
	end
end

-- Determine max and min mining speeds
table.sort(mining_speeds)
local max_speed = mining_speeds[#mining_speeds] or 0.5
local min_speed = mining_speeds[1] or 0.5

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
		tint = tint,
		particles = {
			["small"] = 3,
		},
	})

	-- Reskin base particles if we're a water pump
	if options.is_water_miner then
		_lib.create_particle(entity.name, BASE_ENTITY_NAME, _lib.particle_index["big"], 1, WATER_TINT)
		_lib.create_particle(entity.name, BASE_ENTITY_NAME, _lib.particle_index["medium"], 2, WATER_TINT)
	end

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	-- Calculate new animation playback speed
	local speed
	if max_speed - min_speed == 0 then
		speed = entity.mining_speed
	else
		speed = ((entity.mining_speed / (max_speed - min_speed)) - (min_speed / (max_speed - min_speed))) * max_playback
			+ ((max_speed / (max_speed - min_speed)) - (entity.mining_speed / (max_speed - min_speed))) * min_playback
	end

	local sprite_set
	local icon_data
	if options.is_water_miner then
		sprite_set = Pumpjack.get_water_sprite_set({
			tint = tint,
			base_tint = WATER_TINT,
			accent_tint = WATER_ACCENT_TINT,
			animation_speed = speed,
		})
		icon_data = Pumpjack.get_water_icon({ tint = tint })
	else
		sprite_set = Pumpjack.get_sprite_set({ tint = tint, animation_speed = speed })
		icon_data = Pumpjack.get_icon({ tint = tint })
	end

	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
