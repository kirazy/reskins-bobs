-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-solar"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set parameters
local type = "solar-panel"
local flags = 
{
    baseentity = "solar-panel",
    directory = reskins.bobs_structures.directory,
    folder = "solar-panel",
    particles = {"small"}
}

-- Solar panels have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["solar-panel-small"]   = 1,
        ["solar-panel-small-2"] = 2,
        ["solar-panel-small-3"] = 3,
        ["solar-panel"]   = 1,
        ["solar-panel-2"] = 2,
        ["solar-panel-3"] = 3,
        ["solar-panel-large"]   = 1,
        ["solar-panel-large-2"] = 2,
        ["solar-panel-large-3"] = 3
    }
else
    tier_map =
    {
        ["solar-panel-small"]   = 2,
        ["solar-panel-small-2"] = 3,
        ["solar-panel-small-3"] = 4,
        ["solar-panel"]   = 2,
        ["solar-panel-2"] = 3,
        ["solar-panel-3"] = 4,
        ["solar-panel-large"]   = 2,
        ["solar-panel-large-2"] = 3,
        ["solar-panel-large-3"] = 4
    }
    flags.remap_tiers = true
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Handle the three types of basenames
    if name == "solar-panel-small" or name == "solar-panel" or name == "solar-panel-large" then
        flags.basename = name
    else
        flags.basename = string.sub(name, 1, string.len(name)-2)
    end
    
    reskins.lib.setup_common_attributes(name, type, tier, flags)

    -- Initialize table addresses    
    remnant = data.raw["corpse"][name.."-remnants"]
    explosion = data.raw["explosion"][name.."-explosion"]
    
    -- Create explosions
    explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-small-tinted"

    -- Create remnants
    -- remnant.animation[1].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/"..name.."-remnants.png"
    -- remnant.animation[1].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    -- remnant.animation[2].filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/"..name.."-remnants.png"
    -- remnant.animation[2].hr_version.filename = flags.directory.."/graphics/entity/"..flags.folder.."/"..name.."/remnants/hr-"..name.."-remnants.png"
    
    -- Reskin entities
    if flags.basename == "solar-panel-small" then
        -- Overwrite picture table in target entity
        entity.picture =
        {
            layers =
            {
                {
                    filename = flags.directory.."/graphics/entity/solar-panel-small/solar-panel-small-base.png",
                    priority = "high",
                    width = 90,
                    height = 75,
                    shift = util.by_pixel(2.5, 0.25),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-small/hr-solar-panel-small-base.png",
                        priority = "high",
                        width = 180,
                        height = 150,
                        shift = util.by_pixel(5, 0.5),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/solar-panel-small/"..name.."/"..name.."-mask.png",
                    priority = "high",
                    width = 90,
                    height = 75,
                    shift = util.by_pixel(2.5, 0.25),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-small/"..name.."/hr-"..name.."-mask.png",
                        priority = "high",
                        width = 180,
                        height = 150,
                        shift = util.by_pixel(5, 0.5),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/solar-panel-small/solar-panel-small-shadow.png",
                    priority = "high",
                    width = 90,
                    height = 75,
                    shift = util.by_pixel(2.5, 0.25),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-small/hr-solar-panel-small-shadow.png",
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
                    filename = flags.directory.."/graphics/entity/solar-panel-small/solar-panel-small-shadow-overlay.png",
                    priority = "high",
                    width = 90,
                    height = 75,
                    shift = util.by_pixel(2.5, 0.25),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-small/hr-solar-panel-small-shadow-overlay.png",
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
        if flags.remap_tiers == true then
            entity.picture.layers[2].filename = flags.directory.."/graphics/entity/solar-panel-small/"..flags.basename.."-"..tier.."/"..flags.basename.."-"..tier.."-mask.png"
            entity.picture.layers[2].hr_version.filename = flags.directory.."/graphics/entity/solar-panel-small/"..flags.basename.."-"..tier.."/hr-"..flags.basename.."-"..tier.."-mask.png"
        end

    elseif flags.basename == "solar-panel" then
        -- Overwrite picture table in target entity
        entity.picture =
        {
            layers =
            {
                {
                    filename = flags.directory.."/graphics/entity/solar-panel/solar-panel-base.png",
                    priority = "high",
                    width = 116,
                    height = 112,
                    shift = util.by_pixel(-3, 3),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel/hr-solar-panel-base.png",
                        priority = "high",
                        width = 230,
                        height = 224,
                        shift = util.by_pixel(-3, 3.5),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/solar-panel/"..name.."/"..name.."-mask.png",
                    priority = "high",
                    width = 116,
                    height = 112,
                    shift = util.by_pixel(-3, 3),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel/"..name.."/hr-"..name.."-mask.png",
                        priority = "high",
                        width = 230,
                        height = 224,
                        shift = util.by_pixel(-3, 3.5),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/solar-panel/solar-panel-shadow.png",
                    priority = "high",
                    width = 112,
                    height = 90,
                    shift = util.by_pixel(10, 6),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel/hr-solar-panel-shadow.png",
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
                    filename = flags.directory.."/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
                    priority = "high",
                    width = 108,
                    height = 90,
                    shift = util.by_pixel(11, 6),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel/hr-solar-panel-shadow-overlay.png",
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
        if flags.remap_tiers == true then
            entity.picture.layers[2].filename = flags.directory.."/graphics/entity/solar-panel/"..flags.basename.."-"..tier.."/"..flags.basename.."-"..tier.."-mask.png"
            entity.picture.layers[2].hr_version.filename = flags.directory.."/graphics/entity/solar-panel/"..flags.basename.."-"..tier.."/hr-"..flags.basename.."-"..tier.."-mask.png"
        end

    elseif flags.basename == "solar-panel-large" then
        -- Overwrite picture table in target entity
        entity.picture =
        {
            layers =
            {
                {
                    filename = flags.directory.."/graphics/entity/solar-panel-large/solar-panel-large-base.png",
                    priority = "high",
                    width = 154,
                    height = 137,
                    shift = util.by_pixel(2.5, 1.75),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-large/hr-solar-panel-large-base.png",
                        priority = "high",
                        width = 308,
                        height = 274,
                        shift = util.by_pixel(5, 3.5),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/solar-panel-large/"..name.."/"..name.."-mask.png",
                    priority = "high",
                    width = 154,
                    height = 137,
                    shift = util.by_pixel(2.5, 1.75),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-large/"..name.."/hr-"..name.."-mask.png",
                        priority = "high",
                        width = 308,
                        height = 274,
                        shift = util.by_pixel(5, 3.5),
                        scale = 0.5
                    }
                },
                {
                    filename = flags.directory.."/graphics/entity/solar-panel-large/solar-panel-large-shadow.png",
                    priority = "high",
                    width = 154,
                    height = 137,
                    shift = util.by_pixel(2.5, 1.75),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-large/hr-solar-panel-large-shadow.png",
                        priority = "high",
                        width = 308,
                        height = 274,
                        shift = util.by_pixel(5, 3.5),
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
                    filename = flags.directory.."/graphics/entity/solar-panel-large/solar-panel-large-shadow-overlay.png",
                    priority = "high",
                    width = 154,
                    height = 137,
                    shift = util.by_pixel(2.5, 1.75),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/solar-panel-large/hr-solar-panel-large-shadow-overlay.png",
                        priority = "high",
                        width = 308,
                        height = 274,
                        shift = util.by_pixel(5, 3.5),
                        scale = 0.5
                    }
                }
            }
        }

        -- Handle tier mapping settings
        if flags.remap_tiers == true then
            entity.picture.layers[2].filename = flags.directory.."/graphics/entity/solar-panel-large/"..flags.basename.."-"..tier.."/"..flags.basename.."-"..tier.."-mask.png"
            entity.picture.layers[2].hr_version.filename = flags.directory.."/graphics/entity/solar-panel-large/"..flags.folder.."/"..flags.basename.."-"..tier.."/hr-"..flags.basename.."-"..tier.."-mask.png"
        end
    end

    -- Label to skip to next iteration
    ::continue::
end