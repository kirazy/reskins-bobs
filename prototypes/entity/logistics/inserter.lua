-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["boblogistics"] then return end
if settings.startup["reskins-bobs-do-boblogistics"].value == false then return end

-- Set input parameters
local inputs = 
{
    type = "inserter",
    directory = reskins.bobs.directory,
    mod = "logistics",
    particles = {["medium"] = 1},
    make_icons = false
}

local inserter_map, inserter_tint_index
if settings.startup["bobmods-logistics-inserteroverhaul"].value == true then
    return -- We're not dealing with this right now
    -- inserter_map = 
    -- {
    --     -- Standard inserters
    --     ["inserter"]             = 1,
    --     ["long-handed-inserter"] = 2,
    --     ["fast-inserter"]        = 3,
    --     ["turbo-inserter"]       = 4,
    --     ["express-inserter"]     = 5,

    --     -- Filter inserters
    --     ["yellow-filter-inserter"]  = {1, "filter-"},
    --     ["red-filter-inserter"]     = {2, "filter-"},
    --     ["filter-inserter"]         = {3, "filter-"},
    --     ["turbo-filter-inserter"]   = {4, "filter-"},
    --     ["express-filter-inserter"] = {5, "filter-"},

    --     -- Stack inserters
    --     ["red-stack-inserter"]     = {2, "stack-"},
    --     ["stack-inserter"]         = {3, "stack-"},
    --     ["turbo-stack-inserter"]   = {4, "stack-"},
    --     ["express-stack-inserter"] = {5, "stack-"},

    --     -- Stack filter inserters
    --     ["red-stack-filter-inserter"]     = {2, "stack-filter-"},
    --     ["stack-filter-inserter"]         = {3, "stack-filter-"},
    --     ["turbo-stack-filter-inserter"]   = {4, "stack-filter-"},
    --     ["express-stack-filter-inserter"] = {5, "stack-filter-"}
    -- }
    -- inserter_tint_index = reskins.lib.tint_index
else
    inserter_map =
    {
        -- Standard inserters
        -- ["inserter"]             = {1, "", true},
        -- ["long-handed-inserter"] = {2, "", true},
        -- ["fast-inserter"]        = {3, "", true},
        ["express-inserter"]     = {4},

        -- Filter inserters
        -- ["filter-inserter"]         = {3, "filter-", true},
        ["express-filter-inserter"] = {4, "filter-"},

        -- Stack inserters
        -- ["stack-inserter"]         = {3, "stack-", true},
        ["express-stack-inserter"] = {4, "stack-"},

        -- Stack filter inserters
        -- ["stack-filter-inserter"]         = {3, "stack-filter-", true},
        ["express-stack-filter-inserter"] = {4, "stack-filter-"}
    }
    inserter_tint_index = 
    {
        ["express-inserter"]              = {r = 48, g = 215, b = 156},
        ["express-filter-inserter"]       = {r = 223, g = 87, b = 194},
        ["express-stack-inserter"]        = {r = 45, g = 205, b = 63},
        ["express-stack-filter-inserter"] = {r = 126, g = 126, b = 126}
    }
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

-- Entity reskin functions
local function hand_base_shadow()
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/base/hand-base-shadow.png",
        priority = "extra-high",
        width = 8,
        height = 33,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/base/hr-hand-base-shadow.png",
            priority = "extra-high",
            width = 32,
            height = 132,
            scale = 0.25
        }
    }
end

local function inserter_hand_closed_shadow()
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/base/inserter/inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 41,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/base/inserter/hr-inserter-hand-closed-shadow.png",
            priority = "extra-high",
            width = 72,
            height = 164,
            scale = 0.25
        }
    }
end

local function stack_inserter_hand_closed_shadow()
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/base/stack-inserter/stack-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 24,
        height = 41,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/base/stack-inserter/hr-stack-inserter-hand-closed-shadow.png",
            priority = "extra-high",
            width = 100,
            height = 164,
            scale = 0.25
        }
    }
end

local function inserter_hand_open_shadow()
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/base/inserter/inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 41,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/base/inserter/hr-inserter-hand-open-shadow.png",
            priority = "extra-high",
            width = 72,
            height = 164,
            scale = 0.25
        }
    }
end

local function stack_inserter_hand_open_shadow()
    return
    {
      filename = inputs.directory.."/graphics/entity/logistics/inserter/base/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 41,
      hr_version =
      {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/base/stack-inserter/hr-stack-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 130,
        height = 164,
        scale = 0.25
      }
    }
end

local function inserter_hand_base_picture(name)
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-hand-base.png",
        priority = "extra-high",
        width = 8,
        height = 33,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-hand-base.png",
            priority = "extra-high",
            width = 32,
            height = 136,
            scale = 0.25
        }
    }
end

