-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.logistics.technologies) then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}
local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	icons = require("__reskins-assets-api__.api.icons"),
}
local IconComposition = require("__reskins-sprite-utils__.icon-composition")

local Icons = require("__reskins-assets-api__.assets.bobs.technologies.icons")
local Inserter = require("__reskins-assets-api__.assets.base.technologies.inserter")
local InserterBulk = require("__reskins-assets-api__.assets.base.technologies.inserter-bulk")
local RepairPack = require("__reskins-assets-api__.assets.bobs.technologies.repair-pack")
local Robotics = require("__reskins-assets-api__.assets.base.technologies.robotics")
local Robots = require("__reskins-assets-api__.assets.base.technologies.robots")

---Gets the definition of the technology icon of the base game with the given `name`, with the capacity constant.
---@param name string The name of the file in `__base__/graphics/technology`, without its extension.
---@return TieredIconDefinition
local function get_capacity_definition(name)
	return {
		composition = IconComposition:from_icon(
			{ icon = "__base__/graphics/technology/" .. name .. ".png", icon_size = 256 },
			nil,
			"technology"
		):add_symbol(_assets.icons.get_technology_constant(_assets.defines.technology_constant.capacity)),
	}
end

-- The icon of each technology is created by its module, in the tint of its tier or in its own `tint`.
local technologies = {
	-- Fluid wagons
	-- ["fluid-wagon"] = {tier = 1, prog_tier = 2},
	-- ["bob-fluid-wagon-2"] = {tier = 1, prog_tier = 3},
	-- ["bob-fluid-wagon-3"] = {tier = 1, prog_tier = 4},
	-- ["bob-armoured-fluid-wagon"] = {tier = 1, prog_tier = 3},
	-- ["bob-armoured-fluid-wagon-2"] = {tier = 1, prog_tier = 4},

	-- Trains and cargo wagons
	-- ["railway"] = {tier = 1, prog_tier = 2},
	-- ["bob-railway-2"] = {tier = 1, prog_tier = 3},
	-- ["bob-railway-3"] = {tier = 1, prog_tier = 4},
	-- ["bob-armoured-railway"] = {tier = 1, prog_tier = 3},
	-- ["bob-armoured-railway-2"] = {tier = 1, prog_tier = 4},

	-- Roboports
	-- ["bob-robo-modular-1"] = {tier = 1, prog_tier = 2},
	-- ["bob-robo-modular-2"] = {tier = 2, prog_tier = 3},
	-- ["bob-robo-modular-3"] = {tier = 3, prog_tier = 4},
	-- ["bob-robo-modular-4"] = {tier = 4, prog_tier = 5},

	-- Repair packs
	["bob-repair-pack-2"] = { module = RepairPack, tier = 2 },
	["bob-repair-pack-3"] = { module = RepairPack, tier = 3 },
	["bob-repair-pack-4"] = { module = RepairPack, tier = 4 },
	["bob-repair-pack-5"] = { module = RepairPack, tier = 5 },

	-- Fluid Handling
	-- ["fluid-handling"] = {flat_icon = false, tier = 1, prog_tier = 2, icon_name = "fluid-handling"}, -- handled by technology/plates.lua
	-- ["bob-fluid-handling-2"] = {flat_icon = false, tier = 2, prog_tier = 3, icon_name = "fluid-handling"}, -- handled by technology/plates.lua
	-- ["bob-fluid-handling-3"] = {flat_icon = false, tier = 3, prog_tier = 4, icon_name = "fluid-handling"}, -- handled by technology/plates.lua
	-- ["bob-fluid-handling-4"] = {flat_icon = false, tier = 4, prog_tier = 5, icon_name = "fluid-handling"}, -- handled by technology/plates.lua

	-- Robot frames
	["robotics"] = { module = Robotics, tier = 1, prog_tier = 2 },
	["bob-robotics-2"] = { module = Robotics, tier = 2, prog_tier = 3 },
	["bob-robotics-3"] = { module = Robotics, tier = 3, prog_tier = 4 },
	["bob-robotics-4"] = { module = Robotics, tier = 4, prog_tier = 5 },

	-- Construction/Logistic robots
	-- ["construction-robots"] = {tier = 1},
	-- ["logistic-robots"] = {tier = 1},
	["bob-robots-1"] = { module = Robots, tier = 2 },
	["bob-robots-2"] = { module = Robots, tier = 3 },
	["bob-robots-3"] = { module = Robots, tier = 4 },
	["bob-robots-4"] = { module = Robots, tier = 5 },

	-- Logistic systems
	-- ["logistic-system"] = {tier = 1, prog_tier = 2},
	-- ["logistic-system-2"] = {tier = 2, prog_tier = 3},
	-- ["logistic-system-3"] = {tier = 3, prog_tier = 4},
}

