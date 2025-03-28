-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if reskins.lib.settings.get_value("cp-override-modules") == false then --[[ Do nothing ]]
elseif mods["CircuitProcessing"] then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.modules.technologies) then
	return
end

-- Modules
local modules_map = {
	["speed"] = { color = "blue" },
	["efficiency"] = { color = "yellow" },
	["productivity"] = { color = "red" },
	["pollution-create"] = { color = "brown" },
	["pollution-clean"] = { color = "pine" },
	["green"] = { color = "green" },
}

-- Setup inputs
local inputs = {
	directory = reskins.bobs.directory,
	mod = "bobs",
	group = "modules",
	type = "technology",
	technology_icon_size = 256,
}

-- Setup input defaults
reskins.lib.set_inputs_defaults(inputs)

local function get_real_module_name(class, tier)
	-- Vanilla modules have no 'bob-' prefix
	local modules_name_map = {
		["bob-productivity-module-1"] = "productivity-module",
		["bob-productivity-module-2"] = "productivity-module-2",
		["bob-productivity-module-3"] = "productivity-module-3",
		["bob-efficiency-module-1"] = "efficiency-module",
		["bob-efficiency-module-2"] = "efficiency-module-2",
		["bob-efficiency-module-3"] = "efficiency-module-3",
		["bob-speed-module-1"] = "speed-module",
		["bob-speed-module-2"] = "speed-module-2",
		["bob-speed-module-3"] = "speed-module-3",
	}

	local name = "bob-" .. class .. "-module-" .. tier

	if modules_name_map[name] then
		name = modules_name_map[name]
	end

	return name
end

for class, map in pairs(modules_map) do
	-- Do all tiers
	for tier = 1, 5 do
		-- Naming convention exception handling
		local name = get_real_module_name(class, tier)

		-- Fetch technology
		local technology = data.raw[inputs.type][name]

		-- Check if technology exists, if not, skip this iteration
		if not technology then
			goto continue
		end

		-- Setup icon path
		inputs.technology_icon_filename = "__reskins-bobs__/graphics/technology/modules/module/" .. map.color .. "/" .. map.color .. "_" .. tier .. ".png"

		reskins.lib.construct_technology_icon(name, inputs)

		-- Label to skip to next iteration
		::continue::
	end
end

-- Reskin God module technologies
if reskins.lib.settings.get_value("bobmods-modules-enablegodmodules") then
	-- Fetch technology
	local name = "bob-god-module"
	local technology = data.raw[inputs.type][name]

	-- Check if technology exists, if not, skip this iteration
	if not technology then
		goto continue
	end

	-- Setup icon path
	inputs.technology_icon_filename = "__reskins-bobs__/graphics/technology/modules/god-module/" .. name .. ".png"
	inputs.technology_icon_layers = 1

	reskins.lib.construct_technology_icon(name, inputs)

	-- Label to skip to next iteration
	::continue::
end
