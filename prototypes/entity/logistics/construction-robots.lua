-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local ConstructionRobot = require("__reskins-assets-api__.assets.base.entities.robot-construction")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

-- TODO: The way robot colors work needs to be revised; this was more of an issue when a 6th tier
-- did not exist except here, and now it's used in several places.
local do_progression_based_robots = _framework.settings.get_value("reskins-bobs-do-progression-based-robots")
local fusion_robot_color = _framework.settings.get_value("reskins-bobs-fusion-robot-color") --[[@as Color]]

local entities = {
	["construction-robot"] = {
		tier = 1,
		prog_tier = 2,
	},
	["bob-construction-robot-2"] = {
		tier = 2,
		prog_tier = 3,
	},
	["bob-construction-robot-3"] = {
		tier = 3,
		prog_tier = 4,
	},
	["bob-construction-robot-4"] = {
		tier = 4,
		prog_tier = 5,
	},
	["bob-construction-robot-5"] = {
		tier = 5,
		prog_tier = do_progression_based_robots and 5 or 6,
		tint = do_progression_based_robots and fusion_robot_color or nil,
	},
}

local TYPE = "construction-robot"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = options.tint or _framework.tiers.get_tint(tier)

	local sprite_set = ConstructionRobot.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = ConstructionRobot.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})

	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
