-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.plates.technologies) then return end

-- Setup inputs
local inputs = {
    mod = "bobs",
    group = "plates",
    type = "technology",
    flat_icon = true,
}

-- Setup light layer extras
local function return_technology_light_layer(mod, name, directory)
    local directory = directory and directory or name
    return
    {
        {
            icon = reskins.bobs.directory.."/graphics/technology/"..mod.."/"..directory.."/"..name.."-technology-lights.png",
            icon_size = 256,
            icon_mipmaps = 4,
            tint = {1, 1, 1, 0}
        }
    }
end

local technologies = {
    -- Nuclear
    -- ["uranium-processing"] = {}, -- uraniuym proc, centri t3
    ["thorium-processing"] = {subgroup = "nuclear", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["thorium-fuel-reprocessing"] = {subgroup = "nuclear"},
    ["deuterium-fuel-reprocessing"] = {subgroup = "nuclear", image = "deuterium-fuel-reprocessing-pink"},
    ["bobingabout-enrichment-process"] = {subgroup = "nuclear", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["plutonium-fuel-cell"] = {subgroup = "nuclear",}, -- plut fuel cell icon, is broken/sized wrong
    ["thorium-plutonium-fuel-cell"] = {subgroup = "nuclear",}, -- ^^^
    ["deuterium-fuel-cell-2"] = {subgroup = "nuclear",}, -- check color from revamp settings?

    -- Furnaces
    ["alloy-processing-1"] = {subgroup = "smelting"},
    ["chemical-processing-1"] = {subgroup = "smelting"},

    ["advanced-material-processing"] = {subgroup = "smelting"}, -- yellow steel
    ["fluid-furnace"] = {subgroup = "smelting"}, -- yellow fluid steel
    ["steel-mixing-furnace"] = {subgroup = "smelting"}, -- blue steel
    ["fluid-mixing-furnace"] = {subgroup = "smelting"}, -- blue fluid steel
    ["steel-chemical-furnace"] = {subgroup = "smelting"}, -- red steel
    ["fluid-chemical-furnace"] = {subgroup = "smelting"}, -- red fluid steel

    ["advanced-material-processing-2"] = {technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = false, tint = util.color("ffb700"), icon_name = "advanced-material-processing", technology_icon_extras = return_technology_light_layer(inputs.group, "advanced-material-processing")}, -- yellow electric
    ["advanced-material-processing-3"] = {technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = false, tier = 4, icon_name = "advanced-material-processing", technology_icon_extras = return_technology_light_layer(inputs.group, "advanced-material-processing")}, -- yellow electric
    ["advanced-material-processing-4"] = {technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = false, tier = 5, icon_name = "advanced-material-processing", technology_icon_extras = return_technology_light_layer(inputs.group, "advanced-material-processing")}, -- yellow electric
    ["electric-chemical-furnace"] = {technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = false, tint = util.color("e50000"), icon_name = "electric-chemical-furnace", technology_icon_extras = return_technology_light_layer(inputs.group, "electric-chemical-furnace")}, -- red electric
    ["electric-mixing-furnace"] = {technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = false, tint = util.color("00bfff"), icon_name = "electric-mixing-furnace", technology_icon_extras = return_technology_light_layer(inputs.group, "electric-mixing-furnace")}, -- blue electric
    ["multi-purpose-furnace-1"] = {technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = false, tier = 4, icon_name = "multi-purpose-furnace", technology_icon_extras = return_technology_light_layer(inputs.group, "multi-purpose-furnace")}, -- purple electric
    ["multi-purpose-furnace-2"] = {technology_icon_size = 256, technology_icon_mipmaps = 4, flat_icon = false, tier = 5, icon_name = "multi-purpose-furnace", technology_icon_extras = return_technology_light_layer(inputs.group, "multi-purpose-furnace")}, -- green electric

    -- Barreling pumps
    ["water-bore-1"] = {flat_icon = false, tier = 1, prog_tier = 2, icon_name = "water-bore"},
    ["water-bore-2"] = {flat_icon = false, tier = 2, prog_tier = 3, icon_name = "water-bore"},
    ["water-bore-3"] = {flat_icon = false, tier = 3, prog_tier = 4, icon_name = "water-bore"},
    ["water-bore-4"] = {flat_icon = false, tier = 4, prog_tier = 5, icon_name = "water-bore"},

    -- Air compressors
    ["air-compressor-1"] = {flat_icon = false, tier = 1, prog_tier = 2, icon_name = "air-compressor"},
    ["air-compressor-2"] = {flat_icon = false, tier = 2, prog_tier = 3, icon_name = "air-compressor"},
    ["air-compressor-3"] = {flat_icon = false, tier = 3, prog_tier = 4, icon_name = "air-compressor"},
    ["air-compressor-4"] = {flat_icon = false, tier = 4, prog_tier = 5, icon_name = "air-compressor"},

    -- Assorted processes
    -- ["plastics"] = {}, -- Plastic, plastic pipes
    -- ["advanced-oil-processing"] = {}, -- oil recipes
    ["grinding"] = {subgroup = "processing-steps", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["polishing"] = {subgroup = "processing-steps", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["electrolysis-1"] = {subgroup = "processing-steps", image = "electrolysis", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["electrolysis-2"] = {subgroup = "processing-steps", image = "electrolysis", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["void-fluid"] = {subgroup = "processing-steps", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["gem-processing-1"] = {subgroup = "processing-steps", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- cut gems
    ["gem-processing-2"] = {subgroup = "processing-steps", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- polished gems
    ["advanced-electronics-3"] = {subgroup = "processing-steps", technology_icon_size = 256, technology_icon_mipmaps = 4},

    -- Plate processing
    ["aluminium-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- alumina, aluminium plate
    ["gold-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- gold plate
    ["zinc-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- zinc plate, brass, gunmetal, brass gear, brass pipes, brass chest
    ["nickel-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- nickel plate
    ["steel-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- vanilla fine as is
    ["silicon-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- silicon boule, wager, powder
    ["invar-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- invar plate
    ["lead-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- lead plate, lead oxide
    ["cobalt-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- cobalt oxide, cobalt plate, copper plate from cobalt, cobalt steel plate, gear, bearing, ball bearing
    ["tungsten-alloy-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- copper-tungsten, tungsten carbide, c-tun-pipes
    ["nitinol-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- nitinol plate, gear, bearing, ball,. pipes
    ["titanium-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- titanium plate, gear, ball, bearing, pipes, chest
    ["tungsten-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- tungsten plate, gear, pipe, acid, oxide, powdered
    ["alloy-processing"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["ceramics"] = {subgroup = "plates", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- silicon nitride, ceramic bearing, ball bearing, pipes

    -- Chemicals and fluids processing
    ["chemical-processing-2"] = {subgroup = "chemical-processing", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- hydro chloride, calcium, ferric chloride, limestone, carbon dioxide,
    ["lithium-processing"] = {subgroup = "chemical-processing", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- lithium, lithium chloride, perchlorate, sodium chlorate, perchlorate, (Bob's revamp does something to this?)
    ["gas-canisters"] = {subgroup = "chemical-processing", technology_icon_size = 256, technology_icon_mipmaps = 4}, -- gas cans
    -- // molecule // ["nitrogen-processing"] = {}, -- fluids: nitrogen, nitrogen-dioxide, nitric acid, ammonia, nitric oxide, hydrogen peroxide
    -- // molecule // ["heavy-water-processing"] = {}, -- heavy water
    -- // molecule // ["deuterium-processing"] = {}, -- heavy water electrolysis
    -- // ok as it is //["sulfur-processing"] = {}, -- sulfur, sulfuric acid, sulfur-dioxide, hydrogen-sulfide, hydrogen-peroxide, petroleum-gas
    -- // part of warfare // ["nitroglycerin-processing"] = {}, -- glycerol, nitroglycerin, sulfuric and nitric acid

    -- Alien plates
    ["alien-blue-research"] = {subgroup = "alien", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["alien-orange-research"] = {subgroup = "alien", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["alien-purple-research"] = {subgroup = "alien", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["alien-yellow-research"] = {subgroup = "alien", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["alien-green-research"] = {subgroup = "alien", technology_icon_size = 256, technology_icon_mipmaps = 4},
    ["alien-red-research"] = {subgroup = "alien", technology_icon_size = 256, technology_icon_mipmaps = 4},

    -- Fluid Handling
    ["fluid-handling"] = {flat_icon = false, tier = 1, prog_tier = 2, icon_name = "fluid-handling", technology_icon_size = 256},
    ["bob-fluid-handling-2"] = {flat_icon = false, tier = 2, prog_tier = 3, icon_name = "fluid-handling", technology_icon_size = 256},
    ["bob-fluid-handling-3"] = {flat_icon = false, tier = 3, prog_tier = 4, icon_name = "fluid-handling", technology_icon_size = 256},
    ["bob-fluid-handling-4"] = {flat_icon = false, tier = 4, prog_tier = 5, icon_name = "fluid-handling", technology_icon_size = 256},
}

-- Handle nuclear update
if reskins.lib.setting("bobmods-plates-nuclearupdate") == true then
    technologies["nuclear-fuel-reprocessing"] = {subgroup = "nuclear", defer_to_data_updates = true}

    -- Handle deuterium's default process color
    if reskins.lib.setting("bobmods-plates-bluedeuterium") == true then
        technologies["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-blue"
    end
else
    technologies["thorium-fuel-reprocessing"].image = "thorium-fuel-reprocessing-alternate"

    -- Handle deuterium's alternate process color
    if reskins.lib.setting("bobmods-plates-bluedeuterium") == true then
        technologies["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-alternate-blue"
    else
        technologies["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-alternate-pink"
    end
end

-- Angel's Compatibility
if mods["angelssmelting"] then
    -- Use metal-mixing sprites to be consistent with new "Filtering Furnace" progression
    technologies["multi-purpose-furnace-1"].icon_name = "electric-mixing-furnace"
    technologies["multi-purpose-furnace-1"].technology_icon_extras = return_technology_light_layer(inputs.group, "electric-mixing-furnace")
    technologies["multi-purpose-furnace-2"].icon_name = "electric-mixing-furnace"
    technologies["multi-purpose-furnace-2"].technology_icon_extras = return_technology_light_layer(inputs.group, "electric-mixing-furnace")
end

reskins.lib.create_icons_from_list(technologies, inputs)