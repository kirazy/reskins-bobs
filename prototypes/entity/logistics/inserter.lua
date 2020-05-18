-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end

-- Set input parameters
local inputs = {
    type = "inserter",
    icon_name = "inserter",
    directory = reskins.bobs.directory,
    group = "logistics",
    particles = {["medium"] = 1},
    make_remnants = false,
    make_icons = false
}

local inserter_map, inserter_tint_index
if settings.startup["bobmods-logistics-inserteroverhaul"].value == true then
    inserter_map = {
        -- Standard inserters
        ["inserter"] = 1,
        ["red-inserter"] = 2,
        ["fast-inserter"] = 3,
        ["turbo-inserter"] = 4,
        ["express-inserter"] = 5,

        -- Filter inserters
        ["yellow-filter-inserter"] = 1,
        ["red-filter-inserter"] = 2,
        ["filter-inserter"] = 3,
        ["turbo-filter-inserter"] = 4,
        ["express-filter-inserter"] = 5,

        -- Stack inserters
        ["red-stack-inserter"] = 2,
        ["stack-inserter"] = 3,
        ["turbo-stack-inserter"] = 4,
        ["express-stack-inserter"] = 5,

        -- Stack filter inserters
        ["red-stack-filter-inserter"] = 2,
        ["stack-filter-inserter"] = 3,
        ["turbo-stack-filter-inserter"] = 4,
        ["express-stack-filter-inserter"] = 5,
    }
else
    return -- We're not dealing with this right now
    -- inserter_map =
    -- {
    --     -- Standard inserters
    --     -- ["inserter"]             = {1, "", true},
    --     -- ["long-handed-inserter"] = {2, "", true},
    --     -- ["fast-inserter"]        = {3, "", true},
    --     ["express-inserter"]     = {4},

    --     -- Filter inserters
    --     -- ["filter-inserter"]         = {3, "filter-", true},
    --     ["express-filter-inserter"] = {4, "filter-"},

    --     -- Stack inserters
    --     -- ["stack-inserter"]         = {3, "stack-", true},
    --     ["express-stack-inserter"] = {4, "stack-"},

    --     -- Stack filter inserters
    --     -- ["stack-filter-inserter"]         = {3, "stack-filter-", true},
    --     ["express-stack-filter-inserter"] = {4, "stack-filter-"}
    -- }
    -- inserter_tint_index = 
    -- {
    --     ["express-inserter"]              = {r = 48, g = 215, b = 156},
    --     ["express-filter-inserter"]       = {r = 223, g = 87, b = 194},
    --     ["express-stack-inserter"]        = {r = 45, g = 205, b = 63},
    --     ["express-stack-filter-inserter"] = {r = 126, g = 126, b = 126}
    -- }
end

-- Remnant reskin functions
local function stack_inserter_remnants(name)
    return
    make_rotated_animation_variations_from_sheet (4,
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/remnants/"..name.."-remnants.png",
        line_length = 1,
        width = 66,
        height = 50,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3, -1),
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/remnants/hr-"..name.."-remnants.png",
            line_length = 1,
            width = 132,
            height = 96,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(3, -1.5),
            scale = 0.5,
        },
    })
end

local function inserter_remnants(name)
    return
    make_rotated_animation_variations_from_sheet (4,
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/remnants/"..name.."-remnants.png",
        line_length = 1,
        width = 68,
        height = 48,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(4, -2),
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/remnants/hr-"..name.."-remnants.png",
            line_length = 1,
            width = 134,
            height = 94,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(3.5, -2),
            scale = 0.5,
        },
    })
end

