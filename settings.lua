-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local util = require("util")

-- Settings available based on mod loadout
if mods["bobassembly"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-bobs-do-furnace-tier-labeling",
			setting_type = "startup",
			order = "x",
			default_value = true,
		},
	})
end

if mods["bobassembly"] or mods["bobplates"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-bobs-do-custom-furnace-variants",
			setting_type = "startup",
			order = "y3",
			default_value = false,
		},
		{
			type = "color-setting",
			name = "reskins-bobs-standard-furnace-color",
			setting_type = "startup",
			order = "y3x",
			default_value = util.color("#ffb700"),
			localised_description = {
				"",
				{ "mod-setting-description.reskins-bobs-standard-furnace-color" },
				"\n\n",
				{ "reskins-defaults.default" },
				" ",
				{ "reskins-defaults.standard-furnace-color" },
			},
		},
		{
			type = "color-setting",
			name = "reskins-bobs-mixing-furnace-color",
			setting_type = "startup",
			order = "y3y",
			default_value = util.color("#00bfff"),
			localised_description = {
				"",
				{ "mod-setting-description.reskins-bobs-mixing-furnace-color" },
				"\n\n",
				{ "reskins-defaults.default" },
				" ",
				{ "reskins-defaults.mixing-furnace-color" },
			},
		},
		{
			type = "color-setting",
			name = "reskins-bobs-chemical-furnace-color",
			setting_type = "startup",
			order = "y3z",
			default_value = util.color("#f21f0c"),
			localised_description = {
				"",
				{ "mod-setting-description.reskins-bobs-chemical-furnace-color" },
				"\n\n",
				{ "reskins-defaults.default" },
				" ",
				{ "reskins-defaults.chemical-furnace-color" },
			},
		},
	})
end

if mods["bobelectronics"] then
	local colored_circuits_locale = {
		"",
		{ "mod-setting-description.reskins-bobs-do-bobelectronics-colored-circuits" },
		{ "reskins-bobs.reskins-bobs-colored-circuits-off" },
		{ "reskins-bobs.reskins-bobs-colored-circuits-on" },
	}
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-bobs-do-bobelectronics-colored-circuits",
			setting_type = "startup",
			default_value = false,
			localised_description = colored_circuits_locale,
		},
	})
end

if mods["boblogistics"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-bobs-do-inserter-tier-labeling",
			setting_type = "startup",
			order = "xx",
			default_value = true,
		},
		{
			type = "bool-setting",
			name = "reskins-bobs-flip-bulk-inserter-icons",
			setting_type = "startup",
			order = "xx",
			default_value = false,
		},
		{
			type = "bool-setting",
			name = "reskins-bobs-do-progression-based-robots",
			setting_type = "startup",
			order = "y2",
			default_value = true,
		},
		{
			type = "color-setting",
			name = "reskins-bobs-fusion-robot-color",
			setting_type = "startup",
			order = "y2y",
			default_value = util.color("#e5e5e5"),
			localised_description = {
				"",
				{ "mod-setting-description.reskins-bobs-fusion-robot-color" },
				"\n\n",
				{ "reskins-defaults.default" },
				" ",
				{ "reskins-defaults.fusion-robot-color" },
			},
		},
	})
end

if mods["bobpower"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-bobs-hydrazine-is-blue",
			setting_type = "startup",
			default_value = true,
		},
	})
end

if mods["bobplates"] and mods["bobpower"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-bobs-do-bobrevamp-reactor-color",
			setting_type = "startup",
			default_value = true,
		},
	})
end

if mods["bobtech"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-bobs-show-alien-decoratives-on-lab",
			setting_type = "startup",
			default_value = true,
			hidden = true,
		},
	})
end
