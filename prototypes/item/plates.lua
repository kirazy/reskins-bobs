-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.plates.items) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "bobs",
    group = "plates",
    make_icon_pictures = false,
    flat_icon = true,
}

---@type CreateIconsFromListTable
local intermediates = {
    ----------------------------------------------------------------------------------------------------
    -- Intermediates
    ----------------------------------------------------------------------------------------------------
    -- Plates
    ["bob-aluminium-plate"] = { subgroup = "plates", image = "aluminium-plate" },
    ["brass-alloy"] = { subgroup = "plates" },
    ["bronze-alloy"] = { subgroup = "plates" },
    ["cobalt-plate"] = { subgroup = "plates" },
    ["cobalt-steel-alloy"] = { subgroup = "plates" },
    ["copper-tungsten-alloy"] = { subgroup = "plates" },
    ["bob-gold-plate"] = { mod = "lib", group = "shared", subgroup = "items", image = "gold-plate" }, -- Shared with Angels
    ["gunmetal-alloy"] = { subgroup = "plates" },
    ["invar-alloy"] = { subgroup = "plates" },
    ["bob-lead-plate"] = { subgroup = "plates", image = "lead-plate" },
    ["lithium"] = { subgroup = "plates" },
    ["bob-nickel-plate"] = { subgroup = "plates", image = "nickel-plate" },
    ["nitinol-alloy"] = { subgroup = "plates" },
    ["silver-plate"] = { subgroup = "plates" },
    ["solder-alloy"] = { subgroup = "plates" }, -- Shared with Bob's Electronics
    ["tin-plate"] = { subgroup = "plates" },
    ["bob-titanium-plate"] = { subgroup = "plates", image = "titanium-plate" },
    ["tungsten-carbide"] = { subgroup = "plates" },
    ["bob-tungsten-plate"] = { subgroup = "plates", image = "tungsten-plate" },
    ["bob-zinc-plate"] = { subgroup = "plates", image = "zinc-plate" },
    ["alien-orange-alloy"] = { subgroup = "plates" },
    ["alien-blue-alloy"] = { subgroup = "plates" },

    -- Bearings
    ["ceramic-bearing"] = { subgroup = "bearings" },
    ["cobalt-steel-bearing"] = { subgroup = "bearings" },
    ["nitinol-bearing"] = { subgroup = "bearings" },
    ["steel-bearing"] = { subgroup = "bearings" },
    ["titanium-bearing"] = { subgroup = "bearings" },

    -- Bearing Balls
    ["ceramic-bearing-ball"] = { subgroup = "bearing-balls" },
    ["cobalt-steel-bearing-ball"] = { subgroup = "bearing-balls" },
    ["nitinol-bearing-ball"] = { subgroup = "bearing-balls" },
    ["steel-bearing-ball"] = { subgroup = "bearing-balls" },
    ["titanium-bearing-ball"] = { subgroup = "bearing-balls" },

    -- Gear Wheels
    ["brass-gear-wheel"] = { subgroup = "gears" },
    ["cobalt-steel-gear-wheel"] = { subgroup = "gears" },
    ["nitinol-gear-wheel"] = { subgroup = "gears" },
    ["steel-gear-wheel"] = { subgroup = "gears" },
    ["titanium-gear-wheel"] = { subgroup = "gears" },
    ["tungsten-gear-wheel"] = { subgroup = "gears" },

    -- Nuclear
    ["plutonium-fuel-cell"] = { subgroup = "nuclear", make_icon_pictures = true, icon_picture_extras = { reskins.lib.sprites.get_sprite_light_layer("fuel-cell") } },
    ["thorium-fuel-cell"] = { subgroup = "nuclear", make_icon_pictures = true, icon_picture_extras = { reskins.lib.sprites.get_sprite_light_layer("fuel-cell") } },
    ["thorium-plutonium-fuel-cell"] = { subgroup = "nuclear", make_icon_pictures = true, icon_picture_extras = { reskins.lib.sprites.get_sprite_light_layer("fuel-cell") } },
    ["deuterium-fuel-cell"] = { subgroup = "nuclear", image = "deuterium-fuel-cell-pink", make_icon_pictures = true, icon_picture_extras = { reskins.lib.sprites.get_sprite_light_layer("fuel-cell") } },
    ["deuterium-fuel-cell-2"] = { subgroup = "nuclear", image = "deuterium-fuel-cell-2-pink", make_icon_pictures = true, icon_picture_extras = { reskins.lib.sprites.get_sprite_light_layer("fuel-cell") } },
    ["used-up-thorium-fuel-cell"] = { subgroup = "nuclear" },
    ["used-up-deuterium-fuel-cell"] = { subgroup = "nuclear", image = "used-up-deuterium-fuel-cell-pink" },
    ["plutonium-239"] = {
        subgroup = "nuclear",
        make_icon_pictures = true,
        icon_picture_extras = { {
            draw_as_light = true,
            blend_mode = "additive",
            size = 64,
            filename = "__reskins-bobs__/graphics/icons/plates/nuclear/plutonium-239.png",
            scale = 0.5,
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            mipmap_count = 4,
        } },
    },
    ["thorium-232"] = { subgroup = "nuclear" },

    -- Fluids
    ["liquid-air"] = { type = "fluid", subgroup = "fluids" },
    ["liquid-fuel"] = { type = "fluid", subgroup = "fluids" },
    ["ferric-chloride-solution"] = { type = "fluid", subgroup = "fluids" },                   -- Shared with Bob's Electronics
    ["lithia-water"] = { type = "fluid", subgroup = "fluids", defer_to_data_updates = true }, -- Shared with Bob's Ores, Angels
    ["alien-acid"] = { type = "fluid", subgroup = "fluids" },
    ["alien-explosive"] = { type = "fluid", subgroup = "fluids" },
    ["alien-fire"] = { type = "fluid", subgroup = "fluids" },
    ["alien-poison"] = { type = "fluid", subgroup = "fluids" },

    -- Miscellaneous Items
    ["silicon-wafer"] = { mod = "lib", group = "shared", subgroup = "items" },
    ["bob-silicon-plate"] = { subgroup = "items", image = "silicon" },
    ["bob-glass"] = { mod = "lib", group = "shared", subgroup = "items", image = "glass" },
    ["carbon"] = { subgroup = "items" },
    ["rubber"] = { mod = "lib", group = "shared", subgroup = "items" }, -- Shared with Bob's Electronics, Angels
    ["resin"] = { subgroup = "items" },                                 -- Shared with Bob's Electronics
    ["enriched-fuel"] = { subgroup = "items" },
    ["bob-grinding-wheel"] = { subgroup = "items", image = "grinding-wheel" },
    ["bob-polishing-wheel"] = { subgroup = "items", image = "polishing-wheel" },
    ["bob-polishing-compound"] = { subgroup = "items", image = "polishing-compound" },

    -- Powders -- TODO: https://github.com/kirazy/reskins-bobs/issues/31 Model and render out powder/particulate icons
    ["calcium-chloride"] = { subgroup = "powders" },
    ["sodium-hydroxide"] = { subgroup = "powders" },
    -- ["lithium-chloride"] = {subgroup = "powders"}, -- Needs made-for-resolution icon
    -- ["lithium-cobalt-oxide"] = {subgroup = "powders"}, -- Needs made-for-resolution icon
    -- ["lithium-perchlorate"] = {subgroup = "powders"}, -- Needs made-for-resolution icon
    ["powdered-silicon"] = { subgroup = "powders" },
    ["salt"] = { subgroup = "powders" },
    ["silicon-carbide"] = { subgroup = "powders" },
    ["silicon-nitride"] = { subgroup = "powders" },
    ["silicon-powder"] = { subgroup = "powders" },
    -- ["silver-oxide"] = {subgroup = "powders"}, -- Needs made-for-resolution icon

    -- Gemstones
    ["bob-ruby-5"] = { subgroup = "gems", image = "ruby-5" },
    ["bob-sapphire-5"] = { subgroup = "gems", image = "sapphire-5" },
    ["bob-emerald-5"] = { subgroup = "gems", image = "emerald-5" },
    ["bob-amethyst-5"] = { subgroup = "gems", image = "amethyst-5" },
    ["bob-topaz-5"] = { subgroup = "gems", image = "topaz-5" },
    ["bob-diamond-5"] = { subgroup = "gems", image = "diamond-5" },

    ----------------------------------------------------------------------------------------------------
    -- Recipes
    ----------------------------------------------------------------------------------------------------
    -- Plates
    ["cobalt-oxide-from-copper"] = { type = "recipe", subgroup = "recipes" },
    ["silver-from-lead"] = { type = "recipe", subgroup = "recipes" },

    -- Nuclear
    ["thorium-processing"] = { type = "recipe", subgroup = "recipes" },
    ["thorium-fuel-reprocessing"] = { type = "recipe", subgroup = "recipes" },
    ["deuterium-fuel-reprocessing"] = { type = "recipe", subgroup = "recipes", image = "deuterium-fuel-reprocessing-pink" },
    ["bobingabout-enrichment-process"] = { type = "recipe", subgroup = "recipes" },

    -- Solid Fuels
    ["solid-fuel-from-hydrogen"] = { type = "recipe", subgroup = "recipes" },
    ["solid-fuel-from-sour-gas"] = { type = "recipe", subgroup = "recipes" }, -- Shared with Bob's Revamp
    ["enriched-fuel-from-hydrazine"] = { type = "recipe", subgroup = "recipes" },
    ["enriched-fuel-from-liquid-fuel"] = { type = "recipe", subgroup = "recipes" },

    -- Chemicals and Fluids
    -- ["sulfuric-nitric-acid"] = {type = "recipe", subgroup = "recipes"},
    -- ["pure-water"] = {type = "recipe", subgroup = "recipes"},
    -- ["pure-water-from-lithia"] = {type = "recipe", subgroup = "recipes"},
    ["coal-cracking"] = { type = "recipe", subgroup = "recipes" }, -- Shared with Bob's Electronics
    ["petroleum-gas-cracking"] = { type = "recipe", subgroup = "recipes" },

    -- Wood
    ["bob-resin-wood"] = { type = "recipe", subgroup = "recipes" }, -- Shared with Bob's Electronics
    ["bob-resin-oil"] = { type = "recipe", subgroup = "recipes" },  -- Shared with Bob's Electronics
    ["synthetic-wood"] = { type = "recipe", subgroup = "recipes" }, -- Shared with Bob's Electronics
}

