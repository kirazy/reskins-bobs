-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Set input parameters
local inputs = 
{
    type = "storage-tank",
    icon_name = "valve",
    base_entity = "pipe",
    directory = reskins.bobs.directory,
    group = "logistics",
    particles = {["small"] = 2},
    make_masked_icon = true,
    tier_labels = false,
    make_remnants = false,
}

local tint_map = 
{
    ["bob-valve"] = {util.color("2ac0ff"), "basic"},
    ["bob-overflow-valve"] = {util.color("ff3b29"), "overflow"},
    ["bob-topup-valve"] = {util.color("4dff2a"), "top-up"},
}

local function cardinal_pictures(x, tint)
    local x_lr = 64*x
    local x_hr = 128*x

    return
    {
        layers =
        {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/logistics/valve/valve-base.png",
                x = x_lr,
                width = 64,
                height = 64,
                frame_count = 1,
                -- shift = util.by_pixel(17, 0),
                hr_version = 
                {
                    filename = inputs.directory.."/graphics/entity/logistics/valve/hr-valve-base.png",
                    x = x_hr,
                    width = 128,
                    height = 128,
                    frame_count = 1,
                    -- shift = util.by_pixel(17, 0),
                    scale = 0.5
                }
            },
            -- Mask
            {
                filename = inputs.directory.."/graphics/entity/logistics/valve/valve-mask.png",
                x = x_lr,
                width = 64,
                height = 64,
                frame_count = 1,
                -- shift = util.by_pixel(17, 0),
                tint = tint,
                hr_version = 
                {
                    filename = inputs.directory.."/graphics/entity/logistics/valve/hr-valve-mask.png",
                    x = x_hr,
                    width = 128,
                    height = 128,
                    frame_count = 1,
                    -- shift = util.by_pixel(17, 0),
                    tint = tint,
                    scale = 0.5
                }
            }
        }
    }
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tint_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    inputs.tint = map[1]
    variant = map[2]

    reskins.lib.setup_standard_entity(name, 3, inputs)

    -- Reskin entities
    entity.pictures.picture.north = cardinal_pictures(0, inputs.tint)
    entity.pictures.picture.east  = cardinal_pictures(1, inputs.tint)
    entity.pictures.picture.south = cardinal_pictures(2, inputs.tint)
    entity.pictures.picture.west  = cardinal_pictures(3, inputs.tint)

    -- Label to skip to next iteration
    ::continue::
end