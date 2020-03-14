-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobwarfare"] then return end
if settings.startup["reskins-bobs-do-bobwarfare"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "ammo-turret",
    root_name = "sniper-turret",
    base_entity = "gun-turret",
    directory = reskins.bobs.directory,
    mod = "warfare",
    particles = {["medium"] = 2},
    make_icons = false   
}

local tier_map =
{
    ["bob-sniper-turret-1"] = 1,
    ["bob-sniper-turret-2"] = 2,
    ["bob-sniper-turret-3"] = 3
}


entity = data.raw["ammo-turret"]["bob-sniper-turret-1"]

entity.base_picture.layers[1].hr_version =
{
    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base.png",
    priority = "high",
    width = 150,
    height = 118,
    axially_symmetrical = false,
    direction_count = 1,
    frame_count = 1,
    shift = util.by_pixel(0.5, -1),
    scale = 0.5
}

entity.folded_animation.layers[1].hr_version.filename = inputs.directory.."/graphics/entity/structures/warfare/sniper-turret/base/animations/hr-sniper-turret-raising.png"
entity.folded_animation.layers[1].hr_version.width = 179
entity.folded_animation.layers[1].hr_version.height = 156
entity.folded_animation.layers[1].hr_version.shift = util.by_pixel(0.25, -28)

entity.preparing_animation.layers[1].hr_version.filename = inputs.directory.."/graphics/entity/structures/warfare/sniper-turret/base/animations/hr-sniper-turret-raising.png"
entity.preparing_animation.layers[1].hr_version.width = 179
entity.preparing_animation.layers[1].hr_version.height = 156
entity.preparing_animation.layers[1].hr_version.shift = util.by_pixel(0.25, -28)

entity.folding_animation.layers[1].hr_version.filename = inputs.directory.."/graphics/entity/structures/warfare/sniper-turret/base/animations/hr-sniper-turret-raising.png"
entity.folding_animation.layers[1].hr_version.width = 179
entity.folding_animation.layers[1].hr_version.height = 156
entity.folding_animation.layers[1].hr_version.shift = util.by_pixel(0.25, -28)

-- width = 179
-- height = 156