-- Inserter Arms
local function inserter_arm_picture(parameters)
    arm_picture = {
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/inserter-arm-base.png",
                priority = "extra-high",
                width = 16,
                height = 68,
                flags = {"no-crop"},
                scale = 0.5,
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/hr-inserter-arm-base.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    flags = {"no-crop"},
                    scale = 0.25
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/inserter-arm-mask.png",
                priority = "extra-high",
                width = 16,
                height = 68,
                flags = {"no-crop"},
                tint = parameters.tint,
                scale = 0.5,
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/hr-inserter-arm-mask.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    flags = {"no-crop"},
                    tint = parameters.tint,
                    scale = 0.25
                }
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/inserter-arm-highlights.png",
                priority = "extra-high",
                width = 16,
                height = 68,
                flags = {"no-crop"},
                blend_mode = "additive",
                scale = 0.5,
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/hr-inserter-arm-highlights.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    flags = {"no-crop"},
                    blend_mode = "additive",
                    scale = 0.25
                }
            }
        }
    }

    -- Check to see if we're a filter inserter, and if so, replace the mask/highlights
    if parameters.filter then
        arm_picture.layers[2].filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/filter-inserter-arm-mask.png"
        arm_picture.layers[2].hr_version.filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/hr-filter-inserter-arm-mask.png"
        arm_picture.layers[3].filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/filter-inserter-arm-highlights.png"
        arm_picture.layers[3].hr_version.filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/hr-filter-inserter-arm-highlights.png"
    end

    return arm_picture       
end

local function inserter_arm_shadow()
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/inserter-arm-shadow.png",
        priority = "extra-high",
        width = 16,
        height = 68,
        flags = {"no-crop"},
        draw_as_shadow = true,
        scale = 0.5,
        hr_version = {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-arm/hr-inserter-arm-shadow.png",
            priority = "extra-high",
            width = 32,
            height = 136,
            flags = {"no-crop"},
            draw_as_shadow = true,
            scale = 0.25
        }
    }
end

-- Hand open, closed for stack, standard, and long-handed inserters
local function inserter_hand_picture(parameters)
    hand_picture = {
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/"..parameters.type.."-hand-"..parameters.hand.."-base.png",
                priority = "extra-high",
                width = 65,
                height = 82,
                flags = {"no-crop"},
                scale = 0.5,
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/hr-"..parameters.type.."-hand-"..parameters.hand.."-base.png",
                    priority = "extra-high",
                    width = 130,
                    height = 164,
                    flags = {"no-crop"},
                    scale = 0.25
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/"..parameters.type.."-hand-"..parameters.hand.."-mask.png",
                priority = "extra-high",
                width = 65,
                height = 82,
                flags = {"no-crop"},
                scale = 0.5,
                tint = parameters.tint,
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/hr-"..parameters.type.."-hand-"..parameters.hand.."-mask.png",
                    priority = "extra-high",
                    width = 130,
                    height = 164,
                    flags = {"no-crop"},
                    tint = parameters.tint,
                    scale = 0.25
                }
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/"..parameters.type.."-hand-"..parameters.hand.."-highlights.png",
                priority = "extra-high",
                width = 65,
                height = 82,
                flags = {"no-crop"},
                scale = 0.5,
                blend_mode = "additive",
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/hr-"..parameters.type.."-hand-"..parameters.hand.."-highlights.png",
                    priority = "extra-high",
                    width = 130,
                    height = 164,
                    flags = {"no-crop"},
                    blend_mode = "additive",
                    scale = 0.25
                }
            }
        }
    }

    -- Check to see if we're a filter inserter, and if so, replace the mask/highlights
    if parameters.filter then
        hand_picture.layers[2].filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/filter-"..parameters.type.."-hand-mask.png"
        hand_picture.layers[2].hr_version.filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/hr-filter-"..parameters.type.."-hand-mask.png"
        hand_picture.layers[3].filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/filter-"..parameters.type.."-hand-highlights.png"
        hand_picture.layers[3].hr_version.filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/hr-filter-"..parameters.type.."-hand-highlights.png"
    end

    return hand_picture    
end

