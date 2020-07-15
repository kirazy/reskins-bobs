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

-- Temporary plasma turret visuals
local laser_turret = data.raw[inputs.type]["laser-turret"]

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

    entity.folded_animation = util.copy(laser_turret.folded_animation)
    entity.preparing_animation = util.copy(laser_turret.preparing_animation)
    entity.prepared_animation = util.copy(laser_turret.prepared_animation)
    entity.folding_animation = util.copy(laser_turret.folding_animation)

    -- Redo tints
    local table_list = {
        "folded_animation",
        "preparing_animation",
        "prepared_animation",
        "folding_animation",
    }

    for _, v in pairs(table_list) do
        -- Rescale
        reskins.lib.rescale_entity(entity[v], 3/2)

        -- Retint
        entity[v].layers[2].apply_runtime_tint = nil
        entity[v].layers[2].tint = reskins.lib.adjust_alpha(inputs.tint, 0.65)
        entity[v].layers[2].hr_version.apply_runtime_tint = nil
        entity[v].layers[2].hr_version.tint = reskins.lib.adjust_alpha(inputs.tint, 0.65)
    end

    -- Label to skip to next iteration
    ::continue::
end