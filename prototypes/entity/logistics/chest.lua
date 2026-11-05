-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local ChestLogistic = require("__reskins-assets-api__.assets.base.entities.chest-logistic")

if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

local entities = {
	["active-provider-chest"] = { tier = 1, prog_tier = 2 },
	["passive-provider-chest"] = { tier = 1, prog_tier = 2 },
	["storage-chest"] = { tier = 1, prog_tier = 2 },
	["buffer-chest"] = { tier = 1, prog_tier = 2 },
	["requester-chest"] = { tier = 1, prog_tier = 2 },
	["bob-active-provider-chest-2"] = { tier = 2, prog_tier = 3, material = "brass", logistic_mode = "active-provider" },
	["bob-passive-provider-chest-2"] = { tier = 2, prog_tier = 3, material = "brass", logistic_mode = "passive-provider" },
	["bob-storage-chest-2"] = { tier = 2, prog_tier = 3, material = "brass", logistic_mode = "storage" },
	["bob-buffer-chest-2"] = { tier = 2, prog_tier = 3, material = "brass", logistic_mode = "buffer" },
	["bob-requester-chest-2"] = { tier = 2, prog_tier = 3, material = "brass", logistic_mode = "requester" },
	["bob-active-provider-chest-3"] = {
		tier = 3,
		prog_tier = 4,
		material = "titanium",
		logistic_mode = "active-provider",
	},
	["bob-passive-provider-chest-3"] = {
		tier = 3,
		prog_tier = 4,
		material = "titanium",
		logistic_mode = "passive-provider",
	},
	["bob-storage-chest-3"] = { tier = 3, prog_tier = 4, material = "titanium", logistic_mode = "storage" },
	["bob-buffer-chest-3"] = { tier = 3, prog_tier = 4, material = "titanium", logistic_mode = "buffer" },
	["bob-requester-chest-3"] = { tier = 3, prog_tier = 4, material = "titanium", logistic_mode = "requester" },
}

local TYPE = "logistic-container"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)

	-- Stick tier labels on the vanilla logistic chests
	if not options.material then
		_framework.tiers.add_tier_labels_to_prototype(tier, entity)
		goto continue
	end

	local sprite_set = ChestLogistic.get_sprite_set({
		logistic_mode = options.logistic_mode,
		material = options.material,
	})
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = ChestLogistic.get_icon_composition({ logistic_mode = options.logistic_mode, material = options.material }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end

-- brass-chest
-- titanium-chest