local function stack_inserter_hand_base_picture(name)
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-hand-base.png",
        priority = "extra-high",
        width = 8,
        height = 34,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-hand-base.png",
            priority = "extra-high",
            width = 32,
            height = 136,
            scale = 0.25
        }
    }
end

local function inserter_hand_closed_picture(name)
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-hand-closed.png",
        priority = "extra-high",
        width = 18,
        height = 41,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-hand-closed.png",
            priority = "extra-high",
            width = 72,
            height = 164,
            scale = 0.25
        }
    }
end

local function stack_inserter_hand_closed_picture(name)
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-hand-closed.png",
        priority = "extra-high",
        width = 24,
        height = 41,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-hand-closed.png",
            priority = "extra-high",
            width = 100,
            height = 164,
            scale = 0.25
        }
    }
end

local function inserter_hand_open_picture(name)
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-hand-open.png",
        priority = "extra-high",
        width = 18,
        height = 41,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-hand-open.png",
            priority = "extra-high",
            width = 72,
            height = 164,
            scale = 0.25
        }
    }
end

local function stack_inserter_hand_open_picture(name)
    return
    {
        filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-hand-open.png",
        priority = "extra-high",
        width = 32,
        height = 41,
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-hand-open.png",
            priority = "extra-high",
            width = 130,
            height = 164,
            scale = 0.25
        }
    }
end

local function inserter_platform_picture(name)
    return
    {
        sheet =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-platform.png",
            priority = "extra-high",
            width = 46,
            height = 46,
            shift = {0.09375, 0},
            hr_version =
            {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-platform.png",
            priority = "extra-high",
            width = 105,
            height = 79,
            shift = util.by_pixel(1.5, 7.5-1),
            scale = 0.5
            }
        }
    }
end

local function stack_inserter_platform_picture(name)
    return
    {
        sheet =
        {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/"..name.."-platform.png",
            priority = "extra-high",
            width = 46,
            height = 46,
            shift = {0.09375, 0},
            hr_version =
            {
            filename = inputs.directory.."/graphics/entity/logistics/inserter/"..name.."/hr-"..name.."-platform.png",
            priority = "extra-high",
            width = 105,
            height = 79,
            shift = util.by_pixel(1.5, 7.5-1),
            scale = 0.5
            }
        }
    }
end

-- Reskin entities, create and assign extra details
for name, map in pairs(inserter_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Parse map
    tier = map[1]
    subtype = map[2] or ""        -- Specifies inserter type for internal use
    -- icon_only = map[3] or false   -- Only conform icons

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Handle root_name and base_entity
    inputs.root_name = subtype.."inserter"
    inputs.base_entity = subtype.."inserter"

    -- Map entity to name used internally
    if settings.startup["bobmods-logistics-inserteroverhaul"].value == true then        
        inputs.internal_name = inputs.root_name.."-"..tier
    else
        inputs.internal_name = name
    end
    
    -- Parse inputs
    reskins.lib.parse_inputs(inputs)    

    -- Create particles and explosions   
    if inputs.make_explosions == true then   
        -- Create explosions. Big ones. The biggest explosions. Make Michael Bay proud!
        reskins.lib.create_explosion(name, inputs)
        reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index["medium"], 1, inserter_tint_index[inputs.internal_name])
    end

    -- Create remnants
    if inputs.make_remnants == true then
        reskins.lib.create_remnant(name, inputs)
    end

    -- Fetch remnant
    remnant = data.raw["corpse"][name.."-remnants"]

    -- Common to both stack inserters and standard inserters
    entity.hand_base_shadow = hand_base_shadow()

    -- Handle stack inserters separately from standard inserters
    if subtype == "stack-" or subtype == "stack-filter-" then
        remnant.animation = stack_inserter_remnants(inputs.internal_name)
        entity.hand_base_picture = stack_inserter_hand_base_picture(inputs.internal_name)
        entity.hand_closed_picture = stack_inserter_hand_closed_picture(inputs.internal_name)
        entity.hand_open_picture = stack_inserter_hand_open_picture(inputs.internal_name)
        entity.hand_closed_shadow = stack_inserter_hand_closed_shadow()
        entity.hand_open_shadow = stack_inserter_hand_open_shadow()
        entity.platform_picture = stack_inserter_platform_picture(inputs.internal_name)
    else
        remnant.animation = inserter_remnants(inputs.internal_name)
        entity.hand_base_picture = inserter_hand_base_picture(inputs.internal_name)
        entity.hand_closed_picture = inserter_hand_closed_picture(inputs.internal_name)
        entity.hand_open_picture = inserter_hand_open_picture(inputs.internal_name)
        entity.hand_closed_shadow = inserter_hand_closed_shadow()
        entity.hand_open_shadow = inserter_hand_open_shadow()
        entity.platform_picture = inserter_platform_picture(inputs.internal_name)
    end

    -- Label to skip to next iteration
    ::continue::
end