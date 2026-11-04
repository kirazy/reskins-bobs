-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

---@using data

local _lib = require("_lib")
local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local InserterPreset = require("__reskins-assets-api__.assets.base.entities.inserter-preset")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

local entities
if _framework.settings.get_value("bobmods-logistics-inserteroverhaul") == false then
	entities = {
		-- Standard inserters
		["burner-inserter"] = { tier = 0, preset = "inserter-burner" },
		["inserter"] = { tier = 1, preset = "inserter" },
		["long-handed-inserter"] = { tier = 2, preset = "inserter-long-handed" },
		["fast-inserter"] = { tier = 3, preset = "inserter-fast" },
		["bob-express-inserter"] = { tier = 4, preset = "inserter-express", particle_tint = util.color("30d79c") },

		-- Bulk inserters
		["bulk-inserter"] = { tier = 3, preset = "inserter-bulk", is_bulk = true },
		["bob-express-bulk-inserter"] = {
			tier = 4,
			preset = "inserter-express-bulk",
			is_bulk = true,
			particle_tint = util.color("2dcd3f"),
		},
	}
else
	entities = {
		["burner-inserter"] = { tier = 0, preset = "inserter-burner", is_long = true },
	}
end

local TYPE = "inserter"

local do_labels = _framework.settings.get_value("reskins-bobs-do-inserter-tier-labeling") ~= false

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local base_entity_name = options.is_bulk and "bulk-inserter" or "inserter"

	-- Only create explosions for non-vanilla inserters.
	if options.particle_tint then
		_lib.create_explosions_and_particles(entity.name, {
			base_entity_name = base_entity_name,
			type = entity.type,
			tint = options.particle_tint,
			particles = {
				["medium"] = 1,
			},
		})
	end

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = base_entity_name,
		type = entity.type,
	})

	-- With the inserter overhaul, the burner inserter has long hands. With Bob's Adjustable Inserters, inserters other
	-- than the bulk and long-handed inserters have long hands.
	local is_long = options.is_long
		or (mods["bobinserters"] ~= nil and not options.is_bulk and options.preset ~= "inserter-long-handed")

	local sprite_set = InserterPreset.get_sprite_set({ preset = options.preset, is_long = is_long })
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = do_labels and _framework.tiers.get_tier(options) or 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = InserterPreset.get_icon(options.preset),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
