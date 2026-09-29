local wezterm = require("wezterm")
local config = {}
local config_dir = wezterm.config_dir

-- Use the config builder object if using a newer version
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ember color palette
-- sourced from https://github.com/ember-theme/nvim/blob/main/lua/ember/palette.lua
-- local ember_bg = "#1c1b19" -- H45  S6%  L10%
-- local ember_bg_alt = "#242320" -- H30  S4%  L13% — Emacs hl-line value
-- local ember_base0 = "#151412" -- H40  S8%  L7%
-- local ember_base1 = "#1c1b19" -- H45  S6%  L10%
-- local ember_base2 = "#252422" -- H40  S5%  L14%
-- local ember_base3 = "#2e2d2a" -- H42  S5%  L17%
-- local ember_base4 = "#3e3c38" -- H42  S5%  L23%
-- local ember_base5 = "#585550" -- H40  S5%  L33%
-- local ember_base6 = "#706c61" -- H43  S8%  L41%
-- local ember_base7 = "#908a7e" -- H42  S8%  L53%
-- local ember_base8 = "#b8b0a0" -- H40  S12% L68%
-- local ember_fg = "#d8d0c0" -- H42  S16% L82%
-- local ember_fg_alt = "#b0a898" -- H38  S12% L64%

local ember = {
	bg = "#1c1b19", -- H45  S6%  L10%
	bg_alt = "#242320", -- H30  S4%  L13% — Emacs hl-line value
	base0 = "#151412", -- H40  S8%  L7%
	base1 = "#1c1b19", -- H45  S6%  L10%
	base2 = "#252422", -- H40  S5%  L14%
	base3 = "#2e2d2a", -- H42  S5%  L17%
	base4 = "#3e3c38", -- H42  S5%  L23%
	base5 = "#585550", -- H40  S5%  L33%
	base6 = "#706c61", -- H43  S8%  L41%
	base7 = "#908a7e", -- H42  S8%  L53%
	base8 = "#b8b0a0", -- H40  S12% L68%
	fg = "#d8d0c0", -- H42  S16% L82%
	fg_alt = "#b0a898", -- H38  S12% L64%
}

-- colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
	-- background = "#282c33", -- onedark-zed

	-- colors based on ember theme
	foreground = ember.fg,
	background = ember.bg,
	selection_fg = ember.fg_alt,
	selection_bg = ember.base4,
	split = "#1e1d1b",
	tab_bar = {
		background = ember.bg,
		active_tab = { bg_color = ember.bg, fg_color = "#e08060" },
		inactive_tab = { bg_color = "#151412", fg_color = "#aea697" },
		inactive_tab_hover = { bg_color = "#44423d", fg_color = "#ece3d2" },
		new_tab = { bg_color = "#151412", fg_color = "#aea697" },
		new_tab_hover = { bg_color = "#44423d", fg_color = "#ece3d2" },
	},

	-- -- tab colors based on onedark-zed theme
	-- tab_bar = {
	-- 	background = "#282c33",
	-- 	active_tab = { bg_color = "#5a6f89", fg_color = "#d7dbe4" },
	-- 	inactive_tab = { bg_color = "#2f343e", fg_color = "#585e6a" },
	-- 	inactive_tab_hover = { bg_color = "#c2c7cf", fg_color = "#d7dbe4" },
	-- 	new_tab = { bg_color = "#2f343e", fg_color = "#585e6a" },
	-- 	new_tab_hover = { bg_color = "#c2c7cf", fg_color = "#d7dbe4" },
	-- },
}

-- Appearance & Theme
-- config.color_scheme = "Catppuccin Frappé"
config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("Annotation Mono")
config.font_size = 10.0
-- config.line_height = 0.93
-- config.cell_width = 0.9
--
-- Window styling
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE" -- Minimalist border style
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- TEMP
-- config.window_background_image = config_dir .. "/assets/wallpaperflare.com_wallpaper (5).jpg"
-- config.window_background_image = config_dir .. "/assets/carley-matt-XN4rKm6pUaY-unsplash.jpg"
-- config.window_background_image = config_dir .. "/assets/dark-love-wallpapers-6.jpg"
-- config.window_background_image = config_dir .. "/assets/zetong-li-aCusqffy5sy-unsplash-blurred.jpg"
-- config.window_background_image = config_dir .. "/assets/414958_bg.jpg"
-- config.window_background_image = config_dir .. "/assets/323439_bg.jpg"
-- config.window_background_image = config_dir .. "/assets/364153_bg.jpg"
-- 282c33_bg
-- config.window_background_image_hsb = {
-- 	brightness = 0.3,
-- 	hue = 1.0,
-- 	saturation = 1.0,
-- }

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
