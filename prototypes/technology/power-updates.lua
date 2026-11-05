-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.Framework
---@using Reskins.Library.Internal

local nuclear_reactors = require("prototypes.functions.nuclear-reactors")

if not (reskins.bobs and reskins.bobs.triggers.power.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local SteamEngine = require("__reskins-assets-api__.assets.bobs.technologies.steam-engine")

---@type table<string, TieredIconDefinition>
local definitions = {
	-- Bob technology burner phase
	["bob-steam-engine-1"] = {
		composition = SteamEngine.get_icon_composition({ tint = _framework.tiers.get_tint(1) }),
	},
}

_framework.tiers.assign_icons_with_tier_labels("technology", definitions)

-- The icons of the nuclear power technologies are assigned from the files of reskins-bobs.

---@type CreateIconsFromListInputs
local inputs = {
	mod = "bobs",
	group = "power",
	type = "technology",
	technology_icon_size = 256,
}

---@type CreateIconsFromListTable
local technologies = {}

local material_tiers = {
	"aluminum-invar",
	"silver-titanium",
	"gold-copper",
}

-- Nuclear reactors
if reskins.bobs.triggers.power.nuclear then
	technologies["nuclear-power"] = {
		tier = 1,
		prog_tier = 3,
		icon_name = "nuclear-power",
		icon_base = "nuclear-power-" .. nuclear_reactors["nuclear-reactor"].fuel .. "-" .. material_tiers[1],
		tint = nuclear_reactors["nuclear-reactor"].tint,
	}
	technologies["bob-nuclear-power-2"] = {
		tier = 2,
		prog_tier = 4,
		icon_name = "nuclear-power",
		icon_base = "nuclear-power-" .. nuclear_reactors["bob-nuclear-reactor-2"].fuel .. "-" .. material_tiers[2],
		tint = nuclear_reactors["bob-nuclear-reactor-2"].tint,
	}
	technologies["bob-nuclear-power-3"] = {
		tier = 3,
		prog_tier = 5,
		icon_name = "nuclear-power",
		icon_base = "nuclear-power-" .. nuclear_reactors["bob-nuclear-reactor-3"].fuel .. "-" .. material_tiers[3],
		tint = nuclear_reactors["bob-nuclear-reactor-3"].tint,
	}
end

reskins.internal.create_icons_from_list(technologies, inputs)
