-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Assets.Bobs.UiSprites

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local CircuitsStandard = require("__reskins-assets-api__.assets.bobs.ui-sprites.circuits-standard")
local CircuitsTintable = require("__reskins-assets-api__.assets.bobs.ui-sprites.circuits-tintable")

-- The description of the colored circuits setting shows these sprites, with the boards in the order of their tiers.
---@type GuiSpriteBoard[]
local boards = {
	"basic-circuit-board",
	"basic-electronic-circuit-board",
	"electronic-circuit-board",
	"electronic-logic-board",
	"electronic-processing-board",
}

for tier, board in pairs(boards) do
	-- The circuit layers do not render with partial transparency, so the alpha of the tint is set to 1.
	local tint = util.get_color_with_alpha(_framework.tiers.get_tint(tier), 1)

	data:extend({
		{
			type = "sprite",
			name = "ar-" .. board .. "-standard",
			layers = { CircuitsStandard.get_sprite({ board = board }) },
		},
		{
			type = "sprite",
			name = "ar-" .. board .. "-colored",
			layers = CircuitsTintable.get_sprite({ board = board, tint = tint }).layers,
		},
	})
end
