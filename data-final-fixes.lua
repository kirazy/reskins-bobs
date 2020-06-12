-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Icon handling
for name, inputs in pairs(reskins.bobs.icons) do
    reskins.lib.assign_icons(name, inputs)
end

-- Technology handling
for name, inputs in pairs(reskins.bobs.technology) do
    reskins.lib.assign_technology_icons(name, inputs)
end

-- Compatibility
require("prototypes.compatibility.mini-machines") -- This must be called after icons are handled