local function inserter_hand_shadow(parameters)
    -- Long-handed inserter types share a shadow with standard inserters
    if parameters.type == "long-inserter" then
        parameters.shadow = "inserter"
    else
        parameters.shadow = parameters.type
    end
    return

    -- Shadow
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/"..parameters.shadow.."-hand-"..parameters.hand.."-shadow.png",
        priority = "extra-high",
        width = 65,
        height = 82,
        flags = {"no-crop"},
        scale = 0.5,
        draw_as_shadow = true,
        hr_version = {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/inserter-hand/hr-"..parameters.shadow.."-hand-"..parameters.hand.."-shadow.png",
            priority = "extra-high",
            width = 130,
            height = 164,
            flags = {"no-crop"},
            draw_as_shadow = true,
            scale = 0.25
        }
    }
end

-- Platform
local function inserter_platform_picture(parameters)
    return
    {
        sheets = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/inserter-platform-base.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                shift = util.by_pixel(2, 6.5),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/hr-inserter-platform-base.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    shift = util.by_pixel(2, 6.5),
                    scale = 0.5
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/inserter-platform-mask.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                tint = parameters.tint,
                shift = util.by_pixel(2, 6.5),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/hr-inserter-platform-mask.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    tint = parameters.tint,
                    shift = util.by_pixel(2, 6.5),
                    scale = 0.5
                }
            },
            -- Highlights
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/inserter-platform-highlights.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                blend_mode = "additive",
                shift = util.by_pixel(2, 6.5),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/hr-inserter-platform-highlights.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    blend_mode = "additive",
                    shift = util.by_pixel(2, 6.5),
                    scale = 0.5
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/inserter-platform-shadow.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                draw_as_shadow = true,
                shift = util.by_pixel(2, 6.5),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/logistics/inserter/platform/hr-inserter-platform-shadow.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    draw_as_shadow = true,
                    shift = util.by_pixel(2, 6.5),
                    scale = 0.5
                }
            }
        }
    }
end

-- Reskin entities, create and assign extra details
for name, tier in pairs(inserter_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end
 
    -- Handle base_entity
    if string.find(name, "stack%-inserter") then
        inputs.base_entity = "stack-inserter"
    else
        inputs.base_entity = "inserter"
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index["tier-"..tier]
    if string.find(name, "filter") then        
        inputs.platform_tint = util.color("bfbfbf") -- Whiteish
    else
        inputs.platform_tint = inputs.tint
    end

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Fetch remnant
    -- remnant = data.raw["corpse"][name.."-remnants"]
    -- remnant.animation = stack_inserter_remnants(inputs.internal_name)
    -- remnant.animation = inserter_remnants(inputs.internal_name)    

    -- Handle the type of inserter we're dealing with
    local inserter_type
    if string.find(name, "stack") then
        inserter_type = "stack-inserter"
    elseif mods["bobsinserters"] or settings.startup["bobmods-logistics-inserteroverhaul"].value == true then
        inserter_type = "long-inserter"
    else
        inserter_type = "inserter"
    end

    local inserter_filter = false
    if string.find(name, "filter") then
        inserter_filter = true
    end

    -- Common to all inserters
    entity.hand_base_picture = inserter_arm_picture{tint = inputs.tint, filter = inserter_filter}
    entity.hand_base_shadow = inserter_arm_shadow()
    entity.platform_picture = inserter_platform_picture{tint = inputs.platform_tint}

    -- Inserter hands
    entity.hand_open_picture = inserter_hand_picture{type = inserter_type, tint = inputs.tint, hand = "open", filter = inserter_filter}
    entity.hand_closed_picture = inserter_hand_picture{type = inserter_type, tint = inputs.tint, hand = "closed", filter = inserter_filter}
    entity.hand_open_shadow = inserter_hand_shadow{type = inserter_type, hand = "open"}
    entity.hand_closed_shadow = inserter_hand_shadow{type = inserter_type, hand = "closed"}

    -- Label to skip to next iteration
    ::continue::
end