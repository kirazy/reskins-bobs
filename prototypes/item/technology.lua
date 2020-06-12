-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobtech"] then return end

-- Science Packs
local science_packs = {
    ["advanced-logistic-science-pack"] = {tint = util.color("de00a3")},
}

if settings.startup["bobmods-tech-colorupdate"] and settings.startup["bobmods-tech-colorupdate"].value == true and settings.startup["reskins-lib-customize-tier-colors"].value == true then
        science_packs["automation-science-pack"] = {tier = 1}
        science_packs["logistic-science-pack"] = {tier = 2}
        science_packs["chemical-science-pack"] = {tier = 3}
        science_packs["production-science-pack"] = {tier = 4}
        science_packs["utility-science-pack"] = {tier = 5}
end

for name, parameters in pairs(science_packs) do
    inputs = {
        directory = reskins.bobs.directory,
        mod = "bobs",
        group = "technology",
        type = "tool",
        icon_name = "science-pack",
        tint = parameters.tint or reskins.lib.tint_index["tier-"..parameters.tier]
    }

    -- Fetch entity
    entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end
    
    -- Setup input defaults
    reskins.lib.parse_inputs(inputs)

    reskins.lib.construct_icon(name, 0, inputs)
    reskins.lib.construct_technology_icon(name, inputs)

    -- Label to skip to next iteration
    ::continue::
end

-- Alien Science Packs
if settings.startup["bobmods-enemies-enablenewartifacts"] and settings.startup["bobmods-enemies-enablenewartifacts"].value == true then
    local alien_science_packs = {
        "alien-science-pack",
        "alien-science-pack-blue",
        "alien-science-pack-orange",
        "alien-science-pack-purple",
        "alien-science-pack-yellow",
        "alien-science-pack-green",
        "alien-science-pack-red",
        "science-pack-gold",
    }

    for _, name in ipairs(alien_science_packs) do
        local inputs = {
            directory = reskins.bobs.directory,
            mod = "bobs",
            group = "technology",
            type = "tool",
            icon_layers = 1,
            icon_name = "alien-science-pack",
            icon_base = name,
            -- make_entity_pictures = true,
        }

        -- Fetch entity
        entity = data.raw[inputs.type][name]

        -- Check if entity exists, if not, skip this iteration
        if not entity then goto continue end

        -- Setup input defaults
        reskins.lib.parse_inputs(inputs)

        reskins.lib.construct_icon(name, 0, inputs)

        -- Label to skip to next iteration
        ::continue::
    end
end