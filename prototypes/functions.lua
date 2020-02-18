-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- When we move beyond this one mod effort we'll move this into a shared library.

-- Make our function host
if not reskins then reskins = {} end
if not reskins.lib then reskins.lib = {} end

reskins.lib.tint_index =
{
    ["tier-0"] = {r = 197, g = 197, b = 197},
    ["tier-1"] = {r = 242, g = 177, b = 46 },
    ["tier-2"] = {r = 220, g = 48,  b = 41 },
    ["tier-3"] = {r = 71,  g = 168, b = 219},
    ["tier-4"] = {r = 203, g = 28,  b = 229},
    ["tier-5"] = {r = 74,  g = 239, b = 119}
}

-- Set icons for each of the four main types
function reskins.lib.setup_common_attributes(name, type, tier, flags)
    --[[FLAG STRUCTURE:
        Place in each lua file calling this function; optional flags can be omitted
        
        require("prototypes.functions")

        local flags = 
        {
            basename = "entity-name-without-tier-numbering",
            baseentity = "source-entity",
            directory   = "__mod_directory__",
            folder = "image-folder",
            icon_size = 64,
            icon_mipmaps = 4,
            particles = {"small","medium","big"},
            remap_tiers     = false,
            make_remnants   = false,
            make_explosions = false,
            make_icons      = false
        }]]

    -- Required flags
    local basename    = flags.basename   -- Root common name for tiered entities
    local baseentity  = flags.baseentity -- Source entity in base Factorio
    local directory   = flags.directory  -- Mod directory of the mod calling this function 
    local folder      = flags.folder     -- Image folder within icons or entity folders containing entity-segregated subfolders with sprites
    
    -- Optional flags
    local size            = flags.icon_size       or 64    -- Pixel size of icons
    local mipmaps         = flags.icon_mipmaps    or 4     -- Number of mipmaps present in the icon image file       
    local particles       = flags.particles       or nil   -- Array of particles to create; default nil. Valid entries: "small", "medium", "big"
    local remap_tiers     = flags.remap_tiers     or false -- If true, use special handling for icon creation
    local make_remnants   = (flags.make_remnants   ~= false)  -- Create remnant entities; default true
    local make_explosions = (flags.make_explosions ~= false)  -- Create explosion entities and associated particles; default true
    local make_icons      = (flags.make_icons      ~= false)  -- Create icons; default true

    -- Ensure no attempt to make explosions if particles are not defined
    if not particles then
        make_explosions = false
        error(name.." did not detect partciles properly.")
    end
    
    local labeled_icon, unlabled_icon
    if remap_tiers == false then
        -- Setup icon with name-mapped tier labeling
        labeled_icon = 
        {
            {
                icon = directory.."/graphics/icons/"..folder.."/"..name..".png"
            },
            {
                icon = directory.."/graphics/icons/tiers/"..size.."/tier-"..tier..".png"
            }
        }

        -- Setup icon without tier labeling
        unlabeled_icon = directory.."/graphics/icons/"..folder.."/"..name..".png"
    else
        -- Setup icon with ingredient-mapped tier labeling
        labeled_icon = 
        {
            {
                icon = directory.."/graphics/icons/"..folder.."/"..basename.."-"..tier..".png"
            },
            {
                icon = directory.."/graphics/icons/tiers/"..size.."/tier-"..tier..".png"
            }
        }

        -- Setup icon without tier labeling
        unlabeled_icon = directory.."/graphics/icons/"..folder.."/"..basename.."-"..tier..".png"
    end

     -- Create particles and explosions   
    if make_explosions == true then   
        -- Create needed particles with appropriate tints
        for key, value in pairs(particles) do 
            if value == "small" then
                particle_small = table.deepcopy(data.raw["optimized-particle"][baseentity.."-metal-particle-small"])
                particle_small.name = name.."-metal-particle-small-tinted"
                particle_small.pictures.sheet.tint = reskins.lib.tint_index["tier-"..tier]
                particle_small.pictures.sheet.hr_version.tint = reskins.lib.tint_index["tier-"..tier]
                data:extend({particle_small})

            elseif value == "medium" then
                particle_medium = table.deepcopy(data.raw["optimized-particle"][baseentity.."-metal-particle-medium"])
                particle_medium.name = name.."-metal-particle-medium-tinted"
                particle_medium.pictures.sheet.tint = reskins.lib.tint_index["tier-"..tier]
                particle_medium.pictures.sheet.hr_version.tint = reskins.lib.tint_index["tier-"..tier]
                data:extend({particle_medium})

            elseif value == "big" then
                particle_big = table.deepcopy(data.raw["optimized-particle"][baseentity.."-metal-particle-big"])
                particle_big.name = name.."-metal-particle-big-tinted"
                particle_big.pictures.sheet.tint = reskins.lib.tint_index["tier-"..tier]
                particle_big.pictures.sheet.hr_version.tint = reskins.lib.tint_index["tier-"..tier]
                data:extend({particle_big})

            elseif value == "medium-long" then
                particle_medium_long = table.deepcopy(data.raw["optimized-particle"][baseentity.."-long-metal-particle-medium"])
                particle_medium_long.name = name.."-long-metal-particle-medium-tinted"
                particle_medium_long.pictures.sheet.tint = reskins.lib.tint_index["tier-"..tier]
                particle_medium_long.pictures.sheet.hr_version.tint = reskins.lib.tint_index["tier-"..tier]
                data:extend({particle_medium_long})
            end
        end

        -- Create explosions. Big ones. The biggest explosions. Make Michael Bay proud!
        local explosion = table.deepcopy(data.raw["explosion"][baseentity.."-explosion"])
        explosion.name = name.."-explosion"
        data:extend({explosion})

        data.raw[type][name]["dying_explosion"] = explosion.name
    end
  
    -- Create remnants
    if make_remnants == true then
        local remnant = table.deepcopy(data.raw["corpse"][baseentity.."-remnants"])
        remnant.name = name.."-remnants"
        data:extend({remnant})      

        data.raw[type][name]["corpse"] = remnant.name
    end

    -- Create icons
    if make_icons == true then
        -- Initialize paths
        local entity = data.raw[type][name]
        local item = data.raw["item"][name]
        local explosion = data.raw["explosion"][name.."-explosion"]
        local remnant = data.raw["corpse"][name.."-remnants"]

        -- Check whether icon or icons, ensure the key we're not using is erased
        if settings.startup["reskin-series-icon-tier-labeling"].value == true and tier > 0 then
            -- Create icons with tier labels
            entity.icon = nil        
            entity.icons = labeled_icon     

            item.icon = nil
            item.icons = labeled_icon        

            if explosion then 
                explosion.icon = nil        
                explosion.icons = labeled_icon
            end

            if remnant then
                remnant.icon = nil
                remnant.icons = labeled_icon
            end
        else
            -- Create icons without tier labels
            entity.icons = nil
            entity.icon = unlabeled_icon

            item.icons = nil        
            item.icon = unlabeled_icon

            if explosion then
                explosion.icons = nil        
                explosion.icon = unlabeled_icon
            end

            if remnant then
                remnant.icons = nil
                remnant.icon = unlabeled_icon
            end
        end

        -- Make assignments common to all cases
        entity.icon_size = size
        entity.icon_mipmaps = mipmaps          

        item.icon_size = size
        item.icon_mipmaps = mipmaps 

        if explosion then
            -- entity.dying_explosion = explosion.name
            explosion.icon_size = size
            explosion.icon_mipmaps = mipmaps
        end
        
        if remnant then
            -- entity.corpse = remnant.name
            remnant.icon_size = size
            remnant.icon_mipmaps = mipmaps
        end
    end
end