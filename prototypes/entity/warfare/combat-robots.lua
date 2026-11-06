-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local RobotCapsules = require("__reskins-assets-api__.assets.bobs.entities.robot-capsules")

if not mods["bobwarfare"] then
	return
end

local capsule_projectiles = {
	["bob-laser-robot-capsule"] = "laser-robot",
	["destroyer-capsule"] = "destroyer",
	["distractor-capsule"] = "distractor",
	["defender-capsule"] = "defender",
}

for name, robot in pairs(capsule_projectiles) do
	local projectile = data.raw["projectile"][name]
	if not projectile then
		goto continue
	end

	local graphics = RobotCapsules.get_projectile_graphics({ robot = robot })
	projectile.animation = graphics.animation
	projectile.shadow = graphics.shadow

	::continue::
end
