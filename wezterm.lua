local wezterm = require("wezterm")
local config = {}
local config_dir = wezterm.config_dir

-- Use the config builder object if using a newer version
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

-- Appearance & Theme
-- config.color_scheme = "Catppuccin Frappé"
config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("Annotation Mono")
config.font_size = 11.0
config.line_height = 0.93
config.cell_width = 0.9

-- Window styling
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE" -- Minimalist border style
config.hide_tab_bar_if_only_one_tab = true
-- config.window_padding = {
-- 	left = 0,
-- 	right = 0,
-- 	top = 0,
-- 	bottom = 0,
-- }

-- TEMP
-- config.window_background_image = config_dir .. "/assets/wallpaperflare.com_wallpaper (5).jpg"
-- config.window_background_image = config_dir .. "/assets/carley-matt-XN4rKm6pUaY-unsplash.jpg"
-- config.window_background_image = config_dir .. "/assets/dark-love-wallpapers-6.jpg"
-- config.window_background_image = config_dir .. "/assets/zetong-li-aCusqffy5sy-unsplash-blurred.jpg"
config.window_background_image = config_dir .. "/assets/545454_bg.jpg"
config.window_background_image_hsb = {
	brightness = 0.3,
	hue = 1.0,
	saturation = 1.0,
}

config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false -- thinner, plain-text bar instead of the fancy retro one
config.tab_max_width = 25

-- For example, changing the initial geometry for new windows:
config.initial_cols = 130
config.initial_rows = 40

-- For PowerShell 7 (pwsh)
config.default_prog = { "pwsh" }

-- Or for Windows PowerShell (5.1) if pwsh isn't installed
-- config.default_prog = { 'powershell' }

config.enable_kitty_graphics = true

-- Performance
config.front_end = "WebGpu" -- Faster GPU rendering

-- Misc
config.max_fps = 120
config.prefer_egl = true

-- ==========================================================================================================
-- Keybindings
-- ==========================================================================================================

-- Pane splits
config.keys = config.keys or {}
local act = wezterm.action

table.insert(
	config.keys,
	{ key = "d", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }
)
table.insert(
	config.keys,
	{ key = "e", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }
)
table.insert(config.keys, { key = "h", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Left") })
table.insert(config.keys, { key = "j", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Down") })
table.insert(config.keys, { key = "k", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Up") })
table.insert(config.keys, { key = "l", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Right") })
table.insert(config.keys, { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) }) -- close current pane

-- Tab switching
table.insert(config.keys, { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") })
table.insert(config.keys, { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) })
table.insert(config.keys, { key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) })
-- jump to tab by number
for i = 1, 8 do
	table.insert(config.keys, { key = tostring(i), mods = "ALT", action = act.ActivateTab(i - 1) })
end

return config
