-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.plates.technologies) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "bobs",
    group = "plates",
    type = "technology",
    flat_icon = true,
}

---
---Gets the technology light layer for a file with the given `name` in the given `folder`.
---
---### Returns
---@return data.IconData[] # The light layer for the technology icon.
---
---### Parameters
---@param name string # The name of the technology. Matches a file under the given `folder` with the format `{name}-technology-lights.png`
---@param folder? string # The folder under `"__reskins-bobs__/graphics/technology/plates/"` to seach for the image file, defaults to `name`.
local function get_technology_light_layer(name, folder)
    folder = folder or name

    ---@type data.IconData[]
    local light_layer = {
        {
            icon = "__reskins-bobs__/graphics/technology/plates/" .. folder .. "/" .. name .. "-technology-lights.png",
            icon_size = 256,
            icon_mipmaps = 4,
            tint = { 1, 1, 1, 0 },
        },
    }

    return light_layer
end

---@type CreateIconsFromListTable
local technologies = {
    -- Nuclear
    -- ["uranium-processing"] = {}, -- uranium proc, centri t3
    ["deuterium-fuel-reprocessing"] = { subgroup = "nuclear", image = "deuterium-fuel-reprocessing-pink" },
    ["thorium-fuel-reprocessing"] = { subgroup = "nuclear" },
    ["thorium-processing"] = {
        subgroup = "nuclear",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["bobingabout-enrichment-process"] = {
        subgroup = "nuclear",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    ["plutonium-fuel-cell"] = { subgroup = "nuclear" },
    ["thorium-plutonium-fuel-cell"] = { subgroup = "nuclear" },
    ["deuterium-fuel-cell-2"] = { subgroup = "nuclear" },

    -- Furnaces
    ["alloy-processing-1"] = { subgroup = "smelting" },
    ["chemical-processing-1"] = { subgroup = "smelting" },
    ["advanced-material-processing"] = { subgroup = "smelting" },
    ["fluid-furnace"] = { subgroup = "smelting" },
    ["steel-mixing-furnace"] = { subgroup = "smelting" },
    ["fluid-mixing-furnace"] = { subgroup = "smelting" },
    ["steel-chemical-furnace"] = { subgroup = "smelting" },
    ["fluid-chemical-furnace"] = { subgroup = "smelting" },

    ["advanced-material-processing-2"] = {
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
        flat_icon = false,
        tint = util.color("ffb700"),
        icon_name = "advanced-material-processing",
        technology_icon_extras = get_technology_light_layer("advanced-material-processing"),
    },
    ["advanced-material-processing-3"] = {
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
        flat_icon = false,
        tier = 4,
        icon_name = "advanced-material-processing",
        technology_icon_extras = get_technology_light_layer("advanced-material-processing"),
    },
    ["advanced-material-processing-4"] = {
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
        flat_icon = false,
        tier = 5,
        icon_name = "advanced-material-processing",
        technology_icon_extras = get_technology_light_layer("advanced-material-processing"),
    },

    ["electric-chemical-furnace"] = {
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
        flat_icon = false,
        tint = util.color("e50000"),
        icon_name = "electric-chemical-furnace",
        technology_icon_extras = get_technology_light_layer("electric-chemical-furnace"),
    },

    ["electric-mixing-furnace"] = {
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
        flat_icon = false,
        tint = util.color("00bfff"),
        icon_name = "electric-mixing-furnace",
        technology_icon_extras = get_technology_light_layer("electric-mixing-furnace"),
    },

    ["multi-purpose-furnace-1"] = {
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
        flat_icon = false,
        tier = 4,
        icon_name = "multi-purpose-furnace",
        technology_icon_extras = get_technology_light_layer("multi-purpose-furnace"),
    },
    ["multi-purpose-furnace-2"] = {
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
        flat_icon = false,
        tier = 5,
        icon_name = "multi-purpose-furnace",
        technology_icon_extras = get_technology_light_layer("multi-purpose-furnace"),
    },

    -- Barreling pumps
    ["water-bore-1"] = {
        flat_icon = false,
        tier = 1,
        prog_tier = 2,
        icon_name = "water-bore",
    },
    ["water-bore-2"] = {
        flat_icon = false,
        tier = 2,
        prog_tier = 3,
        icon_name = "water-bore",
    },
    ["water-bore-3"] = {
        flat_icon = false,
        tier = 3,
        prog_tier = 4,
        icon_name = "water-bore",
    },
    ["water-bore-4"] = {
        flat_icon = false,
        tier = 4,
        prog_tier = 5,
        icon_name = "water-bore",
    },

    -- Air compressors
    ["air-compressor-1"] = {
        flat_icon = false,
        tier = 1,
        prog_tier = 2,
        icon_name = "air-compressor",
    },
    ["air-compressor-2"] = {
        flat_icon = false,
        tier = 2,
        prog_tier = 3,
        icon_name = "air-compressor",
    },
    ["air-compressor-3"] = {
        flat_icon = false,
        tier = 3,
        prog_tier = 4,
        icon_name = "air-compressor",
    },
    ["air-compressor-4"] = {
        flat_icon = false,
        tier = 4,
        prog_tier = 5,
        icon_name = "air-compressor",
    },

    -- Assorted processes
    -- ["plastics"] = {}, -- Plastic, plastic pipes
    -- ["advanced-oil-processing"] = {}, -- oil recipes
    ["grinding"] = {
        subgroup = "processing-steps",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    ["polishing"] = {
        subgroup = "processing-steps",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    ["electrolysis-1"] = {
        subgroup = "processing-steps",
        image = "electrolysis",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["electrolysis-2"] = {
        subgroup = "processing-steps",
        image = "electrolysis",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    ["void-fluid"] = {
        subgroup = "processing-steps",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- cut gems
    ["gem-processing-1"] = {
        subgroup = "processing-steps",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- polished gems
    ["gem-processing-2"] = {
        subgroup = "processing-steps",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- Plate processing
    -- alumina, aluminium plate
    ["aluminium-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- gold plate
    ["gold-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- zinc plate, brass, gunmetal, brass gear, brass pipes, brass chest
    ["zinc-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- nickel plate
    ["nickel-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- vanilla fine as is
    ["steel-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- silicon boule, wager, powder
    ["silicon-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- invar plate
    ["invar-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- lead plate, lead oxide
    ["lead-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- cobalt oxide, cobalt plate, copper plate from cobalt, cobalt steel plate, gear, bearing, ball bearing
    ["cobalt-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- copper-tungsten, tungsten carbide, c-tun-pipes
    ["tungsten-alloy-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- nitinol plate, gear, bearing, ball,. pipes
    ["nitinol-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- titanium plate, gear, ball, bearing, pipes, chest
    ["titanium-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- tungsten plate, gear, pipe, acid, oxide, powdered
    ["tungsten-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    ["alloy-processing"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- silicon nitride, ceramic bearing, ball bearing, pipes
    ["ceramics"] = {
        subgroup = "plates",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- Chemicals and fluids processing

    -- hydro chloride, calcium, ferric chloride, limestone, carbon dioxide,
    ["chemical-processing-2"] = {
        subgroup = "chemical-processing",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- lithium, lithium chloride, perchlorate, sodium chlorate, perchlorate, (Bob's revamp does something to this?)
    ["lithium-processing"] = {
        subgroup = "chemical-processing",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- gas cans
    ["gas-canisters"] = {
        subgroup = "chemical-processing",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- fluids: nitrogen, nitrogen-dioxide, nitric acid, ammonia, nitric oxide, hydrogen peroxide
    -- ["nitrogen-processing"] = {}, -- Molecule.

    -- heavy water
    -- ["heavy-water-processing"] = {}, -- Molecule.

    -- heavy water electrolysis
    -- ["deuterium-processing"] = {}, -- Molecule.

    -- sulfur, sulfuric acid, sulfur-dioxide, hydrogen-sulfide, hydrogen-peroxide, petroleum-gas
    -- ["sulfur-processing"] = {}, -- Leave as is.

    -- glycerol, nitroglycerin, sulfuric and nitric acid
    -- ["nitroglycerin-processing"] = {}, -- Part of warfare.

    -- Alien plates
    ["alien-blue-research"] = {
        subgroup = "alien",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["alien-orange-research"] = {
        subgroup = "alien",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["alien-purple-research"] = {
        subgroup = "alien",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["alien-yellow-research"] = {
        subgroup = "alien",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["alien-green-research"] = {
        subgroup = "alien",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["alien-red-research"] = {
        subgroup = "alien",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },

    -- Fluid Handling
    ["fluid-handling"] = {
        flat_icon = false,
        tier = 1,
        prog_tier = 2,
        icon_name = "fluid-handling",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["bob-fluid-handling-2"] = {
        flat_icon = false,
        tier = 2,
        prog_tier = 3,
        icon_name = "fluid-handling",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["bob-fluid-handling-3"] = {
        flat_icon = false,
        tier = 3,
        prog_tier = 4,
        icon_name = "fluid-handling",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
    ["bob-fluid-handling-4"] = {
        flat_icon = false,
        tier = 4,
        prog_tier = 5,
        icon_name = "fluid-handling",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    },
}

-- Prefer the technology icon added for bobselectronics
if not mods["bobelectronics"] then
    -- TODO: https://github.com/kirazy/reskins-bobs/issues/30
    -- This is an angel circuit, when angel circuits are remodeled, produce something for this as well
    technologies["advanced-electronics-3"] = {
        subgroup = "processing-steps",
        technology_icon_size = 256,
        technology_icon_mipmaps = 4,
    }
end

-- Handle nuclear update
if reskins.lib.settings.get_value("bobmods-plates-nuclearupdate") == true then
    technologies["nuclear-fuel-reprocessing"] = {
        subgroup = "nuclear", defer_to_data_updates = true }

    -- Handle deuterium's default process color
    if reskins.lib.settings.get_value("bobmods-plates-bluedeuterium") == true then
        technologies["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-blue"
    end
else
    technologies["thorium-fuel-reprocessing"].image = "thorium-fuel-reprocessing-alternate"

    -- Handle deuterium's alternate process color
    if reskins.lib.settings.get_value("bobmods-plates-bluedeuterium") == true then
        technologies["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-alternate-blue"
    else
        technologies["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-alternate-pink"
    end
end

-- Angel's Compatibility
if mods["angelssmelting"] then
    -- Use metal-mixing sprites to be consistent with new "Filtering Furnace" progression
    technologies["multi-purpose-furnace-1"].icon_name = "electric-mixing-furnace"
    technologies["multi-purpose-furnace-1"].technology_icon_extras = get_technology_light_layer("electric-mixing-furnace")

    technologies["multi-purpose-furnace-2"].icon_name = "electric-mixing-furnace"
    technologies["multi-purpose-furnace-2"].technology_icon_extras = get_technology_light_layer("electric-mixing-furnace")
end

reskins.internal.create_icons_from_list(technologies, inputs)
