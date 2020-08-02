-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobwarfare"] then return end
if reskins.lib.setting("reskins-bobs-do-bobwarfare") == false then return end

-- Setup inputs
local inputs = {
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "warfare",
}

-- Setup input defaults
reskins.lib.parse_inputs(inputs)

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


-- {
--     icon = "__core__/graphics/icons/tooltips/tooltip-category-thrown.png",
--     icon_size = 40,
--     scale = 0.5,
--     shift = {-8, 8}
-- }
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
    -- ["rocket-warhead"] = {subfolder = "warhead"},
    -- ["acid-rocket-warhead"] = {subfolder = "warhead"},
    -- ["piercing-rocket-warhead"] = {subfolder = "warhead"},
    -- ["electric-rocket-warhead"] = {subfolder = "warhead"},
    -- ["explosive-rocket-warhead"] = {subfolder = "warhead"},
    -- ["flame-rocket-warhead"] = {subfolder = "warhead"},
    -- ["plasma-rocket-warhead"] = {subfolder = "warhead"},
    -- ["poison-rocket-warhead    "] = {subfolder = "warhead"},

    -- Rockets
    -- ["bob-rocket"] = {subfolder = "rockets"},
    -- ["bob-acid-rocket"] = {subfolder = "rockets"},
    -- ["bob-piercing-rocket"] = {subfolder = "rockets"},
    -- ["bob-electric-rocket"] = {subfolder = "rockets"},
    -- ["bob-flame-rocket"] = {subfolder = "rockets"},
    -- ["bob-explosive-rocket"] = {subfolder = "rockets"},
    -- ["bob-plasma-rocket"] = {subfolder = "rockets"},
    -- ["bob-poison-rocket"] = {subfolder = "rockets"},

    -- Shotgun Shells
    -- ["better-shotgun-shell"] = {subfolder = "shells"},
    -- ["shotgun-acid-shell"] = {subfolder = "shells"},
    -- ["shotgun-ap-shell"] = {subfolder = "shells"},
    -- ["shotgun-electric-shell"] = {subfolder = "shells"},
    -- ["shotgun-explosive-shell"] = {subfolder = "shells"},
    -- ["shotgun-flame-shell"] = {subfolder = "shells"},
    -- ["shotgun-plasma-shell"] = {subfolder = "shells"},
    -- ["shotgun-poison-shell"] = {subfolder = "shells"},
    -- ["shotgun-uranium-shell"] = {subfolder = "shells"},

    -- Components
    ["bullet-casing"] = {subfolder = "components"},
    ["magazine"] = {subfolder = "components"},
    ["cordite"] = {subfolder = "components"},
    -- ["rocket-body"] = {subfolder = "components"},
    -- ["shot"] = {subfolder = "components"},
    -- ["shotgun-shell-casing"] = {subfolder = "components"},
}

for name, map in pairs(items) do
    -- Fetch intermediary
    local intermediary = data.raw.item[name]
    if map.type then
        intermediary = data.raw[map.type][name]
    end

    -- Check if intermediary exists, if not, skip this iteration
    if not intermediary then goto continue end

    -- Parse map
    local image = map.image or name
    inputs.type = map.type or nil

    inputs.icon_filename = inputs.directory.."/graphics/icons/warfare/"..map.subfolder.."/"..image..".png"

    reskins.lib.construct_icon(name, 0, inputs)

    -- Label to skip to next iteration
    ::continue::
end