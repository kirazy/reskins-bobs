-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobwarfare"] then return end
if reskins.lib.setting("reskins-bobs-do-bobwarfare") == false then return end

-- Items with custom color support
local masked_items = {
    ["robot-tool-combat"] = {name_tier = 1, ingr_tier = 2, icon_name = "robot-tool-combat"},
    ["robot-tool-combat-2"] = {name_tier = 2, ingr_tier = 3, icon_name = "robot-tool-combat"},
    ["robot-tool-combat-3"] = {name_tier = 3, ingr_tier = 4, icon_name = "robot-tool-combat"},
    ["robot-tool-combat-4"] = {name_tier = 4, ingr_tier = 5, icon_name = "robot-tool-combat"},
}

for name, inputs in pairs(masked_items) do
    -- Handle tier details
    local tier = inputs.name_tier or inputs.tier or 0
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = inputs.ingr_tier or inputs.tier or 0
    end

    -- Handle defaults, tints
    inputs.tint = inputs.tint or reskins.lib.tint_index["tier-"..tier]
    inputs.directory = reskins.bobs.directory
    inputs.mod = "bobs"
    inputs.group = "warfare"

    -- Setup input defaults
    reskins.lib.parse_inputs(inputs)

    -- Reskin icons
    reskins.lib.construct_icon(name, tier, inputs)
end

-- Setup inputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "warfare",
    make_icon_pictures = false,
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

local items = {
    -- Bullets
    ["bullet"] = {subfolder = "bullets"},
    ["acid-bullet"] = {subfolder = "bullets"},
    ["ap-bullet"] = {subfolder = "bullets"},
    ["electric-bullet"] = {subfolder = "bullets"},
    ["flame-bullet"] = {subfolder = "bullets"},
    ["he-bullet"] = {subfolder = "bullets"},
    ["plasma-bullet"] = {subfolder = "bullets"},
    ["poison-bullet"] = {subfolder = "bullets"},
    ["uranium-bullet"] = {subfolder = "bullets"},

    -- Projectiles
    ["bullet-projectile"] = {subfolder = "projectiles"},
    ["acid-bullet-projectile"] = {subfolder = "projectiles"},
    ["ap-bullet-projectile"] = {subfolder = "projectiles"},
    ["electric-bullet-projectile"] = {subfolder = "projectiles"},
    ["flame-bullet-projectile"] = {subfolder = "projectiles"},
    ["he-bullet-projectile"] = {subfolder = "projectiles"},
    ["plasma-bullet-projectile"] = {subfolder = "projectiles"},
    ["poison-bullet-projectile"] = {subfolder = "projectiles"},
    ["uranium-bullet-projectile"] = {subfolder = "projectiles"},

    -- Magazines
    ["bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["acid-bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["ap-bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["electric-bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["flame-bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["he-bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["plasma-bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["poison-bullet-magazine"] = {type = "ammo", subfolder = "magazines"},
    ["uranium-rounds-magazine"] = {type = "ammo", subfolder = "magazines"},

    -- Warheads
    ["rocket-warhead"] = {subfolder = "warheads"},
    ["acid-rocket-warhead"] = {subfolder = "warheads"},
    ["piercing-rocket-warhead"] = {subfolder = "warheads"},
    ["electric-rocket-warhead"] = {subfolder = "warheads"},
    ["explosive-rocket-warhead"] = {subfolder = "warheads"},
    ["flame-rocket-warhead"] = {subfolder = "warheads"},
    ["plasma-rocket-warhead"] = {subfolder = "warheads"},
    ["poison-rocket-warhead"] = {subfolder = "warheads"},

    -- Rockets
    ["bob-rocket"] = {type = "ammo", subfolder = "rockets"},
    ["bob-acid-rocket"] = {type = "ammo", subfolder = "rockets"},
    ["bob-piercing-rocket"] = {type = "ammo", subfolder = "rockets"},
    ["bob-electric-rocket"] = {type = "ammo", subfolder = "rockets"},
    ["bob-flame-rocket"] = {type = "ammo", subfolder = "rockets"},
    ["bob-explosive-rocket"] = {type = "ammo", subfolder = "rockets"},
    ["bob-plasma-rocket"] = {type = "ammo", subfolder = "rockets"},
    ["bob-poison-rocket"] = {type = "ammo", subfolder = "rockets"},

    -- Shotgun Shells
    ["better-shotgun-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-acid-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-ap-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-electric-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-explosive-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-flame-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-plasma-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-poison-shell"] = {type = "ammo", subfolder = "shells"},
    ["shotgun-uranium-shell"] = {type = "ammo", subfolder = "shells"},

    -- Components
    ["bullet-casing"] = {subfolder = "components"},
    ["magazine"] = {subfolder = "components"},
    ["cordite"] = {subfolder = "components"},
    -- ["rocket-body"] = {subfolder = "components"},
    -- ["shot"] = {subfolder = "components"},
    -- ["shotgun-shell-casing"] = {subfolder = "components"},
}

reskins.lib.create_icons_from_list(items, inputs)