-- Theme registry: maps a theme name to its color definition and applies it.
local wezterm = require("wezterm")

local module = {}

local DEFAULT = "onedark_zed"
-- local DEFAULT = "school"
-- local DEFAULT = "vsode"

-- To add a theme: drop a file in themes/ and register it here.
local THEMES = {
	onedark_zed = require("themes.onedark_zed"),
	ember = require("themes.ember"),
	school = require("themes.school"),
	vscode = require("themes.vscode"),
}

--- Return the theme table for `name`, falling back to the default.
function module.get(name)
	return THEMES[name] or THEMES[DEFAULT]
end

--- Apply the named theme's colors onto the config.
function module.apply_to_config(config, name)
	config.colors = module.get(name).colors
end

return module
