local wezterm = require("wezterm")

-- Use the config builder object if using a newer version of wezterm
local config
if wezterm.config_builder then
	config = wezterm.config_builder()
else
	config = {}
end

-- =================================================================================================
-- Active theme: uncomment exactly one line
-- =================================================================================================
local ACTIVE_THEME = "onedark_zed"
-- local ACTIVE_THEME = "ember"
-- local ACTIVE_THEME = "school"
-- local ACTIVE_THEME = "vscode"

-- =================================================================================================
-- Modules (each exports apply_to_config(config))
-- =================================================================================================
require("appearance").apply_to_config(config)
require("behavior").apply_to_config(config)
require("keybindings").apply_to_config(config)
require("themes.registry").apply_to_config(config, ACTIVE_THEME)

return config
