-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not (reskins.bobs and reskins.bobs.triggers.assembly.entities) then
	return
end

-- ASSEMBLY MACHINES (Note: Bob sets up in data-updates)
-- Flag available for Mini-Machines compatibility pass
if reskins.compatibility then
	reskins.compatibility.triggers.minimachines.assemblers = true
end

local is_progression = reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map"

-- CHEMICAL PLANTS (Note: Bob sets up in data-updates)
if reskins.lib.settings.get_value("bobmods-assembly-chemicalplants") then
	-- Set flag for availability for Mini-Machines compatibility pass
	if reskins.compatibility then
		reskins.compatibility.triggers.minimachines.chemplants.bobs = true
	end

	local tier_map = {
		["chemical-plant"] = { tier = 1, prog_tier = 2 },
		["bob-chemical-plant-2"] = { tier = 2, prog_tier = 3 },
		["bob-chemical-plant-3"] = { tier = 3, prog_tier = 4 },
		["bob-chemical-plant-4"] = { tier = 4, prog_tier = 5 },
	}

	for name, map in pairs(tier_map) do
		reskins.lib.apply_skin.chemical_plant(name, is_progression and map.prog_tier or map.tier)
	end
end
