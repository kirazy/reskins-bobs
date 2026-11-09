---@using data

-- The `util` global is not available during the settings stage and must be imported.
local util = require("util")
local _settings = require("__reskins-framework__.api.settings-utils")

_settings.set_default_tier_color(4, util.color("#b459ff"))
_settings.set_default_tier_color(5, util.color("#67e55c"))
_settings.set_default_tier_color(6, util.color("#ff8533"))
