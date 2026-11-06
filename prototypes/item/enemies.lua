-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobenemies"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local AlienArtifacts = require("__reskins-assets-api__.assets.bobs.items.alien-artifacts")
local AlienArtifactsSmall = require("__reskins-assets-api__.assets.bobs.items.alien-artifacts-small")

_framework.tiers.assign_icons_with_tier_labels("item", {
	["bob-alien-artifact"] = { composition = AlienArtifacts.get_icon_composition({ color = "pink" }) },
	["bob-alien-artifact-blue"] = { composition = AlienArtifacts.get_icon_composition({ color = "blue" }) },
	["bob-alien-artifact-green"] = { composition = AlienArtifacts.get_icon_composition({ color = "green" }) },
	["bob-alien-artifact-orange"] = { composition = AlienArtifacts.get_icon_composition({ color = "orange" }) },
	["bob-alien-artifact-purple"] = { composition = AlienArtifacts.get_icon_composition({ color = "purple" }) },
	["bob-alien-artifact-red"] = { composition = AlienArtifacts.get_icon_composition({ color = "red" }) },
	["bob-alien-artifact-yellow"] = { composition = AlienArtifacts.get_icon_composition({ color = "yellow" }) },

	["bob-small-alien-artifact"] = { composition = AlienArtifactsSmall.get_icon_composition({ color = "pink" }) },
	["bob-small-alien-artifact-blue"] = {
		composition = AlienArtifactsSmall.get_icon_composition({ color = "blue" }),
	},
	["bob-small-alien-artifact-green"] = {
		composition = AlienArtifactsSmall.get_icon_composition({ color = "green" }),
	},
	["bob-small-alien-artifact-orange"] = {
		composition = AlienArtifactsSmall.get_icon_composition({ color = "orange" }),
	},
	["bob-small-alien-artifact-purple"] = {
		composition = AlienArtifactsSmall.get_icon_composition({ color = "purple" }),
	},
	["bob-small-alien-artifact-red"] = {
		composition = AlienArtifactsSmall.get_icon_composition({ color = "red" }),
	},
	["bob-small-alien-artifact-yellow"] = {
		composition = AlienArtifactsSmall.get_icon_composition({ color = "yellow" }),
	},
})
