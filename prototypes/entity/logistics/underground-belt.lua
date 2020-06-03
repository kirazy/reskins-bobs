-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end

-- We reskin the base entities only if we're doing custom colors
local custom_colors = true
if settings.startup["reskins-lib-customize-tier-colors"].value == false then
    custom_colors = false
end

-- Set input parameters
local inputs = {
    type = "underground-belt",
    icon_name = "underground-belt",
    base_entity = "underground-belt",
    directory = reskins.bobs.directory,
    group = "logistics",
    particles = {["medium"] = 3, ["small"] = 2},
    make_belt_icon = true,
}

local tier_map =
{
    ["basic-underground-belt"] = {0, 1, true, true},
    ["underground-belt"] = {1, 1, custom_colors},
    ["fast-underground-belt"] = {2, 2, custom_colors},
    ["express-underground-belt"] = {3, 2, custom_colors},
    ["turbo-underground-belt"] = {4, 2, true},
    ["ultimate-underground-belt"] = {5, 2, true},
}

-- Reskin entities
for name, map in pairs(tier_map) do
    -- Initialize paths
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    variant = map[2]
    do_reskin = map[3]    

    -- Determine what tint we're using
    inputs.tint = reskins.bobs.belt_tint_handling(name, tier)

    if do_reskin then
        inputs.make_icons = true
    else
        inputs.make_icons = false
        reskins.lib.append_tier_labels_to_vanilla_icon(name, tier, inputs)
    end
    
    reskins.lib.setup_standard_entity(name, tier, inputs)    

    if do_reskin then
        -- Reskin remnants

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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                            priority = "extra-high",
                            width = 192,
                            height = 192,
                            y = 192,
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version = {
                            filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                            priority = "extra-high",
                            width = 192,
                            height =192,
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version =
                        {
                            filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                            priority = "extra-high",
                            width = 192,
                            height = 192,
                            y = 192*3,
                            tint = inputs.tint,
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
                        tint = inputs.tint,
                        hr_version =
                        {
                            filename = inputs.directory.."/graphics/entity/logistics/underground-belt/hr-underground-belt-structure-mask.png",
                            priority = "extra-high",
                            width = 192,
                            height = 192,
                            y = 192*2,
                            tint = inputs.tint,
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
        entity.belt_animation_set = reskins.bobs.transport_belt_animation_set(inputs.tint, variant)
    end

    -- Label to skip to next iteration
    ::continue::
end