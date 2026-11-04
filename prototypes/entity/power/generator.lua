-- cspell: words fluidgenerator

-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local _framework = {
	tiers = require("__reskins-framework__.api.tiers"),
	settings = require("__reskins-framework__.api.settings"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local GeneratorFluid = require("__reskins-assets-api__.assets.bobs.entities.generator-fluid")

if not (reskins.bobs and reskins.bobs.triggers.power.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.power.fluidgenerator) then
	return
end

-- Determine which tint we're using for the bob-hydrazine-generator
if _framework.settings.get_value("reskins-bobs-hydrazine-is-blue") == true then
	reskins.bobs.hydrazine_tint = util.color("#7ac1de")
else
	reskins.bobs.hydrazine_tint = nil
end

local entities = {
	["bob-fluid-generator"] = { tier = 1, prog_tier = 2, frequency = 2 / 16 },
	["bob-fluid-generator-2"] = { tier = 2, prog_tier = 3, frequency = 3 / 16 },
	["bob-fluid-generator-3"] = { tier = 3, prog_tier = 4, frequency = 4 / 16 },
	["bob-hydrazine-generator"] = {
		tier = 4,
		prog_tier = 5,
		frequency = 5 / 16,
		smoke_name = "light-smoke",
		tint = reskins.bobs.hydrazine_tint,
	},
}

local TYPE = "generator"

for name, options in pairs(entities) do
	---@type data.GeneratorPrototype
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = options.tint or _framework.tiers.get_tint(tier)

	local sprite_set = GeneratorFluid.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	-- Handle smoke
	entity.smoke = GeneratorFluid.get_smoke({ name = options.smoke_name, frequency = options.frequency })

	local icon_data = GeneratorFluid.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
