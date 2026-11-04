-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data
---@using Reskins.SpriteUtils

local _lib = require("_lib")
local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Inserter = require("__reskins-assets-api__.assets.base.entities.inserter")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end
if not _framework.settings.get_value("bobmods-logistics-inserteroverhaul") then
	return
end

local entities = {
	-- Standard inserters
	["inserter"] = { tier = 1 },
	["bob-red-inserter"] = { tier = 2 },
	["long-handed-inserter"] = { tier = 2 },
	["fast-inserter"] = { tier = 3 },
	["bob-turbo-inserter"] = { tier = 4 },
	["bob-express-inserter"] = { tier = 5 },

	-- Bulk inserters
	["bob-red-bulk-inserter"] = { tier = 2, is_bulk = true },
	["bulk-inserter"] = { tier = 3, is_bulk = true },
	["bob-turbo-bulk-inserter"] = { tier = 4, is_bulk = true },
	["bob-express-bulk-inserter"] = { tier = 5, is_bulk = true },
}

local TYPE = "inserter"

local do_labels = _framework.settings.get_value("reskins-bobs-do-inserter-tier-labeling") == true
local flip_bulk_icons = _framework.settings.get_value("reskins-bobs-flip-bulk-inserter-icons") == true

---Gets the icon of an inserter, or of a bulk inserter when `is_bulk` is `true`, for the given `tint`.
---@param tint Color
---@param is_bulk? boolean
---@return SafeIconData[]
local function get_icon(tint, is_bulk)
	if not is_bulk then
		return Inserter.get_icon({ tint = tint })
	elseif flip_bulk_icons then
		return Inserter.get_flipped_bulk_icon({ tint = tint })
	else
		return Inserter.get_bulk_icon({ tint = tint })
	end
end

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)
	local base_entity_name = options.is_bulk and "bulk-inserter" or "inserter"

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = base_entity_name,
		type = entity.type,
		tint = tint,
		particles = {
			["medium"] = 1,
		},
	})

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = base_entity_name,
		type = entity.type,
	})

	-- The inserter overhaul gives every inserter other than the bulk inserters long hands.
	local sprite_set = Inserter.get_sprite_set({
		tint = tint,
		variant = options.is_bulk and "inserter-bulk" or "inserter-long",
	})
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = do_labels and tier or 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = get_icon(tint, options.is_bulk),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
