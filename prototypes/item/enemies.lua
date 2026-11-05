-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.enemies.items) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local AlienArtifacts = require("__reskins-assets-api__.assets.bobs.items.alien-artifacts")
local AlienArtifactsSmall = require("__reskins-assets-api__.assets.bobs.items.alien-artifacts-small")

_framework.tiers.assign_icons_with_tier_labels("item", {
	["bob-alien-artifact"] = { composition = AlienArtifacts.get_alien_artifact_icon_composition() },
	["bob-alien-artifact-blue"] = { composition = AlienArtifacts.get_alien_artifact_blue_icon_composition() },
	["bob-alien-artifact-green"] = { composition = AlienArtifacts.get_alien_artifact_green_icon_composition() },
	["bob-alien-artifact-orange"] = { composition = AlienArtifacts.get_alien_artifact_orange_icon_composition() },
	["bob-alien-artifact-purple"] = { composition = AlienArtifacts.get_alien_artifact_purple_icon_composition() },
	["bob-alien-artifact-red"] = { composition = AlienArtifacts.get_alien_artifact_red_icon_composition() },
	["bob-alien-artifact-yellow"] = { composition = AlienArtifacts.get_alien_artifact_yellow_icon_composition() },

	["bob-small-alien-artifact"] = { composition = AlienArtifactsSmall.get_alien_artifact_small_icon_composition() },
	["bob-small-alien-artifact-blue"] = {
		composition = AlienArtifactsSmall.get_alien_artifact_small_blue_icon_composition(),
	},
	["bob-small-alien-artifact-green"] = {
		composition = AlienArtifactsSmall.get_alien_artifact_small_green_icon_composition(),
	},
	["bob-small-alien-artifact-orange"] = {
		composition = AlienArtifactsSmall.get_alien_artifact_small_orange_icon_composition(),
	},
	["bob-small-alien-artifact-purple"] = {
		composition = AlienArtifactsSmall.get_alien_artifact_small_purple_icon_composition(),
	},
	["bob-small-alien-artifact-red"] = {
		composition = AlienArtifactsSmall.get_alien_artifact_small_red_icon_composition(),
	},
	["bob-small-alien-artifact-yellow"] = {
		composition = AlienArtifactsSmall.get_alien_artifact_small_yellow_icon_composition(),
	},
})
