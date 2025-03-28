-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

if not (reskins.bobs and reskins.bobs.triggers.modules.items) then
	return
end

-- Intermediates, courtesy of Maxi (mxcop).
-- https://github.com/mxcop/maxi-reskins/tree/main

---@type CreateIconsFromListInputs
local intermediate_inputs = {
	directory = reskins.bobs.directory,
	mod = "bobs",
	group = "modules",
	make_icon_pictures = false,
	flat_icon = true,
}

---@type CreateIconsFromListTable
local items = {
	["bob-module-contact"] = { subgroup = "intermediates" },
	["bob-module-processor-board"] = { subgroup = "intermediates" },
	["bob-module-processor-board-2"] = { subgroup = "intermediates" },
	["bob-module-processor-board-3"] = { subgroup = "intermediates" },
}

---@type CreateIconsFromListTable
local tools = {
	["bob-module-case"] = { subgroup = "intermediates" },
	["bob-module-circuit-board"] = { subgroup = "intermediates" },
}

local intermediates_map = {
	["bob-speed"] = { color = "blue" },
	["bob-efficiency"] = { color = "yellow" },
	["bob-productivity"] = { color = "red" },
	["bob-pollution-create"] = { color = "brown" },
	["bob-pollution-clean"] = { color = "green" },
}

for name, map in pairs(intermediates_map) do
	tools[name .. "-processor"] = { subgroup = "intermediates/" .. map.color, image = map.color .. "-processor" }
	items[name .. "-processor-2"] = { subgroup = "intermediates/" .. map.color, image = map.color .. "-processor-2" }
	items[name .. "-processor-3"] = { subgroup = "intermediates/" .. map.color, image = map.color .. "-processor-3" }
end

reskins.internal.create_icons_from_list(items, intermediate_inputs)
reskins.internal.create_icons_from_list(tools, intermediate_inputs)

-- When Bob's module research is a thing, the type changes.
local tool_inputs = util.copy(intermediate_inputs)
tool_inputs.type = "tool"
reskins.internal.create_icons_from_list(tools, tool_inputs)
