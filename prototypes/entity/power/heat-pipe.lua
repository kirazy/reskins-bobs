-- Copyright (c) 2020 Kirazy
-- Part of Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["reskins-bobs-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "heat-pipe",
    root_name = "heat-pipe",
    base_entity = "heat-pipe",
    directory = reskins.bobs.directory,
}

-- Heat pipes have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskins-lib-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["heat-pipe"]   = {1, 1},
        ["heat-pipe-2"] = {2, 2, {"d4d4d4", "dff5ff"}},
        ["heat-pipe-3"] = {3, 3, {"d6b968", "ff7f3f"}},
    }
else
    tier_map =
    {
        ["heat-pipe"]   = {3, 1},
        ["heat-pipe-2"] = {4, 2, {"d4d4d4", "dff5ff"}},
        ["heat-pipe-3"] = {5, 3, {"d6b968", "ff7f3f"}},
    }
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- Parse map
    tier = map[1]
    pipe_tier = map[2]
    
    -- Map entity to name used internally; for heat-pipe this needs to be specified for use with icon generation
    inputs.internal_name = inputs.root_name.."-"..pipe_tier

    -- Setup inputs defaults
    reskins.lib.parse_inputs(inputs)

    -- Setup icons
    -- reskins.lib.setup_standard_icon(name, tier, inputs)

    --- Don't reskin the base pipes
    if pipe_tier == 1 then goto continue end

    -- Create particles and explosions
    particle_tints = {util.color(map[3][1]), util.color(map[3][2])}
    reskins.lib.create_explosion(name, inputs)
    reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index["small"], 1, particle_tints[1])
    reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index["medium"], 2, particle_tints[2])
    
    -- Create and skin remnants
    reskins.lib.create_remnant(name, inputs)
    remnant = data.raw["corpse"][name.."-remnants"]
    remnant.animation = make_rotated_animation_variations_from_sheet (6,
    {
        filename = inputs.directory.."/graphics/entity/power/heat-pipe/heat-pipe-"..pipe_tier.."/remnants/heat-pipe-"..pipe_tier.."-remnants.png",
        line_length = 1,
        width = 62,
        height = 52,
        frame_count = 1,
        direction_count = 2,
        shift = util.by_pixel(1, -1),
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/power/heat-pipe/heat-pipe-"..pipe_tier.."/remnants/hr-heat-pipe-"..pipe_tier.."-remnants.png",
            line_length = 1,
            width = 122,
            height = 100,
            frame_count = 1,
            direction_count = 2,
            shift = util.by_pixel(0.5, -1.5),
            scale = 0.5,
        },
    })

    -- Reskin entities
    entity.connection_sprites = make_heat_pipe_pictures(inputs.directory.."/graphics/entity/power/heat-pipe/heat-pipe-"..pipe_tier.."/", inputs.internal_name,
    {
        single = { name = "straight-vertical-single", ommit_number = true },
        straight_vertical = { variations = 6 },
        straight_horizontal = { variations = 6 },
        corner_right_up = { name = "corner-up-right", variations = 6 },
        corner_left_up = { name = "corner-up-left", variations = 6 },
        corner_right_down = { name = "corner-down-right", variations = 6 },
        corner_left_down = { name = "corner-down-left", variations = 6 },
        t_up = {},
        t_down = {},
        t_right = {},
        t_left = {},
        cross = { name = "t" },
        ending_up = {},
        ending_down = {},
        ending_right = {},
        ending_left = {}
    })

    -- Label to skip to next iteration
    ::continue::
end