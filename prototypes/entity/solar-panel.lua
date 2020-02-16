-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-solar"].value == false then return end

-- Set parameters
local type = "solar-panel"
local subtype = "solar-panel"
local size = 64
local mipmaps = 4
local particles = {"small"}
local mapping = false
local remnants = true
local tier_map = {}

if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["solar-panel-small"]   = 1,
        ["solar-panel-small-2"] = 2,
        ["solar-panel-small-3"] = 3,
        ["solar-panel"]   = 1,
        ["solar-panel-2"] = 2,
        ["solar-panel-3"] = 3
    }
else
    tier_map =
    {
        ["solar-panel-small"]   = 2,
        ["solar-panel-small-2"] = 3,
        ["solar-panel-small-3"] = 4,
        ["solar-panel"]   = 2,
        ["solar-panel-2"] = 3,
        ["solar-panel-3"] = 4
    }
    mapping = true
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Initialize subname
    subname = {}

    -- Handle subname, used when ingredient-mapping tiers
    if name == "solar-panel-small" or name == "solar-panel" or name == "solar-panel-large" then
        subname = name
    else
        subname = string.sub(name, 1, string.len(name)-2)
    end

    reskin_functions.setup_common_attributes(name, type, subtype, tier, size, mipmaps, particles, mapping, remnants, subname)

    -- Initialize table addresses    
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]
    
    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-small-tinted"

    -- Create remnants
    remnant.animation[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    remnant.animation[2].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
    remnant.animation[2].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    
    -- Reskin entities
    if subname == "solar-panel-small" then
        -- Overwrite picture table in target entity
        entity.picture =
        {
            layers =
            {
                {
                    filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name..".png",
                    priority = "high",
                    width = 116,
                    height = 112,
                    shift = util.by_pixel(-3, 3),
                    hr_version =
                    {
                        filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name..".png",
                        priority = "high",
                        width = 180,
                        height = 150,
                        shift = util.by_pixel(5, 0.5),
                        scale = 0.5
                    }
                },
                {
                    filename = reskin_functions.mod_directory.."/graphics/entity/solar-panel/solar-panel-small/solar-panel-small-shadow.png",
                    priority = "high",
                    width = 112,
                    height = 90,
                    shift = util.by_pixel(10, 6),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = reskin_functions.mod_directory.."/graphics/entity/solar-panel/solar-panel-small/hr-solar-panel-small-shadow.png",
                        priority = "high",
                        width = 180,
                        height = 150,
                        shift = util.by_pixel(5, 0.5),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        }

        -- Overwrite or create overlay table in target entity
        entity.overlay = 
        {
            layers =
            {
                {
                    filename = reskin_functions.mod_directory.."/graphics/entity/solar-panel/solar-panel-small/solar-panel-small-shadow-overlay.png",
                    priority = "high",
                    width = 108,
                    height = 90,
                    shift = util.by_pixel(11, 6),
                    hr_version =
                    {
                        filename = reskin_functions.mod_directory.."/graphics/entity/solar-panel/solar-panel-small/hr-solar-panel-small-shadow-overlay.png",
                        priority = "high",
                        width = 180,
                        height = 150,
                        shift = util.by_pixel(5, 0.5),
                        scale = 0.5
                    }
                }
            }
        }

        -- Handle tier mapping settings
        if mapping == true then
            entity.picture.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..subname.."-"..tier.."/"..subname.."-"..tier..".png"
            entity.picture.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..subname.."-"..tier.."/hr-"..subname.."-"..tier..".png"
        end

    elseif subname == "solar-panel" then
        -- Overwrite picture table in target entity
        entity.picture =
        {
            layers =
            {
                {
                    filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/"..name..".png",
                    priority = "high",
                    width = 116,
                    height = 112,
                    shift = util.by_pixel(-3, 3),
                    hr_version =
                    {
                        filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..name.."/hr-"..name..".png",
                        priority = "high",
                        width = 230,
                        height = 224,
                        shift = util.by_pixel(-3, 3.5),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
                    priority = "high",
                    width = 112,
                    height = 90,
                    shift = util.by_pixel(10, 6),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow.png",
                        priority = "high",
                        width = 220,
                        height = 180,
                        shift = util.by_pixel(9.5, 6),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        }

        -- Overwrite or create overlay table in target entity
        entity.overlay = 
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
                    priority = "high",
                    width = 108,
                    height = 90,
                    shift = util.by_pixel(11, 6),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow-overlay.png",
                        priority = "high",
                        width = 214,
                        height = 180,
                        shift = util.by_pixel(10.5, 6),
                        scale = 0.5
                    }
                }
            }
        }

        -- Handle tier mapping settings
        if mapping == true then
            entity.picture.layers[1].filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..subname.."-"..tier.."/"..subname.."-"..tier..".png"
            entity.picture.layers[1].hr_version.filename = reskin_functions.mod_directory.."/graphics/entity/"..subtype.."/"..subname.."-"..tier.."/hr-"..subname.."-"..tier..".png"
        end

    elseif subname == "solar-panel-large" then

    end

    -- Label to skip to next iteration
    ::continue::
end