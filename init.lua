local wezterm = require("wezterm")

-- let `require` find colors/*.lua and keys.lua next to this file
package.path = package.path .. ";" .. wezterm.config_dir .. "/?.lua"

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

---------------------------------------------------------------------
-- Colors — pick the theme in colors/init.lua, not here
---------------------------------------------------------------------
config.colors = require("colors").colors

---------------------------------------------------------------------
-- Appearance & Theme
---------------------------------------------------------------------
config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("Annotation Mono")
-- config.font = wezterm.font("Geist Mono")
config.font_size = 10.0
-- config.line_height = 0.93
-- config.cell_width = 0.9

-- Window styling
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE" -- Minimalist border style
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 3,
	bottom = 3,
}

-- TEMP: background image
-- local config_dir = wezterm.config_dir
-- config.window_background_image = config_dir .. "/assets/<file>.jpg"
-- config.window_background_image_hsb = {
-- 	brightness = 0.3,
-- 	hue = 1.0,
-- 	saturation = 1.0,
-- }

config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false -- thinner, plain-text bar instead of the fancy retro one
config.tab_max_width = 25

config.initial_cols = 130
config.initial_rows = 40

-- For PowerShell 7 (pwsh)
config.default_prog = { "pwsh" }
-- Or for Windows PowerShell (5.1) if pwsh isn't installed
-- config.default_prog = { 'powershell' }

config.enable_kitty_graphics = true
config.enable_kitty_keyboard = true

-- Performance
config.front_end = "WebGpu" -- Faster GPU rendering
config.max_fps = 120
config.prefer_egl = true

---------------------------------------------------------------------
-- Keybindings
---------------------------------------------------------------------
config.keys = require("keys")

return config
