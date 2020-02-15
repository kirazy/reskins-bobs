-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Initialize function store
if not reskin_functions then reskin_functions = {} end

reskin_functions.mod_directory = "__reskin-series-bobs-structures__"
reskin_functions.tint_index =
{
    ["tier-0"] = {r = 197, g = 197, b = 197},
    ["tier-1"] = {r = 242, g = 177, b = 46},
    ["tier-2"] = {r = 220, g = 48, b = 41},
    ["tier-3"] = {r = 71, g = 168, b = 219},
    ["tier-4"] = {r = 203, g = 28, b = 229},
    ["tier-5"] = {r = 74, g = 239, b = 119}
}

-- Set icons for each of the four main types
function reskin_functions.setup_common_attributes(name, type, subtype, tier, size, mipmaps, particles, mapping)

    -- Initialize local table paths
    local entity = data.raw[type][name]
    local item = data.raw["item"][name]
    local remnant = data.raw["corpse"][name.."-remnants"]
    local explosion = data.raw["explosion"][name.."-explosion"]

    local labeled_icon = {}
    local unlabeled_icon = {}

    if mapping == false then
        -- Setup icon with name-mapped tier labeling
        labeled_icon = 
        {
            {
                icon = reskin_functions.mod_directory.."/graphics/icons/"..subtype.."/"..name..".png"
            },
            {
                icon = reskin_functions.mod_directory.."/graphics/icons/tiers/"..size.."/tier-"..tier..".png"
            }
        }

        -- Setup icon without tier labeling
        unlabeled_icon = reskin_functions.mod_directory.."/graphics/icons/"..subtype.."/"..name..".png"
    else
        -- Setup icon with ingredient-mapped tier labeling
        labeled_icon = 
        {
            {
                icon = reskin_functions.mod_directory.."/graphics/icons/"..subtype.."/"..subtype.."-"..tier..".png"
            },
            {
                icon = reskin_functions.mod_directory.."/graphics/icons/tiers/"..size.."/tier-"..tier..".png"
            }
        }
    end

    -- Make particles and explosions   
    for key, value in pairs(particles) do 
        if value == "small" then
            particle_small = table.deepcopy(data.raw["optimized-particle"][subtype.."-metal-particle-small"])
            particle_small.name = name.."-metal-particle-small-tinted"
            particle_small.pictures.sheet.tint = reskin_functions.tint_index["tier-"..tier]
            particle_small.pictures.sheet.hr_version.tint = reskin_functions.tint_index["tier-"..tier]
            data:extend({particle_small})

        elseif value == "medium" then
            particle_medium = table.deepcopy(data.raw["optimized-particle"][subtype.."-metal-particle-medium"])
            particle_medium.name = name.."-metal-particle-medium-tinted"
            particle_medium.pictures.sheet.tint = reskin_functions.tint_index["tier-"..tier]
            particle_medium.pictures.sheet.hr_version.tint = reskin_functions.tint_index["tier-"..tier]
            data:extend({particle_medium})

        elseif value == "big" then
            particle_big = table.deepcopy(data.raw["optimized-particle"][subtype.."-metal-particle-big"])
            particle_big.name = name.."-metal-particle-big-tinted"
            particle_big.pictures.sheet.tint = reskin_functions.tint_index["tier-"..tier]
            particle_big.pictures.sheet.hr_version.tint = reskin_functions.tint_index["tier-"..tier]
            data:extend({particle_big})
        end
    end

    -- Make explosions. Big ones. The biggest explosions. Make Michael Bay proud!
    local explosion = table.deepcopy(data.raw["explosion"][subtype.."-explosion"])
    explosion.name = name.."-explosion"
    data:extend({explosion})

    -- Make remnants
    local remnant = table.deepcopy(data.raw["corpse"][subtype.."-remnants"])
    remnant.name = name.."-remnants"
    data:extend({remnant}) 

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

    -- Make assignments
    entity.icon_size = size
    entity.icon_mipmaps = mipmaps
    entity.corpse = remnant.name
    entity.dying_explosion = explosion.name

    item.icon_size = size
    item.icon_mipmaps = mipmaps
    
    remnant.icon_size = size
    remnant.icon_mipmaps = mipmaps

    explosion.icon_size = size
    explosion.icon_mipmaps = mipmaps
end