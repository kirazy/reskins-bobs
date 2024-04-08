-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.revamp.items) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "bobs",
    group = "revamp",
    make_icon_pictures = false,
    flat_icon = true,
}

---@type CreateIconsFromListTable
local intermediates = {
    ["brine"] = { type = "fluid", subgroup = "fluids" },
    ["ammoniated-brine"] = { type = "fluid", subgroup = "fluids" },
    ["heat-shield-tile"] = { type = "item" },
}

-- Items and recipes shared with other mods within Bob's suite
if not mods["bobplates"] then
    intermediates["solid-fuel-from-sour-gas"] = { type = "recipe", group = "plates", subgroup = "recipes" }
end

reskins.internal.create_icons_from_list(intermediates, inputs)

-- A map of recipe names to the icon sources used to create a combined icon.
-- The first entry in each IconSources is the first layer of the created icon.
---@type { [string]: IconSources }
local recipe_icon_source_map = {
    ["ammonium-chloride-recycling"] = {
        { name = "ammonium-chloride", type_name = "item" },
        { name = "ammonia", type_name = "fluid", scale = 0.375, shift = { -10, 11 } },
        { name = "calcium-chloride", type_name = "item", scale = 0.375, shift = { 10, 11 } },
    },
}

reskins.lib.icons.create_and_assign_combined_icons_from_sources_to_recipe(recipe_icon_source_map)
