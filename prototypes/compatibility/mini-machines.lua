-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check for mini-machines
if not mods["mini-machines"] then return end

local assembling_machines = {
    ["mini-assembler-1"] = 0,
    ["mini-assembler-2"] = 1,
    ["mini-assembler-3"] = 2,
    ["mini-assembler-4"] = 3,
    ["mini-assembler-5"] = 4,
    ["mini-assembler-6"] = 5,
}

for name, tier in pairs(assembling_machines) do
    -- Setup working inputs
    inputs = {
        type = "assembling-machine",
        directory = reskins.bobs.directory
    }
    
    reskins.lib.parse_inputs(inputs)

    -- Setup tint
    inputs.tint = reskins.lib.tint_index["tier-"..tier]

    -- Initialize path
    entity = data.raw[inputs.type][name]
    
    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Setup Icons
    inputs.icon = {        
        -- Base
        {
            icon = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/assembling-machine-"..tier.."-icon-base.png"
        },
        -- Mask
        {
            icon = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/assembling-machine-"..tier.."-icon-mask.png",
            tint = inputs.tint
        },
        -- Highlights
        {
            icon = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/assembling-machine-"..tier.."-icon-highlights.png",
            tint = {1,1,1,0}
        },
        -- Gear
        {
            icon = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/gear-"..tier..".png"
        }
    }

    inputs.icon_picture = {
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/assembling-machine-"..tier.."-icon-base.png",
                size = inputs.icon_size,
                mipmaps = inputs.icon_mipmaps,
                scale = 0.25
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/assembling-machine-"..tier.."-icon-mask.png",
                size = inputs.icon_size,
                mipmaps = inputs.icon_mipmaps,
                scale = 0.25,
                tint = inputs.tint
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/assembling-machine-"..tier.."-icon-highlights.png",
                size = inputs.icon_size,
                mipmaps = inputs.icon_mipmaps,
                scale = 0.25,
                blend_mode = "additive"
            },
            -- Gear
            {
                filename = inputs.directory.."/graphics/icons/assembly/assembling-machine/small/gear-"..tier..".png",
                size = inputs.icon_size,
                mipmaps = inputs.icon_mipmaps,
                scale = 0.25
            }
        }
    }

    -- Setup tier labels
    if settings.startup["reskins-lib-icon-tier-labeling"].value == true and tier > 0 then
        local tier_label = {
            icon = reskins.lib.directory.."/graphics/icons/tiers/"..inputs.icon_size.."/tier-"..tier..".png"
        }

        local tier_label_tinted = {
            icon = reskins.lib.directory.."/graphics/icons/tiers/"..inputs.icon_size.."/tier-"..tier..".png",
            tint = reskins.lib.adjust_alpha(reskins.lib.tint_index["tier-"..tier], 0.75)
        }
        table.insert(inputs.icon, tier_labe)
        table.insert(inputs.icon, tier_label_tinted)
    end

    -- Assign the icon
    reskins.lib.assign_icons(name, inputs)

    -- Label to skip to next iteration
    ::continue::
end