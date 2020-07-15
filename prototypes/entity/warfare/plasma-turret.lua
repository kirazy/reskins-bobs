-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobwarfare"] then return end
if reskins.lib.setting("reskins-bobs-do-bobwarfare") == false then return end 

local inputs = {
    type = "electric-turret",
    icon_name = "plasma-turret",
    base_entity = "artillery-turret",
    directory = reskins.bobs.directory,
    mod = "bobs",
    group = "warfare",
    particles = {["big"] = 4},
    make_icons = false,
    make_remnants = false,
}

local tier_map = {
    ["bob-plasma-turret-1"] = 1,
    ["bob-plasma-turret-2"] = 2,
    ["bob-plasma-turret-3"] = 3,
    ["bob-plasma-turret-4"] = 4,
    ["bob-plasma-turret-5"] = 5,
}

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entity
    entity.base_picture = {
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/warfare/plasma-turret/plasma-turret-base.png",
                priority = "high",
                width = 104,
                height = 89,
                shift = util.by_pixel(0, 0),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/warfare/plasma-turret/hr-plasma-turret-base.png",
                    priority = "high",
                    width = 208,
                    height = 178,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end