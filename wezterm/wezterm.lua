local wezterm = require("wezterm")
local load = require("core.loader")

local config = {}

local profile = require("profiles.full") -- profiles.full, profiles.minimum

load(config, profile)

return config
