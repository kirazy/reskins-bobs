-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobelectronics"] then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

if not _framework.settings.get_value("reskins-bobs-do-bobelectronics-colored-circuits") then
	return
end

local CircuitsProgression = require("__reskins-assets-api__.assets.bobs.items.circuits-progression")
local CircuitsTintable = require("__reskins-assets-api__.assets.bobs.items.circuits-tintable")

local circuit_map = {
	["bob-basic-circuit-board"] = { tier = 1, board = "basic-circuit-board" },
	["electronic-circuit"] = { tier = 2, board = "basic-electronic-circuit-board" },
	["advanced-circuit"] = { tier = 3, board = "electronic-circuit-board" },
	["processing-unit"] = { tier = 4, board = "electronic-logic-board" },
	["bob-advanced-processing-unit"] = { tier = 5, board = "electronic-processing-board" },

	["bob-circuit-board"] = { tier = 3, board = "circuit-board" },
	["bob-superior-circuit-board"] = { tier = 4, board = "superior-circuit-board" },
	["bob-multi-layer-circuit-board"] = { tier = 5, board = "multi-layer-circuit-board" },
}

local do_custom_color = _framework.settings.get_value("reskins-framework-use-custom-tier-colors") == true

---@type table<string, TieredIconDefinition>
local items = {}

for name, options in pairs(circuit_map) do
	if do_custom_color then
		-- The circuit layers do not render with partial transparency, so the alpha of the tint is set to 1.
		local tint = util.get_color_with_alpha(_framework.tiers.get_tint(options.tier), 1)

		items[name] = { composition = CircuitsTintable.get_icon_composition({ board = options.board, tint = tint }) }
	else
		items[name] = { composition = CircuitsProgression.get_icon_composition({ board = options.board }) }
	end
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
