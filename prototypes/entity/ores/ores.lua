-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not mods["bobores"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Ores = require("__reskins-assets-api__.assets.bobs.items.ores")
local OreStages = require("__reskins-assets-api__.assets.bobs.entities.ores")
local SpaceAgeIcons = require("__reskins-assets-api__.assets.base.items.space-age-icons")

local ores = {
	-- Pure Bob's
	-- ["gem-ore"] = { key = "bobs", subfolder = "ores" },
	["bob-lead-ore"] = { ore = "lead-ore" }, -- 404040
	["bob-rutile-ore"] = { ore = "rutile-ore" },
	["bob-thorium-ore"] = { ore = "thorium-ore" },
	["bob-tin-ore"] = { ore = "tin-ore" },

	-- Shared with Angel's
	["bob-bauxite-ore"] = { ore = "bauxite-ore" },
	["bob-cobalt-ore"] = { ore = "cobalt-ore" },
	["bob-gold-ore"] = { ore = "gold-ore" },
	["bob-nickel-ore"] = { ore = "nickel-ore" }, -- 408073
	["bob-quartz"] = { ore = "quartz" }, -- 999999
	["bob-silver-ore"] = { ore = "silver-ore" },
	["bob-zinc-ore"] = { ore = "zinc-ore" },
}

-- The icon of a resource is assigned with its pictures to the item of the same name.
---@type table<string, TieredIconDefinition>
local resources = {}

-- Bob's mods use the name of the tungsten ore from Space Age. When Space Age is loaded, the ore keeps the stages from
-- Space Age and uses the icon from Space Age.
if mods["space-age"] then
	resources["tungsten-ore"] = { composition = SpaceAgeIcons.get_tungsten_ore_icon_composition() }
else
	ores["tungsten-ore"] = { ore = "tungsten-ore" }
end

for name, params in pairs(ores) do
	local entity = data.raw["resource"][name]
	if not entity then
		goto continue
	end

	entity.stages = OreStages.get_stages({ ore = params.ore })

	-- Radioactive glow
	if name == "bob-thorium-ore" then
		entity.stages_effect = OreStages.get_stages_effect({ ore = params.ore })
		resources[name] = { composition = Ores.get_thorium_ore_icon_composition() }
	else
		resources[name] = { composition = Ores.get_icon_composition({ ore = params.ore }) }
	end

	::continue::
end

_framework.tiers.assign_icons_with_tier_labels("resource", resources)
