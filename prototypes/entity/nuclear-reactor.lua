-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-nuclear"].value == false then return end

-- Set parameters
local type = "reactor"
local flags = 
{
    basename = "nuclear-reactor",
    baseentity = "nuclear-reactor",
    directory = reskins.bobs_structures.directory,
    folder = "nuclear-reactor",
    particles = {"medium","big"}
}

-- Nuclear reactors have two different sets of tiers; determine which we are using
local tier_map
if settings.startup["reskin-series-tier-mapping"].value == "name-map" then
    tier_map =
    {
        ["nuclear-reactor"]   = 1,
        ["nuclear-reactor-2"] = 2,
        ["nuclear-reactor-3"] = 3
    }
else
    tier_map =
    {
        ["nuclear-reactor"]   = 3,
        ["nuclear-reactor-2"] = 4,
        ["nuclear-reactor-3"] = 5
    }
    flags.remap_tiers = true
end

-- Map pipe type to reactor entity name
local heatpipe_index =
{
    ["nuclear-reactor"]   = 1,
    ["nuclear-reactor-2"] = 2,
    ["nuclear-reactor-3"] = 3
}

local function skin_reactor_icon(name, type, tier, flags)
    --[[Flags required by this function
        directory   - Top-level mod directory, e.g. "__mod_directory__"
        fuel        - Color of glow/base layers, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium"
        pipe_tier   - Heatpipe to use, accepted values: 1 (base), 2 (silver), 3 (gold)
        reactor     - Color of shell, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium", "reactor-#" where # is 1-5 inclusive]]

    -- Create icons
    if settings.startup["reskin-series-icon-tier-labeling"].value == true then
        -- Setup icon with tier labeling
        flags.icon = 
        {
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/bases/icon-"..flags.fuel.."-base.png"
            },
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/shells/icon-"..flags.reactor.."-shell.png"
            },
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/piping/icon-piping-"..flags.pipe_tier..".png"
            },
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/glows/icon-"..flags.fuel.."-glow.png"
            },
            {
                icon = flags.directory.."/graphics/icons/tiers/"..flags.icon_size.."/tier-"..tier..".png"
            }
        }
    else
        -- Setup icon without tier labeling
        flags.icon = 
        {
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/bases/icon-"..flags.fuel.."-base.png"
            },
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/shells/icon-"..flags.reactor.."-shell.png"
            },
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/piping/icon-piping-"..flags.pipe_tier..".png"
            },
            {
                icon = flags.directory.."/graphics/icons/nuclear-reactor/glows/icon-"..flags.fuel.."-glow.png"
            }
        }
    end

    -- Assign icons
    reskins.lib.assign_icons(name, type, flags)
end

local function skin_reactor_entity(name, type, flags)
    --[[Flags required by this function
        directory   - Top-level mod directory, e.g. "__mod_directory__"
        fuel        - Color of glow/base layers, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium"
        pipe_tier   - Heatpipe to use, accepted values: 1 (base), 2 (silver), 3 (gold)
        reactor     - Color of shell, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium", "reactor-#" where # is 1-5 inclusive]]

    -- Reskin reactor entities
    local entity = data.raw[type][name]

    entity.lower_layer_picture =
    {
        filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/reactor-base-pipes-"..flags.pipe_tier..".png",
        width = 156,
        height = 156,
        shift = util.by_pixel(-2, -4),
        hr_version =
        {
            filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/hr-reactor-base-pipes-"..flags.pipe_tier..".png",
            width = 320,
            height = 316,
            scale = 0.5,
            shift = util.by_pixel(-1, -5),
        }
    }

    entity.picture =
    {
        layers =
        {
            -- Base
            {
                filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
                width = 154,
                height = 158,
                shift = util.by_pixel(-6, -6),
                hr_version =
                {
                    filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor.png",
                    width = 302,
                    height = 318,
                    scale = 0.5,
                    shift = util.by_pixel(-5, -7),
                }
            },
            -- Reactor shell
            {
                filename = flags.directory.."/graphics/entity/nuclear-reactor/shells/"..flags.reactor.."-shell.png",
                width = 154,
                height = 158,
                shift = util.by_pixel(-6, -6),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/nuclear-reactor/shells/hr-"..flags.reactor.."-shell.png",
                    width = 302,
                    height = 318,
                    scale = 0.5,
                    shift = util.by_pixel(-5, -7),
                }
            },
            -- Reactor piping
            {
                filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/reactor-piping-"..flags.pipe_tier..".png",
                width = 154,
                height = 158,
                shift = util.by_pixel(-6, -6),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/hr-reactor-piping-"..flags.pipe_tier..".png",
                    width = 302,
                    height = 318,
                    scale = 0.5,
                    shift = util.by_pixel(-5, -7),
                }
            },
            -- Shadow
            {
                filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
                width = 263,
                height = 162,
                shift = { 1.625 , 0 },
                draw_as_shadow = true,
                hr_version =
                {
                    filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-shadow.png",
                    width = 525,
                    height = 323,
                    scale = 0.5,
                    shift = { 1.625, 0 },
                    draw_as_shadow = true
                }
            }
        }
    }

    entity.connection_patches_connected =
    {
        sheet =
        {
            filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/reactor-connect-patches-"..flags.pipe_tier..".png",
            width = 32,
            height = 32,
            variation_count = 12,
            hr_version =
            {
                filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/hr-reactor-connect-patches-"..flags.pipe_tier..".png",
                width = 64,
                height = 64,
                variation_count = 12,
                scale = 0.5
            }
        }
    }

    entity.connection_patches_disconnected =
    {
        sheet =
        {
            filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/reactor-connect-patches-"..flags.pipe_tier..".png",
            width = 32,
            height = 32,
            variation_count = 12,
            y = 32,
            hr_version =
            {
                filename = flags.directory.."/graphics/entity/nuclear-reactor/pipes/hr-reactor-connect-patches-"..flags.pipe_tier..".png",
                width = 64,
                height = 64,
                variation_count = 12,
                y = 64,
                scale = 0.5
            }
        }
    }
