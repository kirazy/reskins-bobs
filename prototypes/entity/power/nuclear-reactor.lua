-- Copyright (c) 2020 Kirazy
-- Part of Reskin Series: Bob's Structures
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobpower"] then return end
if settings.startup["bobmods-power-nuclear"].value == false then return end
if settings.startup["reskin-series-do-bobpower"].value == false then return end 

-- Set input parameters
local inputs = 
{
    type = "reactor",
    base_entity = "nuclear-reactor",
    directory = reskins.bobs_structures.directory,
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
end

-- Map pipe type to reactor entity name
local heatpipe_index =
{
    ["nuclear-reactor"]   = 1,
    ["nuclear-reactor-2"] = 2,
    ["nuclear-reactor-3"] = 3
}

-- Nuclear fuel tints
local nuclear_tint_index = 
{
    ["uranium"]        = {r = 58,  g = 204, b = 11 },
    ["thorium"]        = {r = 204, g = 165, b = 0  },
    ["deuterium-blue"] = {r = 0,   g = 142, b = 208},
    ["deuterium-pink"] = {r = 208, g = 0,   b = 73 }
}

local function skin_reactor_icon(name, tier, inputs)
    -- Inputs required by this function:
    -- directory   - Top-level mod directory, e.g. "__mod_directory__"
    -- fuel        - Color of glow/base layers, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium"
    -- pipe_tier   - Heatpipe to use, accepted values: 1 (base), 2 (silver), 3 (gold)
    -- reactor     - Color of shell, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium", "reactor-#" where # is 1-5 inclusive
    -- icon_size   - Size of the icon, e.g. 32, 64, etc

    -- Create icons
    inputs.icon = 
    {
        {
            icon = inputs.directory.."/graphics/icons/power/nuclear-reactor/bases/icon-"..inputs.fuel.."-base.png"
        },
        {
            icon = inputs.directory.."/graphics/icons/power/nuclear-reactor/shells/icon-"..inputs.reactor.."-shell.png"
        },
        {
            icon = inputs.directory.."/graphics/icons/power/nuclear-reactor/piping/icon-piping-"..inputs.pipe_tier..".png"
        },
        {
            icon = inputs.directory.."/graphics/icons/power/nuclear-reactor/glows/icon-"..inputs.fuel.."-glow.png"
        }        
    }

    -- Tack on a tier label if we're doing those
    if settings.startup["reskin-series-icon-tier-labeling"].value == true then
        inputs.icon[#inputs.icon+1] = {icon = inputs.directory.."/graphics/icons/tiers/"..inputs.icon_size.."/tier-"..tier..".png"}
    end

    -- Assign icons
    reskins.lib.assign_icons(name, inputs)
end

local function skin_reactor_entity(name, inputs)
    -- Inputs required by this function:
    -- type        - Entity type
    -- directory   - Top-level mod directory, e.g. "__mod_directory__"
    -- fuel        - Color of glow/base layers, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium"
    -- pipe_tier   - Heatpipe to use, accepted values: 1 (base), 2 (silver), 3 (gold)
    -- reactor     - Color of shell, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium", "reactor-#" where # is 1-5 inclusive

    -- Reskin reactor entities
    local entity = data.raw[inputs.type][name]

    entity.lower_layer_picture =
    {
        filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/reactor-base-pipes-"..inputs.pipe_tier..".png",
        width = 156,
        height = 156,
        shift = util.by_pixel(-2, -4),
        hr_version =
        {
            filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/hr-reactor-base-pipes-"..inputs.pipe_tier..".png",
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
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/base/reactor.png",
                width = 154,
                height = 158,
                shift = util.by_pixel(-6, -6),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/base/hr-reactor.png",
                    width = 302,
                    height = 318,
                    scale = 0.5,
                    shift = util.by_pixel(-5, -7),
                }
            },
            -- Reactor shell
            {
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/shells/"..inputs.reactor.."-shell.png",
                width = 154,
                height = 158,
                shift = util.by_pixel(-6, -6),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/shells/hr-"..inputs.reactor.."-shell.png",
                    width = 302,
                    height = 318,
                    scale = 0.5,
                    shift = util.by_pixel(-5, -7),
                }
            },
            -- Reactor piping
            {
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/reactor-piping-"..inputs.pipe_tier..".png",
                width = 154,
                height = 158,
                shift = util.by_pixel(-6, -6),
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/hr-reactor-piping-"..inputs.pipe_tier..".png",
                    width = 302,
                    height = 318,
                    scale = 0.5,
                    shift = util.by_pixel(-5, -7),
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/base/reactor-shadow.png",
                width = 263,
                height = 162,
                shift = { 1.625 , 0 },
                draw_as_shadow = true,
                hr_version =
                {
                    filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/base/hr-reactor-shadow.png",
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
            filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/reactor-connect-patches-"..inputs.pipe_tier..".png",
            width = 32,
            height = 32,
            variation_count = 12,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/hr-reactor-connect-patches-"..inputs.pipe_tier..".png",
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
            filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/reactor-connect-patches-"..inputs.pipe_tier..".png",
            width = 32,
            height = 32,
            variation_count = 12,
            y = 32,
            hr_version =
            {
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/pipes/hr-reactor-connect-patches-"..inputs.pipe_tier..".png",
                width = 64,
                height = 64,
                variation_count = 12,
                y = 64,
                scale = 0.5
            }
        }
    }
end

local function skin_reactor_remnants(name, inputs)
    -- inputs required by this function
    -- directory   - Top-level mod directory, e.g. "__mod_directory__"
    -- fuel        - Color of glow/base layers, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium"
    -- pipe_tier   - Heatpipe to use, accepted values: 1 (base), 2 (silver), 3 (gold)
    -- reactor     - Color of shell, accepted values: "deuterium-pink", "deuterium-blue", "thorium", "uranium", "reactor-#" where # is 1-5 inclusive

    -- Reskin reactor remnants
    local remnant = data.raw["corpse"][name.."-remnants"]

    remnant.animation =
    {
        layers =
        {
            {
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/base/remnants/nuclear-reactor-remnants.png",
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
                    filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/base/remnants/hr-nuclear-reactor-remnants.png",
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
                    filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/remnants/shells/"..inputs.reactor.."-shell-remnants.png",
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
                        filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/remnants/shells/hr-"..inputs.reactor.."-shell-remnants.png",
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
                filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/remnants/pipes/reactor-piping-"..inputs.pipe_tier.."-remnants.png",
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
                    filename = inputs.directory.."/graphics/entity/power/nuclear-reactor/remnants/pipes/hr-reactor-piping-"..inputs.pipe_tier.."-remnants.png",
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

-- Construct default inputs
reskins.lib.parse_inputs(inputs)

-- Map fuel type to reactor entity name
local fuel_index =
{
    ["nuclear-reactor"] = "uranium"
}

-- Nucelar reactors have two modes, revamped or standard; determine which we are using
if mods["bobrevamp"] and settings.startup["bobmods-revamp-nuclear"].value == true and settings.startup["reskin-series-do-bobrevamp"].value == true then
    -- Map fuel type to reactor entity name
    fuel_index["nuclear-reactor-2"] = "thorium"

    if mods["bobplates"] and settings.startup["bobmods-plates-bluedeuterium"].value == true then 
        fuel_index["nuclear-reactor-3"] = "deuterium-blue"        
    else
        fuel_index["nuclear-reactor-3"] = "deuterium-pink"        
    end
else
    -- Map fuel type to reactor entity name
    fuel_index["nuclear-reactor-2"] = "uranium"
    fuel_index["nuclear-reactor-3"] = "uranium"
end

-- Reskin entities
for name, tier in pairs(tier_map) do
    -- Initialize table address
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then
        goto continue
    end

    -- We need to assaign fuel, pipe-tier, and reactor inputs
    inputs.pipe_tier = heatpipe_index[name]
    inputs.fuel = fuel_index[name]

    -- Create explosions
    reskins.lib.create_explosion(name, inputs)

    if mods["bobrevamp"] and settings.startup["bobmods-revamp-nuclear"].value == true and settings.startup["reskin-series-do-bobrevamp"].value == true then
        inputs.reactor = fuel_index[name]

        -- Create particles
        reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index["big"], 1, nuclear_tint_index[inputs.fuel])
        reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index["medium"], 2, nuclear_tint_index[inputs.fuel])
    else
        inputs.reactor = "reactor-"..tier

        -- Create particles
        reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index["big"], 1, reskins.lib.tint_index["tier-"..tier])
        reskins.lib.create_particle(name, inputs.base_entity, reskins.lib.particle_index["medium"], 2, reskins.lib.tint_index["tier-"..tier])
    end

    -- Create remnants
    reskins.lib.create_remnant(name, inputs)

    -- Reskin remnants
    skin_reactor_remnants(name, inputs)

    -- Reskin entities
    skin_reactor_entity(name, inputs)

    -- Reskin icons
    skin_reactor_icon(name, tier, inputs)

    -- Label to skip to next iteration
    ::continue::
end