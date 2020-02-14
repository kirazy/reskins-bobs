-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

local mod_directory = "__reskin-series-bobs-structures__"

local tint_index =
{
    ["tier-0"] = {r = 197, g = 197, b = 197},
    ["tier-1"] = {r = 242, g = 177, b = 46},
    ["tier-2"] = {r = 220, g = 48, b = 41},
    ["tier-3"] = {r = 71, g = 168, b = 219},
    ["tier-4"] = {r = 203, g = 28, b = 229},
    ["tier-5"] = {r = 74, g = 239, b = 119}
}

-- Set icons for each of the four main types
local function setup_icons(name, type, subtype, tier, size)

    -- Initialize local table paths
    local entity = data.raw[type][name]
    local item = data.raw["item"][name]
    local remnant = data.raw["corpse"][name.."-remnants"]
    local explosion = data.raw["explosion"][name.."-explosion"]

    local labeled_icon = {}
    local unlabeled_icon = {}

    if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
        -- Setup icon with name-mapped tier labeling
        labeled_icon = 
        {
            {
                icon = mod_directory.."/graphics/icons/"..subtype.."/"..name..".png"
            },
            {
                icon = mod_directory.."/graphics/icons/tiers/"..size.."/tier-"..tier..".png"
            }
        }

        -- Setup icon without tier labeling
        unlabeled_icon = mod_directory.."/graphics/icons/"..subtype.."/"..name..".png"
    else
        -- Setup icon with ingredient-mapped tier labeling
        -- THIS WILL BREAK FOR ENTITIES WITHOUT A TIER NUMBER IN THEIR NAME. REWORK LATER...
        labeled_icon = 
        {
            {
                icon = mod_directory.."/graphics/icons/"..subtype.."/"..subtype.."-"..tier..".png"
            },
            {
                icon = mod_directory.."/graphics/icons/tiers/"..size.."/tier-"..tier..".png"
            }
        }
    end

    -- Create icons with tier markings
    if settings.startup["reskin-series-icon-tier-labeling"].value == true and tier > 0 then
        entity.icon = nil        
        entity.icons = labeled_icon        

        item.icon = nil
        item.icons = labeled_icon
        
        remnant.icon = nil
        remnant.icons = labeled_icon

        explosion.icon = nil        
        explosion.icons = labeled_icon        
    else
        -- Create icons without tier markings
        entity.icons = nil
        entity.icon = unlabeled_icon

        item.icons = nil        
        item.icon = unlabeled_icon

        remnant.icons = nil
        remnant.icon = unlabeled_icon
    end

    -- Explicitly set icon size, mipmaps
    entity.icon_size = size
    entity.icon_mipmaps = 4

    item.icon_size = size
    item.icon_mipmaps = 4
    
    remnant.icon_size = size
    remnant.icon_mipmaps = 4

    explosion.icon_size = size
    explosion.icon_mipmaps = 4
end

local function setup_remnants(name, subtype, tier, entity)
    local remnant = table.deepcopy(data.raw["corpse"][subtype.."-remnants"])
    remnant.name = name.."-remnants"

    -- For standard remnants with 4 orientations
    if subtype == "boiler" then
        remnant.animation.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
        remnant.animation.hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    elseif subtype == "steam-engine" or "steam-turbine" then
        remnant.animation[1].filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
        remnant.animation[1].hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    end

    -- Create the remnant entry
    data:extend({remnant})

    -- Assign the corpse
    entity.corpse = remnant.name
end

local function setup_explosions(name, subtype, tier, entity, particles)
    -- Make particles
    for key, value in pairs(particles) do 
        if value == "small" then
            local particle_small = table.deepcopy(data.raw["optimized-particle"][subtype.."-metal-particle-small"])

            particle_small.name = name.."-metal-particle-small-tinted"
            particle_small.pictures.sheet.tint = tint_index["tier-"..tier]
            particle_small.pictures.sheet.hr_version.tint = tint_index["tier-"..tier]
            data:extend({particle_small})

        elseif value == "medium" then
            local particle_medium = table.deepcopy(data.raw["optimized-particle"][subtype.."-metal-particle-medium"])

            particle_medium.name = name.."-metal-particle-medium-tinted"
            particle_medium.pictures.sheet.tint = tint_index["tier-"..tier]
            particle_medium.pictures.sheet.hr_version.tint = tint_index["tier-"..tier]
            data:extend({particle_medium})

        elseif value == "big" then
            local particle_big = table.deepcopy(data.raw["optimized-particle"][subtype.."-metal-particle-big"])

            particle_big.name = name.."-metal-particle-big-tinted"
            particle_big.pictures.sheet.tint = tint_index["tier-"..tier]
            particle_big.pictures.sheet.hr_version.tint = tint_index["tier-"..tier]
            data:extend({particle_big})
        end
    end

    -- Make explosions. Big ones. The biggest explosions. Make Michael Bay proud!
    local explosion = table.deepcopy(data.raw["explosion"][subtype.."-explosion"])

    explosion.name = name.."-explosion"

    -- Assign particles
    if subtype == "steam-engine" then
        explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
        explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"
    end

    if subtype == "boiler" then
        explosion.created_effect.action_delivery.target_effects[3].particle_name = name.."-metal-particle-big-tinted"
    end

    data:extend({explosion})

    -- Assign explosion
    entity.dying_explosion = explosion.name
end

-- PRIMARY EXECUTIVE FUNCTION
function reskin_entity(name, type, subtype, tier, size, particles)
    local entity = data.raw[type][name]

    -- Handle optional parameters
    particles = particles or nil
    
    -- Reskin boiler entities
    if subtype == "boiler" then
        entity.structure.north.layers[1].filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-N-idle.png"
        entity.structure.east.layers[1].filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-E-idle.png"
        entity.structure.south.layers[1].filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-S-idle.png"
        entity.structure.west.layers[1].filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-W-idle.png"

        entity.structure.north.layers[1].hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-N-idle.png"
        entity.structure.east.layers[1].hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-E-idle.png"
        entity.structure.south.layers[1].hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-S-idle.png"
        entity.structure.west.layers[1].hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-W-idle.png"
    end

    -- Reskin steam-engine / steam-turbine entities
    if subtype == "steam-engine" or subtype == "steam-turbine" then
        entity.horizontal_animation.layers[1].filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-H.png"
        entity.horizontal_animation.layers[1].hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-H.png"
        entity.vertical_animation.layers[1].filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name.."-V.png"
        entity.vertical_animation.layers[1].hr_version.filename = mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name.."-V.png"

    end

    -- Create remnants
    setup_remnants(name, subtype, tier, entity)

    -- Create explosions
    setup_explosions(name, subtype, tier, entity, particles)

    -- Patch icons
    setup_icons(name, type, subtype, tier, size)
end