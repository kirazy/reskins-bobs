-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

local mod_directory = "__reskin-series-bobs-structures__"

local function setup_icons(name, type, tier, size)

    -- Initialize local table paths
    local entity = data.raw[type][name]
    local item = data.raw["item"][name]
    -- local remnant = data.raw["remnant"][name]
    -- local explosion = data.raw["explosion"][name]

    -- Setup icon with tier labeling
    local labeled_icon = 
    {
        {
            icon = mod_directory.."/graphics/icons/"..type.."/"..name..".png"
        },
        {
            icon = mod_directory.."/graphics/icons/tiers/"..size.."/tier-"..tier..".png"
        }
    }

    -- Setup icon without tier labeling
    local unlabeled_icon = mod_directory.."/graphics/icons/"..type.."/"..name..".png"

    -- Create icons
    if settings.startup["reskin-series-icon-tier-labeling"].value == true and tier > 0 then
        entity.icon = nil
        entity.icon_size = size
        entity.icons = labeled_icon

        item.icon = nil
        item.icon_size = size
        item.icons = labeled_icon

        --[[
        remnant.icon = nil
        remnant.icon_size = size
        remnant.icons = labeled_icon

        explosion.icon = nil
        explosion.icon_size = size
        explosion.icons = labeled_icon]]
    else
        entity.icons = nil
        entity.icon_size = size
        entity.icon = unlabeled_icon

        item.icon = nil
        item.icon_size = size
        item.icon = unlabeled_icon
    end
end

function reskin_entity(name, type, tier, size, particles)
    
    -- Handle optional parameters
    particles = particles or nil
    
    -- Patch icons
    setup_icons(name, type, tier, size)

    -- Reskin boiler entities
    if type == "boiler" then
        local boiler = data.raw["boiler"][name]

        boiler.structure.north.layers[1].filename = mod_directory.."/graphics/entity/boiler/"..name.."/"..name.."-N-idle.png"
        boiler.structure.east.layers[1].filename = mod_directory.."/graphics/entity/boiler/"..name.."/"..name.."-E-idle.png"
        boiler.structure.south.layers[1].filename = mod_directory.."/graphics/entity/boiler/"..name.."/"..name.."-S-idle.png"
        boiler.structure.west.layers[1].filename = mod_directory.."/graphics/entity/boiler/"..name.."/"..name.."-W-idle.png"

        boiler.structure.north.layers[1].hr_version.filename = mod_directory.."/graphics/entity/boiler/"..name.."/hr-"..name.."-N-idle.png"
        boiler.structure.east.layers[1].hr_version.filename = mod_directory.."/graphics/entity/boiler/"..name.."/hr-"..name.."-E-idle.png"
        boiler.structure.south.layers[1].hr_version.filename = mod_directory.."/graphics/entity/boiler/"..name.."/hr-"..name.."-S-idle.png"
        boiler.structure.west.layers[1].hr_version.filename = mod_directory.."/graphics/entity/boiler/"..name.."/hr-"..name.."-W-idle.png"
    end
end