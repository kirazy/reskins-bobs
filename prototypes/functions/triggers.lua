-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check if reskinning needs to be done

local triggers = {}

-- Angel's Industries
triggers.assembly = {
    burner_assembling_machine_is_small = (mods["aai-industry"] and mods["angelsrefining"]) and true
}

return triggers