-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.electronics.technologies) then
	return
end

---@type CreateIconsFromListInputs
local inputs = {
	mod = "bobs",
	group = "electronics",
	type = "technology",
	technology_icon_size = 256,
	flat_icon = true,
}

---@type CreateIconsFromListTable
local technologies = {
	-- solder, solder plate, insulated wire, basic circuit, resistor, tin wire
	-- ["electronics"] = {},

	-- Advanced electronics
	-- ["advanced-electronics"] = {},

	-- FIXME: The icon is gone in 2.0. Bundled from 1.1 for now.
	-- https://github.com/kirazy/reskins-bobs/issues/101
	["bob-advanced-processing-unit"] = {},
}

reskins.internal.create_icons_from_list(technologies, inputs)
