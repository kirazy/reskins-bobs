-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.warfare.technologies) then
	return
end

---@type CreateIconsFromListInputs
local inputs = {
	mod = "bobs",
	group = "warfare",
	type = "technology",
	technology_icon_size = 256,
	flat_icon = true,
}

---@type CreateIconsFromListTable
local technologies = {
	-- Radars
	["radar"] = { tier = 1, icon_name = "radar", flat_icon = false, technology_icon_size = 128 },
	["bob-radar-2"] = { tier = 2, icon_name = "radar", flat_icon = false, technology_icon_size = 128 },
	["bob-radar-3"] = { tier = 3, icon_name = "radar", flat_icon = false, technology_icon_size = 128 },
	["bob-radar-4"] = { tier = 4, icon_name = "radar", flat_icon = false, technology_icon_size = 128 },
	["bob-radar-5"] = { tier = 5, icon_name = "radar", flat_icon = false, technology_icon_size = 128 },

	-- Miscellaneous
	["bob-reinforced-wall"] = {},
	["bob-laser-rifle"] = {},
	["bob-scatter-cannon-shells"] = {},
	["bob-cordite-processing"] = {},

	-- Laser rifle ammo
	["bob-laser-rifle-ammo-1"] = { subgroup = "laser-rifle-ammo" },
	["bob-laser-rifle-ammo-2"] = { subgroup = "laser-rifle-ammo" },
	["bob-laser-rifle-ammo-3"] = { subgroup = "laser-rifle-ammo" },
	["bob-laser-rifle-ammo-4"] = { subgroup = "laser-rifle-ammo" },
	["bob-laser-rifle-ammo-5"] = { subgroup = "laser-rifle-ammo" },
	["bob-laser-rifle-ammo-6"] = { subgroup = "laser-rifle-ammo" },

	-- Rocketry
	["rocketry"] = { subgroup = "rocketry" },
	["bob-rocket"] = { subgroup = "rocketry" },
	["bob-piercing-rocket"] = { subgroup = "rocketry" },
	["bob-electric-rocket"] = { subgroup = "rocketry" },
	["bob-acid-rocket"] = { subgroup = "rocketry" },
	["bob-explosive-rocket"] = { subgroup = "rocketry" },
	["bob-poison-rocket"] = { subgroup = "rocketry" },
	["bob-flame-rocket"] = { subgroup = "rocketry" },
	["bob-plasma-rocket"] = { subgroup = "rocketry" },

	-- Artillery shells
	["bob-poison-artillery-shells"] = { subgroup = "artillery-shells" },
	["bob-fire-artillery-shells"] = { subgroup = "artillery-shells" },
	["bob-explosive-artillery-shells"] = { subgroup = "artillery-shells" },
	["bob-distractor-artillery-shells"] = { subgroup = "artillery-shells" },
	["bob-atomic-artillery-shell"] = { subgroup = "artillery-shells" },

	-- Mines
	["bob-poison-mine"] = { subgroup = "mines" },
	["bob-slowdown-mine"] = { subgroup = "mines" },
	["bob-distractor-mine"] = { subgroup = "mines" },

	-- Shotgun shells
	["bob-shotgun-acid-shells"] = { subgroup = "shotgun-shells" },
	["bob-shotgun-ap-shells"] = { subgroup = "shotgun-shells" },
	["bob-shotgun-electric-shells"] = { subgroup = "shotgun-shells" },
	["bob-shotgun-flame-shells"] = { subgroup = "shotgun-shells" },
	["bob-shotgun-explosive-shells"] = { subgroup = "shotgun-shells" },
	["bob-shotgun-plasma-shells"] = { subgroup = "shotgun-shells" },
	["bob-shotgun-poison-shells"] = { subgroup = "shotgun-shells" },
	["bob-shotgun-shells"] = { subgroup = "shotgun-shells" },

	-- Bullet magazines
	["bob-acid-bullets"] = { subgroup = "bullet-magazines" },
	["bob-ap-bullets"] = { subgroup = "bullet-magazines" },
	["bob-bullets"] = { subgroup = "bullet-magazines" },
	["bob-electric-bullets"] = { subgroup = "bullet-magazines" },
	["bob-flame-bullets"] = { subgroup = "bullet-magazines" },
	["bob-he-bullets"] = { subgroup = "bullet-magazines" },
	["bob-plasma-bullets"] = { subgroup = "bullet-magazines" },
	["bob-poison-bullets"] = { subgroup = "bullet-magazines" },
	["uranium-ammo"] = { subgroup = "bullet-magazines" },
}

if mods["aai-industry"] then
	technologies["radar"] = { tier = 1, icon_name = "radar", flat_icon = false, technology_icon_size = 128 }
end

reskins.internal.create_icons_from_list(technologies, inputs)
