-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end
if settings.startup["reskins-lib-customize-tier-colors"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "underground-belt",
    root_name = "underground-belt",
    directory = reskins.bobs.directory,
    mod = "logistics",
    particles = {["medium"] = 3, ["small"] = 2}
}

local tier_map =
{
    ["basic-underground-belt"]    = {0, 1},
    ["underground-belt"]          = {1, 1},
    ["fast-underground-belt"]     = {2, 2},
    ["express-underground-belt"]  = {3, 2},
    ["turbo-underground-belt"]    = {4, 2},
    ["ultimate-underground-belt"] = {5, 2},
}

local color_adjustment = 40/255

-- Reskin entities
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    variant = map[2]

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- Tint adjustment
    adjusted_tint = reskins.lib.adjust_tint(inputs.tint, color_adjustment, 0.82)
    
    -- Reskin entities
    entity.structure = {
        direction_in = {
            sheets = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    y = 96,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure.png",
                        priority = "extra-high",
                        width = 192,
                        height = 192,
                        y = 192,
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    y = 96,
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                        priority = "extra-high",
                        width = 192,
                        height = 192,
                        y = 192,
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
        direction_out = {
            sheets = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure.png",
                        priority = "extra-high",
                        width = 192,
                        height =192,
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    tint = adjusted_tint,
                    hr_version = {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                        priority = "extra-high",
                        width = 192,
                        height =192,
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
        direction_in_side_loading = {
            sheets = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    y = 96*3,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure.png",
                        priority = "extra-high",
                        width = 192,
                        height = 192,
                        y = 192*3,
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    y = 96*3,
                    tint = adjusted_tint,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                        priority = "extra-high",
                        width = 192,
                        height = 192,
                        y = 192*3,
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
        direction_out_side_loading = {
            sheets = {
                -- Base
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    y = 96*2,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure.png",
                        priority = "extra-high",
                        width = 192,
                        height = 192,
                        y = 192*2,
                        scale = 0.5
                    }
                },
                -- Mask
                {
                    filename = inputs.directory.."/graphics/entity/logistics/underground-belt/underground-belt-structure-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    y = 96*2,
                    tint = adjusted_tint,
                    hr_version =
                    {
                        filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                        priority = "extra-high",
                        width = 192,
                        height = 192,
                        y = 192*2,
                        tint = adjusted_tint,
                        scale = 0.5
                    }
                }
            }
        },
        back_patch = {
            sheet = {
                filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure-back-patch.png",
                priority = "extra-high",
                width = 96,
                height = 96,
                hr_version =
                {
                    filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure-back-patch.png",
                    priority = "extra-high",
                    width = 192,
                    height = 192,
                    scale = 0.5
                }
            }
        },
        front_patch = {
            sheet = {
                filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure-front-patch.png",
                priority = "extra-high",
                width = 96,
                height = 96,
                hr_version =
                {
                    filename = "__base__/graphics/entity/express-underground-belt/hr-express-underground-belt-structure-front-patch.png",
                    priority = "extra-high",
                    width = 192,
                    height = 192,
                    scale = 0.5
                }
            }
        }
    }

    -- Apply belt set
    entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(adjusted_tint, variant)

    -- Label to skip to next iteration
    ::continue::
end