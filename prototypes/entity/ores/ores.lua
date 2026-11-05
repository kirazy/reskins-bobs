-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.bobs and reskins.bobs.triggers.ores.entities) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Ores = require("__reskins-assets-api__.assets.bobs.items.ores")

local ores = {
	-- Pure Bob's
	-- ["gem-ore"] = { key = "bobs", subfolder = "ores" },
	["bob-lead-ore"] = { ore = "lead-ore" }, -- 404040
	["bob-rutile-ore"] = { ore = "rutile-ore" },
	["bob-thorium-ore"] = {},
	["bob-tin-ore"] = { ore = "tin-ore" },
	["tungsten-ore"] = { ore = "tungsten-ore", filename = "bob-tungsten-ore" },

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

for name, params in pairs(ores) do
	local entity = data.raw["resource"][name]
	if not entity then
		goto continue
	end

	local sprite_name = params.filename or name
	if params.ore then
		resources[name] = { composition = Ores.get_icon_composition({ ore = params.ore }) }
	else
		resources[name] = { composition = Ores.get_thorium_ore_icon_composition() }
	end

	entity.stages = {
		sheet = {
			filename = "__reskins-bobs__/graphics/entity/ores/" .. sprite_name .. "/" .. sprite_name .. ".png",
			priority = "extra-high",
			size = 128,
			frame_count = 8,
			variation_count = 8,
			scale = 0.5,
		},
	}

	-- Radioactive glow
	if name == "bob-thorium-ore" then
		entity.stages_effect = {
			sheet = {
				filename = "__reskins-bobs__/graphics/entity/ores/" .. name .. "/" .. name .. "-glow.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				frame_count = 8,
				variation_count = 8,
				scale = 0.5,
				blend_mode = "additive",
				flags = { "light" },
			},
		}
	end

	::continue::
end

_framework.tiers.assign_icons_with_tier_labels("resource", resources)
