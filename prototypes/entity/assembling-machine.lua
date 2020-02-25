-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobassembly"] then return end

-- Set parameters
local type = "assembling-machine"
local flags = {
    basename = "assembling-machine",
    baseentity = "assembling-machine-1",
    directory = reskins.bobs_structures.directory,
    icon_subfolder = "assembling-machine",
    particles = {"medium","big"},
    make_remnants   = false,
    make_explosions = false
    --make_icons      = false
}

local tier_map =
{
    ["assembling-machine-1"] = 0,
    ["assembling-machine-2"] = 1,
    ["assembling-machine-3"] = 2,
    ["assembling-machine-4"] = 3,
    ["assembling-machine-5"] = 4,
    ["assembling-machine-6"] = 5
}

--[[ Not ready for these yet
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map["electronics-machine-1"] = 1
    tier_map["electronics-machine-2"] = 2
    tier_map["electronics-machine-3"] = 3
else
    tier_map["electronics-machine-1"] = 1
    tier_map["electronics-machine-2"] = 2
    tier_map["electronics-machine-3"] = 4
    mapping = true
end]]

-- Reskin entities, create and assign extra details
for name, tier in pairs(tier_map) do
    -- Initialize table address 
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end
    
    reskins.lib.setup_common_attributes(name, type, tier, flags)

    -- Initialize table addresses    
    -- remnant = data.raw["corpse"][name.."-remnants"]
    -- explosion = data.raw["explosion"][name.."-explosion"]

    -- Create explosions
    -- explosion.created_effect.action_delivery.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    -- explosion.created_effect.action_delivery.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Create remnants
    -- remnant.animation[1].filename = reskin_functions.directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/"..name.."-remnants.png"
    -- remnant.animation[1].hr_version.filename = reskin_functions.directory.."/graphics/entity/"..subtype.."/"..name.."/remnants/hr-"..name.."-remnants.png"

    -- Reskin entities
    entity.animation =
    {
        layers =
        {
            {
                filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
                priority="high",
                width = 108,
                height = 114,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, 2),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/assembling-machine/"..name.."/hr-"..name..".png",
                    priority="high",
                    width = 214,
                    height = 237,
                    frame_count = 32,
                    line_length = 8,
                    shift = util.by_pixel(0, 2),
                    scale = 0.5
                }
            },
            {
                filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
                priority="high",
                width = 95,
                height = 83,
                frame_count = 1,
                line_length = 1,
                repeat_count = 32,
                draw_as_shadow = true,
                shift = util.by_pixel(8.5, 5.5),
                hr_version =
                {
                    filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
                    priority="high",
                    width = 190,
                    height = 165,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 32,
                    draw_as_shadow = true,
                    shift = util.by_pixel(8.5, 5),
                    scale = 0.5
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::    
end





