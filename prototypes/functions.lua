-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- When we move beyond this one mod effort we'll move this into a shared library.

-- Make our function host
if not reskins then reskins = {} end
if not reskins.lib then reskins.lib = {} end

-- Most entities have a common process for reskinning, so consolidate the other functions under one superfunction for ease of use
function reskins.lib.setup_common_attributes(name, tier, inputs)
    -- Parse inputs
    reskins.lib.parse_inputs(inputs)    
    
    -- Create particles and explosions   
    if inputs.make_explosions == true then   
        -- Create explosions. Big ones. The biggest explosions. Make Michael Bay proud!
        reskins.lib.create_explosion(name, inputs)
        
        -- Create and assign needed particles with appropriate tints
        for particle, key in pairs(inputs.particles) do 
            -- Create and assign the particle
            reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index[particle], key, reskins.lib.tint_index["tier-"..tier])
        end
    end
  
    -- Create remnants
    if inputs.make_remnants == true then
        reskins.lib.create_remnant(name, inputs)
    end

    -- Create icons
    if inputs.make_icons == true then
        -- Setup standard icon
        inputs.icon = inputs.directory.."/graphics/icons/"..inputs.group.."/"..inputs.root_name.."/"..inputs.internal_name..".png"

        -- Setup icon with tier label
        if settings.startup["reskin-series-icon-tier-labeling"].value == true and tier > 0 then
            inputs.icon = 
            {
                {
                    icon = inputs.icon
                },
                {
                    icon = inputs.directory.."/graphics/icons/tiers/"..inputs.icon_size.."/tier-"..tier..".png",
                },
                {
                    icon = inputs.directory.."/graphics/icons/tiers/"..inputs.icon_size.."/tier-"..tier..".png",
                    tint = reskins.lib.adjust_alpha(reskins.lib.tint_index["tier-"..tier], 0.75),
                }
            }
        end
        
        -- Assign icons
        reskins.lib.assign_icons(name, inputs)
    end
end

-- Parses the main inputs table of parameters
function reskins.lib.parse_inputs(inputs)
    -- Check that we have a particles table
    if not inputs.particles then
        inputs.make_explosions = false
    end
    
    -- Constructs defaults for optional input parameters.
    inputs.icon_size       = inputs.icon_size        or 64      -- Pixel size of icons
    inputs.icon_mipmaps    = inputs.icon_mipmaps     or 4       -- Number of mipmaps present in the icon image file       
    inputs.make_explosions = (inputs.make_explosions ~= false)  -- Create explosions; default true
    inputs.make_remnants   = (inputs.make_remnants   ~= false)  -- Create remnant; default true
    inputs.make_icons      = (inputs.make_icons      ~= false)  -- Create icons; default true

    return inputs
end

function reskins.lib.assign_icons(name, inputs)
    -- inputs required by this function
    -- type            - Entity type
    -- icon            - Table or string defining icon
    -- icon_size       - Pixel size of icons
    -- icon_mipmaps    - Number of mipmaps present in the icon image file

    -- Initialize paths
    local entity = data.raw[inputs.type][name]
    local item = data.raw["item"][name]
    local explosion = data.raw["explosion"][name.."-explosion"]
    local remnant = data.raw["corpse"][name.."-remnants"]

    -- Check whether icon or icons, ensure the key we're not using is erased
    if type(inputs.icon) == "table" then
        -- Create icons that have multiple layers
        if entity then
            entity.icon = nil        
            entity.icons = inputs.icon
        end

        if item then
            item.icon = nil
            item.icons = inputs.icon
        end

        if explosion then 
            explosion.icon = nil        
            explosion.icons = inputs.icon
        end

        if remnant then
            remnant.icon = nil
            remnant.icons = inputs.icon
        end
    else
        -- Create icons that do not have multiple layers
        if entity then
            entity.icons = nil
            entity.icon = inputs.icon
        end

        if item then
            item.icons = nil        
            item.icon = inputs.icon
        end

        if explosion then
            explosion.icons = nil        
            explosion.icon = inputs.icon
        end

        if remnant then
            remnant.icons = nil
            remnant.icon = inputs.icon
        end
    end

    -- Make assignments common to all cases
    if entity then
        entity.icon_size = inputs.icon_size
        entity.icon_mipmaps = inputs.icon_mipmaps          
    end

    if item then
        item.icon_size = inputs.icon_size
        item.icon_mipmaps = inputs.icon_mipmaps 
    end

    if explosion then
        explosion.icon_size = inputs.icon_size
        explosion.icon_mipmaps = inputs.icon_mipmaps
    end
    
    if remnant then
        remnant.icon_size = inputs.icon_size
        remnant.icon_mipmaps = inputs.icon_mipmaps
    end
end

-- Create remnant entity; assign filenames after calling this function
function reskins.lib.create_remnant(name, inputs)
    -- Inputs expected by this function:
    -- base_entity - Entity to copy remnant prototype from
    -- type        - Entity type

    -- Copy remnant prototype
    local remnant = table.deepcopy(data.raw["corpse"][inputs.base_entity.."-remnants"])
    remnant.name = name.."-remnants"
    data:extend({remnant})      

    -- Assign corpse to originating entity
    data.raw[inputs.type][name]["corpse"] = remnant.name
