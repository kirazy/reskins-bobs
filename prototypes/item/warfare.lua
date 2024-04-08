-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.warfare.items) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "bobs",
    group = "warfare",
    make_icon_pictures = false,
    flat_icon = true,
}

local plasma_tint = util.color("1280b2")
local uranium_tint = util.color("12b222")

---@param subgroup string
---@param light_name? LightSpriteNames
---@param tint? data.Color
---@return CreateIconsFromListOverrides
local function get_item_overrides(subgroup, light_name, tint)
    ---@type CreateIconsFromListOverrides
    local override = {
        subgroup = subgroup,
    }

    if light_name then
        override.icon_picture_extras = { reskins.lib.sprites.get_sprite_light_layer(light_name, tint) }
        override.make_icon_pictures = true
    end

    return override
end

---@param subgroup string
---@param light_name? LightSpriteNames
---@param tint? data.Color
---@return CreateIconsFromListOverrides
local function get_ammo_overrides(subgroup, light_name, tint)
    local override = get_item_overrides(subgroup, light_name, tint)
    override.type = "ammo"

    return override
end

---@type CreateIconsFromListTable
local items = {
    -- Robot tools
    ["robot-tool-combat"] = { tier = 1, prog_tier = 2, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true },
    ["robot-tool-combat-2"] = { tier = 2, prog_tier = 3, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true },
    ["robot-tool-combat-3"] = { tier = 3, prog_tier = 4, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true },
    ["robot-tool-combat-4"] = { tier = 4, prog_tier = 5, icon_name = "robot-tool-combat", flat_icon = false, make_icon_pictures = true },

    -- Bullets
    ["bullet"] = get_item_overrides("bullets"),
    ["acid-bullet"] = get_item_overrides("bullets"),
    ["ap-bullet"] = get_item_overrides("bullets"),
    ["electric-bullet"] = get_item_overrides("bullets", "electric-bullet"),
    ["flame-bullet"] = get_item_overrides("bullets"),
    ["he-bullet"] = get_item_overrides("bullets"),
    ["plasma-bullet"] = get_item_overrides("bullets", "aura-bullet", plasma_tint),
    ["poison-bullet"] = get_item_overrides("bullets"),
    ["uranium-bullet"] = get_item_overrides("bullets", "aura-bullet", uranium_tint),

    -- Projectiles
    ["bullet-projectile"] = get_item_overrides("projectiles"),
    ["acid-bullet-projectile"] = get_item_overrides("projectiles"),
    ["ap-bullet-projectile"] = get_item_overrides("projectiles"),
    ["electric-bullet-projectile"] = get_item_overrides("projectiles", "electric-projectile"),
    ["flame-bullet-projectile"] = get_item_overrides("projectiles"),
    ["he-bullet-projectile"] = get_item_overrides("projectiles"),
    ["plasma-bullet-projectile"] = get_item_overrides("projectiles", "aura-projectile", plasma_tint),
    ["poison-bullet-projectile"] = get_item_overrides("projectiles"),
    ["uranium-bullet-projectile"] = get_item_overrides("projectiles", "aura-projectile", uranium_tint),

    -- Magazines
    ["bullet-magazine"] = get_ammo_overrides("magazines"),
    ["acid-bullet-magazine"] = get_ammo_overrides("magazines"),
    ["ap-bullet-magazine"] = get_ammo_overrides("magazines"),
    ["electric-bullet-magazine"] = get_ammo_overrides("magazines"),
    ["flame-bullet-magazine"] = get_ammo_overrides("magazines"),
    ["he-bullet-magazine"] = get_ammo_overrides("magazines"),
    ["plasma-bullet-magazine"] = get_ammo_overrides("magazines", "rounds-magazine"),
    ["poison-bullet-magazine"] = get_ammo_overrides("magazines"),
    ["uranium-rounds-magazine"] = get_ammo_overrides("magazines", "rounds-magazine"),

    -- Warheads
    ["rocket-warhead"] = get_item_overrides("warheads"),
    ["acid-rocket-warhead"] = get_item_overrides("warheads"),
    ["piercing-rocket-warhead"] = get_item_overrides("warheads"),
    ["electric-rocket-warhead"] = get_item_overrides("warheads", "electric-warhead"),
    ["explosive-rocket-warhead"] = get_item_overrides("warheads"),
    ["flame-rocket-warhead"] = get_item_overrides("warheads"),
    ["plasma-rocket-warhead"] = get_item_overrides("warheads", "aura-warhead", plasma_tint),
    ["poison-rocket-warhead"] = get_item_overrides("warheads"),

    -- Rockets
    ["bob-rocket"] = get_ammo_overrides("rockets"),
    ["bob-acid-rocket"] = get_ammo_overrides("rockets"),
    ["bob-piercing-rocket"] = get_ammo_overrides("rockets"),
    ["bob-electric-rocket"] = get_ammo_overrides("rockets", "electric-rocket"),
    ["bob-flame-rocket"] = get_ammo_overrides("rockets"),
    ["bob-explosive-rocket"] = get_ammo_overrides("rockets"),
    ["bob-plasma-rocket"] = get_ammo_overrides("rockets", "aura-rocket", plasma_tint),
    ["bob-poison-rocket"] = get_ammo_overrides("rockets"),

    -- Shotgun Shells
    ["better-shotgun-shell"] = get_ammo_overrides("shells"),
    ["shotgun-acid-shell"] = get_ammo_overrides("shells"),
    ["shotgun-ap-shell"] = get_ammo_overrides("shells"),
    ["shotgun-electric-shell"] = get_ammo_overrides("shells", "electric-shotgun-shell"),
    ["shotgun-explosive-shell"] = get_ammo_overrides("shells"),
    ["shotgun-flame-shell"] = get_ammo_overrides("shells"),
    ["shotgun-plasma-shell"] = get_ammo_overrides("shells", "aura-shotgun-shell", plasma_tint),
    ["shotgun-poison-shell"] = get_ammo_overrides("shells"),
    ["shotgun-uranium-shell"] = get_ammo_overrides("shells", "aura-shotgun-shell", uranium_tint),

    -- Laser rifle batteries
    ["laser-rifle-battery"] = get_ammo_overrides("laser-rifle-batteries", "laser-rifle-battery", util.color("b3b3b3")),
    ["laser-rifle-battery-ruby"] = get_ammo_overrides("laser-rifle-batteries", "laser-rifle-battery", util.color("fa1928")),
    ["laser-rifle-battery-sapphire"] = get_ammo_overrides("laser-rifle-batteries", "laser-rifle-battery", util.color("0033ff")),
    ["laser-rifle-battery-emerald"] = get_ammo_overrides("laser-rifle-batteries", "laser-rifle-battery", util.color("13e35c")),
    ["laser-rifle-battery-amethyst"] = get_ammo_overrides("laser-rifle-batteries", "laser-rifle-battery", util.color("d414ff")),
    ["laser-rifle-battery-topaz"] = get_ammo_overrides("laser-rifle-batteries", "laser-rifle-battery", util.color("f0b414")),
    ["laser-rifle-battery-diamond"] = get_ammo_overrides("laser-rifle-batteries", "laser-rifle-battery", util.color("ffffff")),

    -- Artillery shells
    ["atomic-artillery-shell"] = get_ammo_overrides("artillery-shells", "atomic-artillery-shell", uranium_tint),
    ["distractor-artillery-shell"] = get_ammo_overrides("artillery-shells"),
    ["explosive-artillery-shell"] = get_ammo_overrides("artillery-shells"),
    ["fire-artillery-shell"] = get_ammo_overrides("artillery-shells"),
    ["poison-artillery-shell"] = get_ammo_overrides("artillery-shells"),

    -- Cannon shells
    ["scatter-cannon-shell"] = get_ammo_overrides("cannon-shells"),

    -- Mines
    ["distractor-mine"] = { subgroup = "mines" },
    ["poison-mine"] = { subgroup = "mines" },
    ["slowdown-mine"] = { subgroup = "mines" },

    -- Components
    ["laser-rifle-battery-case"] = { subgroup = "components" },
    ["bullet-casing"] = { subgroup = "components" },
    ["magazine"] = { subgroup = "components" },
    ["cordite"] = { subgroup = "components" },
    ["rocket-engine"] = { subgroup = "components" },
    -- ["rocket-body"] = {subgroup = "components"},
    ["petroleum-jelly"] = { subgroup = "components" },
    ["shot"] = { subgroup = "components/shot" },
    ["shotgun-shell-casing"] = { subgroup = "components" },

    -- Weapons
    ["laser-rifle"] = { type = "gun", subgroup = "weapons" },
    ["rifle"] = { type = "gun", subgroup = "weapons" },
    ["sniper-rifle"] = { type = "gun", subgroup = "weapons" },
    ["spidertron-gatling-gun"] = { type = "gun", subgroup = "weapons" },
    ["spidertron-cannon"] = { type = "item", subgroup = "weapons" },
    ["spidertron-cannon-1"] = { type = "gun", image = "spidertron-cannon", subgroup = "weapons" },
    ["spidertron-cannon-2"] = { type = "gun", image = "spidertron-cannon", subgroup = "weapons" },

    -- Armor
    ["heavy-armor-2"] = { type = "armor", subgroup = "armor" },
    ["heavy-armor-3"] = { type = "armor", subgroup = "armor" },
    ["bob-power-armor-mk3"] = { type = "armor", subgroup = "armor" },
    ["bob-power-armor-mk4"] = { type = "armor", subgroup = "armor" },
    ["bob-power-armor-mk5"] = { type = "armor", subgroup = "armor" },

    -- Robots
    ["defender-robot"] = { icon_filename = "__base__/graphics/icons/defender.png" },
    ["distractor-robot"] = { icon_filename = "__base__/graphics/icons/distractor.png" },
    ["destroyer-robot"] = { icon_filename = "__base__/graphics/icons/destroyer.png" },
    ["bob-laser-robot"] = { type = "item", subgroup = "robots" },

    -- Capsules
    ["fire-capsule"] = { type = "capsule", subgroup = "capsules" },
    ["defender-capsule"] = { type = "capsule", subgroup = "capsules" },
    ["distractor-capsule"] = { type = "capsule", subgroup = "capsules" },
    ["destroyer-capsule"] = { type = "capsule", subgroup = "capsules" },
    ["bob-laser-robot-capsule"] = { type = "capsule", subgroup = "capsules" },

    -- Drone tank
    ["robot-drone-frame"] = { type = "item", subgroup = "drone" },
    ["robot-drone-frame-large"] = { type = "item", subgroup = "drone" },

    -- Mech parts
    ["mech-armor-plate"] = { type = "item", subgroup = "mech-parts" },
    -- TODO: https://github.com/kirazy/reskins-bobs/issues/32 Model and render out robot/mech brains
    -- ["mech-brain"] = {type = "item", subgroup = "mech-parts"},
    ["mech-frame"] = { type = "item", subgroup = "mech-parts" },
    ["mech-foot"] = { type = "item", subgroup = "mech-parts" },
    ["mech-hip"] = { type = "item", subgroup = "mech-parts" },
    ["mech-knee"] = { type = "item", subgroup = "mech-parts" },
    ["mech-leg"] = { type = "item", subgroup = "mech-parts" },
    ["mech-leg-segment"] = { type = "item", subgroup = "mech-parts" },
}

reskins.internal.create_icons_from_list(items, inputs)

-- Handle shot variations
local shot_item = data.raw.item["shot"]

if shot_item then
    shot_item.pictures = reskins.internal.create_sprite_variations("bobs", "warfare/components", "shot", 5)
end