-- Handle deuterium color
if reskins.lib.settings.get_value("bobmods-plates-bluedeuterium") == true then
    intermediates["deuterium-fuel-cell"].image = "deuterium-fuel-cell-blue"
    intermediates["deuterium-fuel-cell-2"].image = "deuterium-fuel-cell-2-blue"
    intermediates["used-up-deuterium-fuel-cell"].image = "used-up-deuterium-fuel-cell-blue"
end

-- Handle nuclear update
if reskins.lib.settings.get_value("bobmods-plates-nuclearupdate") == true then
    intermediates["nuclear-fuel-reprocessing"] = { type = "recipe", subgroup = "recipes", defer_to_data_updates = true }

    -- Handle deuterium's default process color
    if reskins.lib.settings.get_value("bobmods-plates-bluedeuterium") == true then
        intermediates["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-blue"
    end
else
    intermediates["thorium-fuel-reprocessing"].image = "thorium-fuel-reprocessing-alternate"

    -- Handle deuterium's alternate process color
    if reskins.lib.settings.get_value("bobmods-plates-bluedeuterium") == true then
        intermediates["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-alternate-blue"
    else
        intermediates["deuterium-fuel-reprocessing"].image = "deuterium-fuel-reprocessing-alternate-pink"
    end
end

-- Advanced processing unit absent Bob's Electronics
if not mods["bobelectronics"] then
    intermediates["advanced-processing-unit"] = { subgroup = "items" }
end

reskins.internal.create_icons_from_list(intermediates, inputs)

-- One-off fixes
if data.raw.item["bob-nickel-plate"] then
    reskins.lib.icons.clear_icon_from_prototype_by_name("bob-bob-nickel-plate", "recipe")
end
if data.raw.fluid["liquid-air"] then
    reskins.lib.icons.clear_icon_from_prototype_by_name("bob-liquid-air", "recipe")
end
if data.raw.item["lead-oxide"] then
    reskins.lib.icons.clear_icon_from_prototype_by_name("lead-oxide-2", "recipe")
end