end

local function skin_reactor_remnants(name, type, flags)
    --[[Flags required by this function
        directory   - Top-level mod directory, e.g. "__mod_directory__"
        fuel        - Color of glow/base layers, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium"
        pipe_tier   - Heatpipe to use, accepted values: 1 (base), 2 (silver), 3 (gold)
        reactor     - Color of shell, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium", "reactor-#" where # is 1-5 inclusive]]

    -- Reskin reactor remnants
    local remnant = data.raw["corpse"][name.."-remnants"]

    remnant.animation =
    {
        layers =
        {
            {
                filename = "__base__/graphics/entity/nuclear-reactor/remnants/nuclear-reactor-remnants.png",
                line_length = 1,
                width = 206,
                height = 198,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(7, 4),
                hr_version =
                {
                    filename = "__base__/graphics/entity/nuclear-reactor/remnants/hr-nuclear-reactor-remnants.png",
                    line_length = 1,
                    width = 410,
                    height = 396,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(7, 4),
                    scale = 0.5,
                }
            },
            {
                    filename = flags.directory.."/graphics/entity/nuclear-reactor/remnants/shells/"..flags.reactor.."-shell-remnants.png",
                    line_length = 1,
                    width = 206,
                    height = 198,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(7, 4),
                    hr_version =
                    {
                        filename = flags.directory.."/graphics/entity/nuclear-reactor/remnants/shells/hr-"..flags.reactor.."-shell-remnants.png",
                        line_length = 1,
                        width = 410,
                        height = 396,
                        frame_count = 1,
                        variation_count = 1,
                        axially_symmetrical = false,
                        direction_count = 1,
                        shift = util.by_pixel(7, 4),
                        scale = 0.5,
                    }
            },
            {
                filename = flags.directory.."/graphics/entity/nuclear-reactor/remnants/pipes/reactor-piping-"..flags.pipe_tier.."-remnants.png",
                line_length = 1,
                width = 206,
                height = 198,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(7, 4),
                hr_version =
                {
                    filename = flags.directory.."/graphics/entity/nuclear-reactor/remnants/pipes/hr-reactor-piping-"..flags.pipe_tier.."-remnants.png",
                    line_length = 1,
                    width = 410,
                    height = 396,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(7, 4),
                    scale = 0.5,
                }
            }          
        }
    }
end

-- Parse flags to construct defaults
reskins.lib.parse_flags(flags)

-- Map fuel type to reactor entity name
local fuel_index =
{
    ["nuclear-reactor"] = "uranium"
}

-- Nucelar reactors have two modes, revamped or standard; determine which we are using
if mods["bobrevamp"] and settings.startup["bobmods-revamp-nuclear"].value == true then
    -- Map fuel type to reactor entity name
    fuel_index["nuclear-reactor-2"] = "thorium"

    -- Setup nuclear tints for use with explosion particles
    reskins.lib.tint_index["uranium"] = {r = 58, g = 204, b = 11}
    reskins.lib.tint_index["thorium"] = {r = 204, g = 165, b = 0}

    if mods["bobplates"] and settings.startup["bobmods-plates-bluedeuterium"].value == true then 
        fuel_index["nuclear-reactor-3"] = "deuterium-blue"
        reskins.lib.tint_index["deuterium-blue"] = {r = 0, g = 142, b = 208}
    else
        fuel_index["nuclear-reactor-3"] = "deuterium-pink"
        reskins.lib.tint_index["deuterium-pink"] = {r = 208, g = 0, b = 73}
    end
else
    -- Map fuel type to reactor entity name
    fuel_index["nuclear-reactor-2"] = "uranium"
    fuel_index["nuclear-reactor-3"] = "uranium"
end

-- Reskin entities
for name, tier in pairs(tier_map) do
    -- Initialize table address
    entity = data.raw[type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- We need to assaign fuel, pipe-tier, and reactor flags
    flags.pipe_tier = heatpipe_index[name]
    flags.fuel = fuel_index[name]

    if mods["bobrevamp"] and settings.startup["bobmods-revamp-nuclear"].value == true then
        flags.reactor = fuel_index[name]

        -- Create particles
        reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[flags.particles[1]], reskins.lib.tint_index[flags.fuel])
        reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[flags.particles[2]], reskins.lib.tint_index[flags.fuel])
    else
        flags.reactor = "reactor-"..tier

        -- Create particles
        reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[flags.particles[1]], reskins.lib.tint_index["tier-"..tier])
        reskins.lib.create_particle(name, flags.baseentity, reskins.lib.particle_index[flags.particles[2]], reskins.lib.tint_index["tier-"..tier])
    end   

    -- Create explosions
    reskins.lib.create_explosion(name, type, flags.baseentity)

    -- Assign particles
    explosion = data.raw["explosion"][name.."-explosion"]["created_effect"]["action_delivery"]
    explosion.target_effects[1].particle_name = name.."-metal-particle-big-tinted"
    explosion.target_effects[2].particle_name = name.."-metal-particle-medium-tinted"

    -- Create remnants
    reskins.lib.create_remnant(name, type, flags.baseentity)

    -- Reskin remnants
    skin_reactor_remnants(name, type, flags)

    -- Reskin entities
    skin_reactor_entity(name, type, flags)

    -- Reskin icons
    skin_reactor_icon(name, type, tier, flags)

    -- Label to skip to next iteration
    ::continue::
end