-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework
---@using Reskins.SpriteUtils

if not mods["boblogistics"] then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local FlyingRobotFrame = require("__reskins-assets-api__.assets.base.items.flying-robot-frame")
local RepairPack = require("__reskins-assets-api__.assets.base.items.repair-pack")
local RoboportAntenna = require("__reskins-assets-api__.assets.bobs.items.roboport-antenna")
local RoboportChargePad = require("__reskins-assets-api__.assets.bobs.items.roboport-charge-pad")
local RoboportDoor = require("__reskins-assets-api__.assets.bobs.items.roboport-door")
local RobotTool = require("__reskins-assets-api__.assets.bobs.items.robot-tool")

---Gets the definition of the icon that the given `creator` returns in the tint of the tier given by `options`, with the
---tier label of that tier.
---@param creator fun(params: table): IconComposition The creator of the icon, which accepts a `tint` parameter.
---@param options PrototypeTierValue The tier of the prototype.
---@param params? table The other parameters of the creator.
---@return TieredIconDefinition
local function tinted(creator, options, params)
	local tier = _framework.tiers.get_tier(options)

	local creator_params = util.copy(params or {})
	creator_params.tint = _framework.tiers.get_tint(tier)

	return { composition = creator(creator_params), tier = tier }
end

-- Repair packs
_framework.tiers.assign_icons_with_tier_labels("repair-tool", {
	["repair-pack"] = tinted(RepairPack.get_icon_composition, { tier = 1 }),
	["bob-repair-pack-2"] = tinted(RepairPack.get_icon_composition, { tier = 2 }),
	["bob-repair-pack-3"] = tinted(RepairPack.get_icon_composition, { tier = 3 }),
	["bob-repair-pack-4"] = tinted(RepairPack.get_icon_composition, { tier = 4 }),
	["bob-repair-pack-5"] = tinted(RepairPack.get_icon_composition, { tier = 5 }),
})

---@type table<string, TieredIconDefinition>
local items = {
	-- Roboport parts
	["bob-roboport-chargepad-1"] = tinted(
		RoboportChargePad.get_icon_composition,
		{ tier = 1, prog_tier = 2 },
		{ tier = 1 }
	),
	["bob-roboport-chargepad-2"] = tinted(
		RoboportChargePad.get_icon_composition,
		{ tier = 2, prog_tier = 3 },
		{ tier = 2 }
	),
	["bob-roboport-chargepad-3"] = tinted(
		RoboportChargePad.get_icon_composition,
		{ tier = 3, prog_tier = 4 },
		{ tier = 3 }
	),
	["bob-roboport-chargepad-4"] = tinted(
		RoboportChargePad.get_icon_composition,
		{ tier = 4, prog_tier = 5 },
		{ tier = 4 }
	),

	["bob-roboport-antenna-1"] = { composition = RoboportAntenna.get_icon_composition({ tier = 1 }) },
	["bob-roboport-antenna-2"] = { composition = RoboportAntenna.get_icon_composition({ tier = 2 }) },
	["bob-roboport-antenna-3"] = { composition = RoboportAntenna.get_icon_composition({ tier = 3 }) },
	["bob-roboport-antenna-4"] = { composition = RoboportAntenna.get_icon_composition({ tier = 4 }) },

	["bob-roboport-door-1"] = { composition = RoboportDoor.get_icon_composition({ tier = 1 }) },
	["bob-roboport-door-2"] = { composition = RoboportDoor.get_icon_composition({ tier = 2 }) },
	["bob-roboport-door-3"] = { composition = RoboportDoor.get_icon_composition({ tier = 3 }) },
	["bob-roboport-door-4"] = { composition = RoboportDoor.get_icon_composition({ tier = 4 }) },

	-- Robot tools and parts
	["flying-robot-frame"] = tinted(FlyingRobotFrame.get_icon_composition, { tier = 1, prog_tier = 2 }),
	["bob-flying-robot-frame-2"] = tinted(FlyingRobotFrame.get_icon_composition, { tier = 2, prog_tier = 3 }),
	["bob-flying-robot-frame-3"] = tinted(FlyingRobotFrame.get_icon_composition, { tier = 3, prog_tier = 4 }),
	["bob-flying-robot-frame-4"] = tinted(FlyingRobotFrame.get_icon_composition, { tier = 4, prog_tier = 5 }),

	["bob-robot-tool-logistic"] = tinted(RobotTool.get_icon_composition, { tier = 1, prog_tier = 2 }),
	["bob-robot-tool-logistic-2"] = tinted(RobotTool.get_icon_composition, { tier = 2, prog_tier = 3 }),
	["bob-robot-tool-logistic-3"] = tinted(RobotTool.get_icon_composition, { tier = 3, prog_tier = 4 }),
	["bob-robot-tool-logistic-4"] = tinted(RobotTool.get_icon_composition, { tier = 4, prog_tier = 5 }),

	["bob-robot-tool-construction"] = tinted(RobotTool.get_icon_composition, { tier = 1, prog_tier = 2 }),
	["bob-robot-tool-construction-2"] = tinted(RobotTool.get_icon_composition, { tier = 2, prog_tier = 3 }),
	["bob-robot-tool-construction-3"] = tinted(RobotTool.get_icon_composition, { tier = 3, prog_tier = 4 }),
	["bob-robot-tool-construction-4"] = tinted(RobotTool.get_icon_composition, { tier = 4, prog_tier = 5 }),
}

-- Disable select items based on Bob's settings
if
	_framework.settings.get_value("bobmods-logistics-flyingrobotframes") == false
	or _framework.settings.get_value("bobmods-logistics-robotparts") == false
then
	items["flying-robot-frame"] = nil
end

_framework.tiers.assign_icons_with_tier_labels("item", items)
