-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if mods["ScienceCostTweakerM"] then
	return
end -- May not be needed, but labs?...
if not (reskins.bobs and reskins.bobs.triggers.technology.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	icons = require("__reskins-assets-api__.api.icons"),
}
local IconComposition = require("__reskins-sprite-utils__.icon-composition")

local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Steam power-related unlocks
	-- ["electricity"] = {}, -- inserter/miner/radar/pole/fluid burner gen

	-- Labs
	["bob-lab"] = { composition = Icons.get_lab_icon_composition() }, -- lab 1
	["bob-advanced-research"] = { composition = Icons.get_advanced_research_icon_composition() }, -- lab 2
	["bob-alien-research"] = { composition = Icons.get_alien_research_icon_composition() },

	-- TECHNOLOGY EFFECTS
	["bob-infinite-worker-robots-storage-4"] = {
		composition = IconComposition:from_icon(
			{ icon = "__base__/graphics/technology/worker-robots-storage.png", icon_size = 256 },
			nil,
			"technology"
		):add_symbol(_assets.icons.get_technology_constant(_assets.defines.technology_constant.capacity)),
	},
}

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)

-- Overwrite icons for technology effects
data.raw["utility-sprites"].default.worker_robot_storage_modifier_icon = util.merge({
	data.raw["utility-sprites"].default.worker_robot_storage_modifier_icon,
	{
		filename = "__base__/graphics/icons/logistic-robot.png",
		flags = { "gui-icon" },
		width = 64,
		height = 64,
		mipmap_count = 4,
	},
})

data.raw["utility-sprites"].default.worker_robot_speed_modifier_icon = util.merge({
	data.raw["utility-sprites"].default.worker_robot_speed_modifier_icon,
	{
		filename = "__base__/graphics/icons/logistic-robot.png",
		flags = { "gui-icon" },
		width = 64,
		height = 64,
		mipmap_count = 4,
	},
})

-- Set infer_icon properties for associated technologies
local technology_infer_icon_list = {
	"worker-robots-storage-1",
	"worker-robots-storage-2",
	"worker-robots-storage-3",
	"bob-infinite-worker-robots-storage-4",
	"worker-robots-speed-1",
	"worker-robots-speed-2",
	"worker-robots-speed-3",
	"worker-robots-speed-4",
	"worker-robots-speed-5",
	"worker-robots-speed-6",
}

for _, tech in pairs(technology_infer_icon_list) do
	if data.raw.technology[tech] then
		data.raw.technology[tech].effects[1].infer_icon = false
	end
end
-- TODO: Redesign this to be a function that scans through technology table for a whitelist of effects and then sets infer_icon for those effects
-- TODO: Move tech effect icon overwrites to its own function/file, along with the above
