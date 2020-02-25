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

reskins.lib.particle_index = 
{
    ["small"] = "-metal-particle-small",
    ["medium"] = "-metal-particle-medium",
    ["medium-long"] = "-long-metal-particle-medium",
    ["big"] = "-metal-particle-big"
}

reskins.lib.type = type

-- Most entities have a common process for reskinning, so consolidate the other functions under one superfunction for ease of use
function reskins.lib.setup_common_attributes(name, type, tier, flags)
    -- Parse flags
    reskins.lib.parse_flags(flags)    
    
    -- Create particles and explosions   
    if flags.make_explosions == true then   
        -- Create needed particles with appropriate tints
        for key, value in pairs(flags.particles) do 
            if value == "small" then
                reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[value], reskins.lib.tint_index["tier-"..tier])
            elseif value == "medium" then
                reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[value], reskins.lib.tint_index["tier-"..tier])
            elseif value == "big" then
                reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[value], reskins.lib.tint_index["tier-"..tier])
            elseif value == "medium-long" then
                reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[value], reskins.lib.tint_index["tier-"..tier])
            end
        end

        -- Create explosions. Big ones. The biggest explosions. Make Michael Bay proud!
        reskins.lib.create_explosion(name, type, flags.baseentity)
        
    end
  
    -- Create remnants
    if flags.make_remnants == true then
        reskins.lib.create_remnant(name, type, flags.baseentity)
    end

    -- Create icons
    if flags.make_icons == true then
        if flags.remap_tiers == false then
            if settings.startup["reskin-series-icon-tier-labeling"].value == true and tier > 0 then
                -- Setup icon with name-mapped tier labeling
                flags.icon = 
                {
                    {
                        icon = flags.directory.."/graphics/icons/"..flags.icon_subfolder.."/"..name..".png"
                    },
                    {
                        icon = flags.directory.."/graphics/icons/tiers/"..flags.icon_size.."/tier-"..tier..".png"
                    }
                }
            else
                -- Setup icon without tier labeling
                flags.icon = flags.directory.."/graphics/icons/"..flags.icon_subfolder.."/"..name..".png"
            end
        else
            if settings.startup["reskin-series-icon-tier-labeling"].value == true and tier > 0 then
                -- Setup icon with ingredient-mapped tier labeling
                flags.icon = 
                {
                    {
                        icon = flags.directory.."/graphics/icons/"..flags.icon_subfolder.."/"..flags.basename.."-"..tier..".png"
                    },
                    {
                        icon = flags.directory.."/graphics/icons/tiers/"..flags.icon_size.."/tier-"..tier..".png"
                    }
                }
            else
                -- Setup icon without tier labeling
                flags.icon = flags.directory.."/graphics/icons/"..flags.icon_subfolder.."/"..flags.basename.."-"..tier..".png"
            end
        end    
        
        -- Assign icons
        reskins.lib.assign_icons(name, type, flags)
    end
end

-- Parses the main flags table of parameters
function reskins.lib.parse_flags(flags)
    --[[Flags required by this function, unless specifically indicated optional
        basename        - Name of entity to be worked on
        baseentity      - Name of base-Factorio entity to copy features from
        directory       - Top-level mod directory, e.g. "__mod_directory__"
        icon_subfolder  - Name of folder located within graphics/icons containing icon graphics
        particles       - Particles to be created, accepted values: "small", "medium", "medium-long", "big"
        icon_size       - Pixel size of icons; optional; default 64
        icon_mipmaps    - Number of mipmaps present in the icon image file; optional; default 4
        remap_tiers     - Whether tiers were remapped from name-based to ingredient-based; optional; default false
        make_remnants   - Create remnants; optional; default true
        make_explosions - Create explosions; optional; default true
        make_icons      - Create icons; optional; default true]]
  
    -- Optional flags
    flags.icon_size       = flags.icon_size        or 64    -- Pixel size of icons
    flags.icon_mipmaps    = flags.icon_mipmaps     or 4     -- Number of mipmaps present in the icon image file       
    flags.remap_tiers     = flags.remap_tiers      or false -- If true, use special handling for icon creation

    -- These optional parameters are intended for debugging and prototype creation
    flags.make_remnants   = (flags.make_remnants   ~= false)  -- Create remnant entities; default true
    flags.make_explosions = (flags.make_explosions ~= false)  -- Create explosion entities and associated particles; default true
    flags.make_icons      = (flags.make_icons      ~= false)  -- Create icons; default true

    -- Ensure no attempt to make explosions if particles are not defined
    if not flags.particles then
        flags.make_explosions = false
    end

    return flags
end

function reskins.lib.assign_icons(name, type, flags)
    --[[ Flags required by this function
        icon            - Table or string defining icon
        icon_size       - Pixel size of icons
        icon_mipmaps    - Number of mipmaps present in the icon image file]]

    -- Initialize paths
    local entity = data.raw[type][name]
    local item = data.raw["item"][name]
    local explosion = data.raw["explosion"][name.."-explosion"]
    local remnant = data.raw["corpse"][name.."-remnants"]

    -- Check whether icon or icons, ensure the key we're not using is erased
    if reskins.lib.type(flags.icon) == "table" then
        -- Create icons that have multiple layers
        if entity then
            entity.icon = nil        
            entity.icons = flags.icon
        end

        if item then
            item.icon = nil
            item.icons = flags.icon
        end

        if explosion then 
            explosion.icon = nil        
            explosion.icons = flags.icon
        end

        if remnant then
            remnant.icon = nil
            remnant.icons = flags.icon
        end
    else
        -- Create icons that do not have multiple layers
        if entity then
            entity.icons = nil
            entity.icon = flags.icon
        end

        if item then
            item.icons = nil        
            item.icon = flags.icon
        end

        if explosion then
            explosion.icons = nil        
            explosion.icon = flags.icon
        end

        if remnant then
            remnant.icons = nil
            remnant.icon = flags.icon
        end
    end

    -- Make assignments common to all cases
    if entity then
        entity.icon_size = flags.icon_size
        entity.icon_mipmaps = flags.icon_mipmaps          
    end

    if item then
        item.icon_size = flags.icon_size
        item.icon_mipmaps = flags.icon_mipmaps 
    end

    if explosion then
        explosion.icon_size = flags.icon_size
        explosion.icon_mipmaps = flags.icon_mipmaps
    end
    
    if remnant then
        remnant.icon_size = flags.icon_size
        remnant.icon_mipmaps = flags.icon_mipmaps
    end
end

-- Create remnant entity; assign filenames after calling this function
function reskins.lib.create_remnant(name, type, source)
    local remnant = table.deepcopy(data.raw["corpse"][source.."-remnants"])
    remnant.name = name.."-remnants"
    data:extend({remnant})      

    data.raw[type][name]["corpse"] = remnant.name
end

-- Create explosion entity; assign particles after calling this function
function reskins.lib.create_explosion(name, type, source)
    local explosion = table.deepcopy(data.raw["explosion"][source.."-explosion"])
    explosion.name = name.."-explosion"
    data:extend({explosion})

    data.raw[type][name]["dying_explosion"] = explosion.name
end

-- Create particle entity
function reskins.lib.create_particle(name, source, particle, tint)
    local particle_entity = table.deepcopy(data.raw["optimized-particle"][source..particle])
    particle_entity.name = name..particle.."-tinted"
    particle_entity.pictures.sheet.tint = tint
    particle_entity.pictures.sheet.hr_version.tint = tint
    data:extend({particle_entity})
end