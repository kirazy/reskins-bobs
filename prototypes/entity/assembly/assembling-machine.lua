-- Copyright (c) 2026 Kirazy
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
local AssemblingMachine = require("__reskins-assets-api__.assets.base.entities.assembling-machine")

local entities = {
	-- Standard assembly machines
	["assembling-machine-1"] = {
		tier = 1,
		machine_tier = 1,
	},
	["assembling-machine-2"] = {
		tier = 2,
		machine_tier = 2,
	},
	["assembling-machine-3"] = {
		tier = 3,
		machine_tier = 3,
	},
	["bob-assembling-machine-4"] = {
		tier = 4,
		machine_tier = 4,
	},
	["bob-assembling-machine-5"] = {
		tier = 5,
		machine_tier = 5,
	},
	["bob-assembling-machine-6"] = {
		tier = 6,
		machine_tier = 6,
	},
	-- Smoke stacks
	["bob-burner-assembling-machine"] = {
		tier = 0,
		machine_tier = 1,
		tint = util.color("202020") --[[@as Color]],
		use_burner_set = true,
	},
	["bob-steam-assembling-machine"] = {
		tier = 0,
		machine_tier = 1,
		tint = util.color("E8E8E8") --[[@as Color]],
		use_steam_set = true,
	},
	-- Electronics
	["bob-electronics-machine-1"] = {
		tier = 1,
		prog_tier = 2,
		machine_tier = 1,
		electronics_tier = 1,
		use_electronics_set = true,
	},
	["bob-electronics-machine-2"] = {
		tier = 2,
		prog_tier = 4,
		machine_tier = 3,
		electronics_tier = 2,
		use_electronics_set = true,
	},
	["bob-electronics-machine-3"] = {
		tier = 3,
		prog_tier = 6,
		machine_tier = 5,
		electronics_tier = 3,
		use_electronics_set = true,
	},
}

local function get_icon(tint, options)
	if options.use_burner_set then
		return AssemblingMachine.get_burner_icon({ tint = tint })
	elseif options.use_steam_set then
		return AssemblingMachine.get_steam_icon({ tint = tint })
	elseif options.use_electronics_set then
		return AssemblingMachine.get_electronics_icon({ tint = tint, electronics_tier = options.electronics_tier })
	else
		return AssemblingMachine.get_icon({ tint = tint, machine_tier = options.machine_tier })
	end
end

local TYPE = "assembling-machine"
local BASE_ENTITY_NAME = "assembling-machine-1"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = options.tint or _framework.tiers.get_tint(tier)

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
		tint = tint,
		particles = {
			["big"] = 1,
			["medium"] = 2,
		},
	})

	local corpse = _lib.create_remnant(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
	})

	local sprite_set = AssemblingMachine.get_sprite_set({
		tint = tint,
		machine_tier = options.machine_tier,
		use_burner_set = options.use_burner_set,
		use_electronics_set = options.use_electronics_set,
		use_steam_set = options.use_steam_set,
	})
	Applicators.apply_sprite_set(entity, sprite_set)
	Applicators.apply_sprite_set(corpse, sprite_set)

	local icon_data = get_icon(tint, options)

	if options.use_burner_set and reskins.bobs.triggers.assembly.burner_assembling_machine_is_small then
		icon_data = _sprite_utils.icons.minify_icon(icon_data, 0.8, "default")
	end

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