---@type table<string, TieredIconDefinition>
local definitions = {
	-- TECHNOLOGY EFFECTS
	-- Bulk inserter capacities
	["inserter-capacity-bonus-1"] = get_capacity_definition("bulk-inserter"),
	["inserter-capacity-bonus-2"] = get_capacity_definition("bulk-inserter"),
	["inserter-capacity-bonus-3"] = get_capacity_definition("bulk-inserter"),
	["inserter-capacity-bonus-4"] = get_capacity_definition("bulk-inserter"),
	["inserter-capacity-bonus-5"] = get_capacity_definition("bulk-inserter"),
	["inserter-capacity-bonus-6"] = get_capacity_definition("bulk-inserter"),
	["inserter-capacity-bonus-7"] = get_capacity_definition("bulk-inserter"),
	["inserter-capacity-bonus-8"] = get_capacity_definition("bulk-inserter"),

	-- Inserter capacities
	["inserter-stack-size-bonus-1"] = get_capacity_definition("inserter-capacity"),
	["inserter-stack-size-bonus-2"] = get_capacity_definition("inserter-capacity"),
	["inserter-stack-size-bonus-3"] = get_capacity_definition("inserter-capacity"),
	["inserter-stack-size-bonus-4"] = get_capacity_definition("inserter-capacity"),

	-- Toolbelt capacity
	["toolbelt"] = get_capacity_definition("toolbelt"),
	["toolbelt-2"] = get_capacity_definition("toolbelt"),
	["toolbelt-3"] = get_capacity_definition("toolbelt"),
	["toolbelt-4"] = get_capacity_definition("toolbelt"),
	["toolbelt-5"] = get_capacity_definition("toolbelt"),
}

-- Disable select items based on Bob's settings
-- if (reskins.lib.setting.get_value("bobmods-logistics-flyingrobotframes") == false
--     or reskins.lib.setting.get_value("bobmods-logistics-robotparts") == false) then
--     technologies["robotics"] = nil
-- end

-- Set fusion robot color
if _framework.tiers.use_progression and _framework.settings.get_value("reskins-bobs-do-progression-based-robots") then
	-- technologies["construction-robots"].prog_tier = 2
	-- technologies["logistic-robots"].prog_tier = 2
	technologies["bob-robots-1"].prog_tier = 3
	technologies["bob-robots-2"].prog_tier = 4
	technologies["bob-robots-3"].prog_tier = 5
	technologies["bob-robots-4"].tint = _framework.settings.get_value("reskins-bobs-fusion-robot-color")
end

-- Load which set of inserter technologies are to be reskinned
if _framework.settings.get_value("bobmods-logistics-inserteroverhaul") == true then
	-- Standard inserters
	technologies["fast-inserter"] = { module = Inserter, tier = 2 }
	technologies["bob-express-inserter"] = { module = Inserter, tier = 3 }
	technologies["bob-turbo-inserter"] = { module = Inserter, tier = 4 }
	technologies["bob-ultimate-inserter"] = { module = Inserter, tier = 5 }

	-- Bulk inserters
	technologies["bulk-inserter"] = { module = InserterBulk, tier = 2 }
	technologies["bob-bulk-inserter-2"] = { module = InserterBulk, tier = 3 }
	technologies["bob-bulk-inserter-3"] = { module = InserterBulk, tier = 4 }
	technologies["bob-bulk-inserter-4"] = { module = InserterBulk, tier = 5 }
else
	definitions["bob-long-inserters-1"] = { composition = Icons.get_long_inserters_1_icon_composition() }
	-- technologies["fast-inserter"] = {} -- fine as-is
	definitions["bob-express-inserter"] = { composition = Icons.get_express_inserter_icon_composition() } -- green/pink
	definitions["bulk-inserter"] = { composition = Icons.get_bulk_inserter_icon_composition() } -- green/white
	definitions["bob-bulk-inserter-2"] = { composition = Icons.get_bulk_inserter_2_icon_composition() } -- rich green/gray
end

for name, options in pairs(technologies) do
	local tint = options.tint or _framework.tiers.get_tint(_framework.tiers.get_tier(options))

	definitions[name] = { composition = options.module.get_icon_composition({ tint = tint }) }
end

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)

-- Overwrite icons for technology effects
data.raw["utility-sprites"].default.bulk_inserter_capacity_bonus_modifier_icon.filename =
	"__reskins-bobs__/graphics/icons/logistics/inserter/bulk-inserter-technology-effect-icon.png"
