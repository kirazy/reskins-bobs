-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _framework = { settings = require("__reskins-framework__.api.settings") }

---Defines the colors of the furnace variants.
---@class FurnaceTints
---The color of the standard furnaces.
---@field standard Color
---The color of the mixing furnaces.
---@field mixing Color
---The color of the chemical furnaces.
---@field chemical Color

local use_custom_colors = _framework.settings.get_value("reskins-bobs-do-custom-furnace-variants") == true

---Gets the color for a furnace variant, which is the value of the given `setting` when the custom furnace colors are
---used, or the given `default` when they are not.
---@param setting string The name of the color setting for the variant.
---@param default Color The color of the variant when the custom furnace colors are not used.
---@return Color
local function get_tint(setting, default)
	return use_custom_colors and _framework.settings.get_value(setting) --[[@as Color]] or default
end

---The color of each furnace variant.
---@type FurnaceTints
local furnace_tints = {
	standard = get_tint("reskins-bobs-standard-furnace-color", util.color("#ffb700")),
	mixing = get_tint("reskins-bobs-mixing-furnace-color", util.color("#00bfff")),
	chemical = get_tint("reskins-bobs-chemical-furnace-color", util.color("#f21f0c")),
}

return furnace_tints
