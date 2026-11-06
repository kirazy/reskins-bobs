-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local LaserBeam = require("__reskins-assets-api__.assets.base.entities.laser-beam")

if not mods["bobwarfare"] then
	return
end

local beams = {
	["bob-laser-beam-glass"] = { lens = "glass" },
	["bob-laser-beam-sapphire"] = { lens = "sapphire" },
	["bob-laser-beam-emerald"] = { lens = "emerald" },
	["bob-laser-beam-amethyst"] = { lens = "amethyst" },
	["bob-laser-beam-topaz"] = { lens = "topaz" },
	["bob-laser-beam-diamond"] = { lens = "diamond" },
	["bob-laser-beam-glass-ammo"] = { lens = "glass" },
	["bob-laser-beam-ruby-ammo"] = { lens = "ruby" },
	["bob-laser-beam-sapphire-ammo"] = { lens = "sapphire" },
	["bob-laser-beam-emerald-ammo"] = { lens = "emerald" },
	["bob-laser-beam-amethyst-ammo"] = { lens = "amethyst" },
	["bob-laser-beam-topaz-ammo"] = { lens = "topaz" },
	["bob-laser-beam-diamond-ammo"] = { lens = "diamond" },
}

for name, options in pairs(beams) do
	local beam = data.raw["beam"][name]
	if beam then
		beam.graphics_set = LaserBeam.get_graphics_set({ lens = options.lens })
	end
end
