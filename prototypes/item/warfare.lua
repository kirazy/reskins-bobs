-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.warfare.items) then return end

-- Setup inputs
local inputs = {
    mod = "bobs",
    group = "warfare",
    make_icon_pictures = false,
    flat_icon = true,
}

local plasma_tint = util.color("1280b2")
local uranium_tint = util.color("12b222")

local items = {
    -- Robot tools
    ["robot-tool-combat"] = {tier = 1, prog_tier = 2, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true},
    ["robot-tool-combat-2"] = {tier = 2, prog_tier = 3, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true},
    ["robot-tool-combat-3"] = {tier = 3, prog_tier = 4, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true},
    ["robot-tool-combat-4"] = {tier = 4, prog_tier = 5, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true},

    -- Bullets
    ["bullet"] = {subgroup = "bullets"},
    ["acid-bullet"] = {subgroup = "bullets"},
    ["ap-bullet"] = {subgroup = "bullets"},
    ["electric-bullet"] = {subgroup = "bullets", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "electric-bullet")}},
    ["flame-bullet"] = {subgroup = "bullets"},
    ["he-bullet"] = {subgroup = "bullets"},
    ["plasma-bullet"] = {subgroup = "bullets", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-bullet", plasma_tint)}},
    ["poison-bullet"] = {subgroup = "bullets"},
    ["uranium-bullet"] = {subgroup = "bullets", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-bullet", uranium_tint)}},

    -- Projectiles
    ["bullet-projectile"] = {subgroup = "projectiles"},
    ["acid-bullet-projectile"] = {subgroup = "projectiles"},
    ["ap-bullet-projectile"] = {subgroup = "projectiles"},
    ["electric-bullet-projectile"] = {subgroup = "projectiles", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "electric-projectile")}},
    ["flame-bullet-projectile"] = {subgroup = "projectiles"},
    ["he-bullet-projectile"] = {subgroup = "projectiles"},
    ["plasma-bullet-projectile"] = {subgroup = "projectiles", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-projectile", plasma_tint)}},
    ["poison-bullet-projectile"] = {subgroup = "projectiles"},
    ["uranium-bullet-projectile"] = {subgroup = "projectiles", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-projectile", uranium_tint)}},

    -- Magazines
    ["bullet-magazine"] = {type = "ammo", subgroup = "magazines"},
    ["acid-bullet-magazine"] = {type = "ammo", subgroup = "magazines"},
    ["ap-bullet-magazine"] = {type = "ammo", subgroup = "magazines"},
    ["electric-bullet-magazine"] = {type = "ammo", subgroup = "magazines"},
    ["flame-bullet-magazine"] = {type = "ammo", subgroup = "magazines"},
    ["he-bullet-magazine"] = {type = "ammo", subgroup = "magazines"},
    ["plasma-bullet-magazine"] = {type = "ammo", subgroup = "magazines", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "rounds-magazine")}},
    ["poison-bullet-magazine"] = {type = "ammo", subgroup = "magazines"},
    ["uranium-rounds-magazine"] = {type = "ammo", subgroup = "magazines", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "rounds-magazine")}},

    -- Warheads
    ["rocket-warhead"] = {subgroup = "warheads"},
    ["acid-rocket-warhead"] = {subgroup = "warheads"},
    ["piercing-rocket-warhead"] = {subgroup = "warheads"},
    ["electric-rocket-warhead"] = {subgroup = "warheads", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "electric-warhead")}},
    ["explosive-rocket-warhead"] = {subgroup = "warheads"},
    ["flame-rocket-warhead"] = {subgroup = "warheads"},
    ["plasma-rocket-warhead"] = {subgroup = "warheads", make_icon_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-warhead", plasma_tint)}},
    ["poison-rocket-warhead"] = {subgroup = "warheads"},

    -- Rockets
    ["bob-rocket"] = {type = "ammo", subgroup = "rockets"},
    ["bob-acid-rocket"] = {type = "ammo", subgroup = "rockets"},
    ["bob-piercing-rocket"] = {type = "ammo", subgroup = "rockets"},
    ["bob-electric-rocket"] = {type = "ammo", subgroup = "rockets", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "electric-rocket")}},
    ["bob-flame-rocket"] = {type = "ammo", subgroup = "rockets"},
    ["bob-explosive-rocket"] = {type = "ammo", subgroup = "rockets"},
    ["bob-plasma-rocket"] = {type = "ammo", subgroup = "rockets", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-rocket", plasma_tint)}},
    ["bob-poison-rocket"] = {type = "ammo", subgroup = "rockets"},

    -- Shotgun Shells
    ["better-shotgun-shell"] = {type = "ammo", subgroup = "shells"},
    ["shotgun-acid-shell"] = {type = "ammo", subgroup = "shells"},
    ["shotgun-ap-shell"] = {type = "ammo", subgroup = "shells"},
    ["shotgun-electric-shell"] = {type = "ammo", subgroup = "shells", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "electric-shotgun-shell")}},
    ["shotgun-explosive-shell"] = {type = "ammo", subgroup = "shells"},
    ["shotgun-flame-shell"] = {type = "ammo", subgroup = "shells"},
    ["shotgun-plasma-shell"] = {type = "ammo", subgroup = "shells", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-shotgun-shell", plasma_tint)}},
    ["shotgun-poison-shell"] = {type = "ammo", subgroup = "shells"},
    ["shotgun-uranium-shell"] = {type = "ammo", subgroup = "shells", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "aura-shotgun-shell", uranium_tint)}},

    -- Laser rifle batteries
    ["laser-rifle-battery"] = {type = "ammo", subgroup = "laser-rifle-batteries", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "laser-rifle-battery", util.color("b3b3b3"))}},
    ["laser-rifle-battery-ruby"] = {type = "ammo", subgroup = "laser-rifle-batteries", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "laser-rifle-battery", util.color("fa1928"))}},
    ["laser-rifle-battery-sapphire"] = {type = "ammo", subgroup = "laser-rifle-batteries", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "laser-rifle-battery", util.color("0033ff"))}},
    ["laser-rifle-battery-emerald"] = {type = "ammo", subgroup = "laser-rifle-batteries", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "laser-rifle-battery", util.color("13e35c"))}},
    ["laser-rifle-battery-amethyst"] = {type = "ammo", subgroup = "laser-rifle-batteries", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "laser-rifle-battery", util.color("d414ff"))}},
    ["laser-rifle-battery-topaz"] = {type = "ammo", subgroup = "laser-rifle-batteries", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "laser-rifle-battery", util.color("f0b414"))}},
    ["laser-rifle-battery-diamond"] = {type = "ammo", subgroup = "laser-rifle-batteries", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "laser-rifle-battery", util.color("ffffff"))}},

    -- Artillery shells
    ["atomic-artillery-shell"] = {type = "ammo", subgroup = "artillery-shells", make_entity_pictures = true, icon_picture_extras = {reskins.lib.lit_icon_pictures_layer(inputs.mod, "atomic-artillery-shell", uranium_tint)}},
    ["distractor-artillery-shell"] = {type = "ammo", subgroup = "artillery-shells"},
    ["explosive-artillery-shell"] = {type = "ammo", subgroup = "artillery-shells"},
    ["fire-artillery-shell"] = {type = "ammo", subgroup = "artillery-shells"},
    ["poison-artillery-shell"] = {type = "ammo", subgroup = "artillery-shells"},

    -- Cannon shells
    ["scatter-cannon-shell"] = {type = "ammo", subgroup = "cannon-shells"},

    -- Mines
    ["distractor-mine"] = {subgroup = "mines"},
    ["poison-mine"] = {subgroup = "mines"},
    ["slowdown-mine"] = {subgroup = "mines"},

    -- Components
    ["laser-rifle-battery-case"] = {subgroup = "components"},
    ["bullet-casing"] = {subgroup = "components"},
    ["magazine"] = {subgroup = "components"},
    ["cordite"] = {subgroup = "components"},
    ["rocket-engine"] = {subgroup = "components"},
    -- ["rocket-body"] = {subgroup = "components"},
    ["petroleum-jelly"] = {subgroup = "components"},
    ["shot"] = {subgroup = "components/shot"},
    ["shotgun-shell-casing"] = {subgroup = "components"},

    -- Weapons
    ["laser-rifle"] = {type = "gun", subgroup = "weapons"},
    ["rifle"] = {type = "gun", subgroup = "weapons"},
    ["sniper-rifle"] = {type = "gun", subgroup = "weapons"},

    -- Armors
    ["heavy-armor-2"] = {type = "armor", subgroup = "armors"},
    ["heavy-armor-3"] = {type = "armor", subgroup = "armors"},
    ["bob-power-armor-mk3"] = {type = "armor", subgroup = "armors"},
    ["bob-power-armor-mk4"] = {type = "armor", subgroup = "armors"},
    ["bob-power-armor-mk5"] = {type = "armor", subgroup = "armors"},

    -- Robots
    ["defender-robot"] = {icon_filename = "__base__/graphics/icons/defender.png"},
    ["distractor-robot"] = {icon_filename = "__base__/graphics/icons/distractor.png"},
    ["destroyer-robot"] = {icon_filename = "__base__/graphics/icons/destroyer.png"},

    -- Parts
    ["mech-armor-plate"] = {type = "item", subgroup = "parts"},
}

reskins.lib.create_icons_from_list(items, inputs)

-- Handle shot variations
local shot_item = data.raw.item["shot"]

if shot_item then
    shot_item.pictures = reskins.lib.create_icon_variations({mod = inputs.mod, group = inputs.group, subgroup = "components", icon = "shot", variations = 5})
end