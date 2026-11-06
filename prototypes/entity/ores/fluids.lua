-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework
---@using Reskins.Assets.Bobs.Entities

if not mods["bobores"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Ores = require("__reskins-assets-api__.assets.bobs.items.ores")
local OreStages = require("__reskins-assets-api__.assets.bobs.entities.ores")

_framework.tiers.assign_icons_with_tier_labels("resource", {
	["bob-ground-water"] = { composition = Ores.get_ground_water_icon_composition() },
	["bob-lithia-water"] = { composition = Ores.get_lithia_water_icon_composition() },
})

---@type table<string, FluidResource>
local fluids = {
	["bob-ground-water"] = "ground-water",
	["bob-lithia-water"] = "lithia-water",
}

for name, fluid in pairs(fluids) do
	local entity = data.raw["resource"][name]
	if not entity then
		goto continue
	end

	entity.stages = OreStages.get_fluid_stages({ fluid = fluid })

	::continue::
end
