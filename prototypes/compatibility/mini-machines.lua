-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check for mini-machines
if not mods["mini-machines"] then return end

local function rescale_minimachines_icon(name, source_name, type, icon_name)
    -- Initialize paths
    local destination = data.raw["item"][name]
    local source = data.raw["item"][source_name]

    -- Check to make sure this entity is valid
    if not destination then return end

    -- Transcribe icons and pictures
    local working_icons = table.deepcopy(source.icons)
    local working_pictures = table.deepcopy(source.pictures)

    -- Retarget image location
    for n = 1, #working_icons do
        working_icons[n].icon = string.gsub(working_icons[n].icon, "/"..icon_name.."/", "/"..icon_name.."/mini-")
    end

    for m = 1, #working_pictures.layers do
        working_pictures.layers[m].filename = string.gsub(working_pictures.layers[m].filename, "/"..icon_name.."/", "/"..icon_name.."/mini-")
    end

    -- Prepare for icon assignment
    local inputs = {
        type = type,
        icon_size = 64,
        icon_mipmaps = 4,
        icon = working_icons,
        icon_picture = working_pictures
    }

    -- Assign icons
    reskins.lib.assign_icons(name, inputs)
end

-- Electrolysers
local electrolysers = {
    ["mini-electro-1"] = "electrolyser",
    ["mini-electro-2"] = "electrolyser-2",
    ["mini-electro-3"] = "electrolyser-3",
    ["mini-electro-4"] = "electrolyser-4",
    ["mini-electro-5"] = "electrolyser-5",
}

for mini, origin in pairs(electrolysers) do
    rescale_minimachines_icon(mini, origin, "assembling-machine", "electrolyser")
end

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