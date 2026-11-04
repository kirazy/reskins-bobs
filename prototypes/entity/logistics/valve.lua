-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _lib = require("_lib")
local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local PipeValve = require("__reskins-assets-api__.assets.bobs.entities.pipe-valve")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

local tint_map = {
	["bob-valve"] = util.color("#2ac0ff"),
	["bob-overflow-valve"] = util.color("#ff3b29"),
	-- cspell: disable-next-line
	["bob-topup-valve"] = util.color("#4dff2a"),
}

local TYPE = "valve"
local BASE_ENTITY_NAME = "pipe"

for name, tint in pairs(tint_map) do
	---@type data.ValvePrototype
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	_lib.create_explosions_and_particles(entity.name, {
		base_entity_name = BASE_ENTITY_NAME,
		type = entity.type,
		tint = tint,
		particles = { ["small"] = 2 },
	})

	local sprite_set = PipeValve.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = PipeValve.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