end

-- Create explosion; assign particles after calling this function
function reskins.lib.create_explosion(name, inputs)
    -- Inputs expected by this function:
    -- base_entity - Entity to copy remnant prototype from
    -- type        - Entity type

    -- Copy explosion prototype
    local explosion = table.deepcopy(data.raw["explosion"][inputs.base_entity.."-explosion"])
    explosion.name = name.."-explosion"
    data:extend({explosion})

    -- Assign explosion to originating entity
    data.raw[inputs.type][name]["dying_explosion"] = explosion.name
end

-- Create tinted particle
function reskins.lib.create_particle(name, base_entity, base_particle, key, tint)
    -- Copy the particle prototype
    local particle = table.deepcopy(data.raw["optimized-particle"][base_entity.."-"..base_particle])
    particle.name = name.."-"..base_particle.."-tinted"
    particle.pictures.sheet.tint = tint
    particle.pictures.sheet.hr_version.tint = tint
    data:extend({particle})

    -- Assign particle to originating explosion
    data.raw["explosion"][name.."-explosion"]["created_effect"]["action_delivery"]["target_effects"][key].particle_name = particle.name
end

function reskins.lib.adjust_alpha(tint, alpha)
    adjusted_tint = {tint[1], tint[2], tint[3], alpha*255}
    return adjusted_tint
end

function reskins.lib.tint_hex_to_rgb(hex)
    hex = hex:gsub("#","")
    tint = {tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))}
    return tint
end

function reskins.lib.make_4way_animation_from_spritesheet(animation)
    local function make_animation_layer(idx, anim)
      local start_frame = (anim.frame_count or 1) * idx
      local x = 0
      local y = 0
      if anim.line_length then
        y = anim.height * math.floor(start_frame / (anim.line_length or 1))
      else
        x = idx * anim.width
      end
      return
      {
        filename = anim.filename,
        priority = anim.priority or "high",
        x = x,
        y = y,
        width = anim.width,
        height = anim.height,
        frame_count = anim.frame_count or 1,
        line_length = anim.line_length,
        repeat_count = anim.repeat_count,
        shift = anim.shift,
        draw_as_shadow = anim.draw_as_shadow,
        force_hr_shadow = anim.force_hr_shadow,
        apply_runtime_tint = anim.apply_runtime_tint,
        scale = anim.scale or 1,
        tint = anim.tint,
        blend_mode = anim.blend_mode
      }
    end
  
    local function make_animation_layer_with_hr_version(idx, anim)
      local anim_parameters = make_animation_layer(idx, anim)
      if anim.hr_version and anim.hr_version.filename then
        anim_parameters.hr_version = make_animation_layer(idx, anim.hr_version)
      end
      return anim_parameters
    end
  
    local function make_animation(idx)
      if animation.layers then
        local tab = { layers = {} }
        for k,v in ipairs(animation.layers) do
          table.insert(tab.layers, make_animation_layer_with_hr_version(idx, v))
        end
        return tab
      else
        return make_animation_layer_with_hr_version(idx, animation)
      end
    end
  
    return
    {
      north = make_animation(0),
      east = make_animation(1),
      south = make_animation(2),
      west = make_animation(3)
    }
  end

if settings.startup["reskin-series-customize-tier-colors"].value == true then
    reskins.lib.tint_index =
    {
        ["tier-0"] = reskins.lib.tint_hex_to_rgb(settings.startup["reskin-series-custom-colors-tier-0"].value),
        ["tier-1"] = reskins.lib.tint_hex_to_rgb(settings.startup["reskin-series-custom-colors-tier-1"].value),
        ["tier-2"] = reskins.lib.tint_hex_to_rgb(settings.startup["reskin-series-custom-colors-tier-2"].value),
        ["tier-3"] = reskins.lib.tint_hex_to_rgb(settings.startup["reskin-series-custom-colors-tier-3"].value),
        ["tier-4"] = reskins.lib.tint_hex_to_rgb(settings.startup["reskin-series-custom-colors-tier-4"].value),
        ["tier-5"] = reskins.lib.tint_hex_to_rgb(settings.startup["reskin-series-custom-colors-tier-5"].value),
    }
else
    reskins.lib.tint_index =
    {
        ["tier-0"] = reskins.lib.tint_hex_to_rgb("4d4d4d"),
        ["tier-1"] = reskins.lib.tint_hex_to_rgb("de9400"),
        ["tier-2"] = reskins.lib.tint_hex_to_rgb("c20600"),
        ["tier-3"] = reskins.lib.tint_hex_to_rgb("1b87c2"),
        ["tier-4"] = reskins.lib.tint_hex_to_rgb("a600bf"),
        ["tier-5"] = reskins.lib.tint_hex_to_rgb("23de55"),
    }
end

reskins.lib.particle_index = 
{
    ["tiny-stone"] = "stone-particle-tiny",
    ["small"] = "metal-particle-small",
    ["small-stone"] = "stone-particle-small",
    ["medium"] = "metal-particle-medium",
    ["medium-long"] = "long-metal-particle-medium",
    ["medium-stone"] = "stone-particle-medium",
    ["big"] = "metal-particle-big",
    ["big-stone"] = "stone-particle-big"

}

