-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using Reskins.Library.Internal

local nuclear_reactors = require("prototypes.functions.nuclear-reactors")

if not (reskins.bobs and reskins.bobs.triggers.power.technologies) then
	return
end

---@type CreateIconsFromListInputs
local inputs = {
	mod = "bobs",
	group = "power",
	type = "technology",
	technology_icon_size = 256,
}

---@type CreateIconsFromListTable
local technologies = {
	["bob-steam-engine-1"] = { tier = 1, icon_name = "steam-engine", technology_icon_size = 128 }, -- Bob technology burner phase
}

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
