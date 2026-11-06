-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }
local _assets = {
	icons = require("__reskins-assets-api__.api.icons"),
	defines = require("__reskins-assets-api__.api.defines"),
}

local Applicators = require("__reskins-assets-api__.api.applicators")
local MiningDrillElectric = require("__reskins-assets-api__.assets.base.entities.mining-drill-electric")

if mods["classic-mining-drill"] or mods["semi-classic-mining-drill"] then
	return
end
if not mods["bobmining"] then
	return
end

local entities = {
	["electric-mining-drill"] = { tier = 1, prog_tier = 1 },
	["bob-mining-drill-1"] = { tier = 2, prog_tier = 2 },
	["bob-mining-drill-2"] = { tier = 3, prog_tier = 3 },
	["bob-mining-drill-3"] = { tier = 4, prog_tier = 4 },
	["bob-mining-drill-4"] = { tier = 5, prog_tier = 5 },
	["bob-area-mining-drill-1"] = { tier = 1, prog_tier = 2, is_area_drill = true },
	["bob-area-mining-drill-2"] = { tier = 2, prog_tier = 3, is_area_drill = true },
	["bob-area-mining-drill-3"] = { tier = 3, prog_tier = 4, is_area_drill = true },
	["bob-area-mining-drill-4"] = { tier = 4, prog_tier = 5, is_area_drill = true },
}

local TYPE = "mining-drill"

-- Rescale mining drill animation playback speed to something visually appealing
local max_playback = 1.2 -- Maximum animation playback speed
local min_playback = 0.4 -- Minimum animation playback speed

local mining_speeds = {}

-- Loop through all the drills, figure out the mining speeds
for name, _ in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if entity then
		table.insert(mining_speeds, entity.mining_speed)
	end
end

-- Determine max and min mining speeds
table.sort(mining_speeds)
local max_speed = mining_speeds[#mining_speeds] or 0
local min_speed = mining_speeds[1] or 0

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	-- Calculate new animation playback speed
	local speed
	if max_speed - min_speed == 0 then
		speed = entity.mining_speed
	else
		speed = ((entity.mining_speed / (max_speed - min_speed)) - (min_speed / (max_speed - min_speed))) * max_playback
			+ ((max_speed / (max_speed - min_speed)) - (entity.mining_speed / (max_speed - min_speed))) * min_playback
	end

	local sprite_set = MiningDrillElectric.get_sprite_set({
		tint = tint,
		frame = options.is_area_drill and "blue" or "base",
		animation_speed = speed,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_assignment
	if options.is_area_drill then
		local composition = MiningDrillElectric.get_area_icon_composition({ tint = tint })
			:add_symbol(_assets.icons.get_symbol(_assets.defines.symbol.area_drill, tint))

		icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
			tier = tier,
			name = entity.name,
			type_name = entity.type,
			composition = composition,
		})
	else
		icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
			tier = tier,
			name = entity.name,
			type_name = entity.type,
			composition = MiningDrillElectric.get_icon_composition({ tint = tint }),
		})
	end
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
