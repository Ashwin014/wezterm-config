local wezterm = require("wezterm")
local config = {}
-- local config_dir = wezterm.config_dir

-- Use the config builder object if using a newer version
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ember color palette
-- sourced from https://github.com/ember-theme/nvim/blob/main/lua/ember/palette.lua
-- local ember = {
-- 	bg = "#1c1b19", -- H45  S6%  L10%
-- 	bg_alt = "#242320", -- H30  S4%  L13% — Emacs hl-line value
-- 	base0 = "#151412", -- H40  S8%  L7%
-- 	base1 = "#1c1b19", -- H45  S6%  L10%
-- 	base2 = "#252422", -- H40  S5%  L14%
-- 	base3 = "#2e2d2a", -- H42  S5%  L17%
-- 	base4 = "#3e3c38", -- H42  S5%  L23%
-- 	base5 = "#585550", -- H40  S5%  L33%
-- 	base6 = "#706c61", -- H43  S8%  L41%
-- 	base7 = "#908a7e", -- H42  S8%  L53%
-- 	base8 = "#b8b0a0", -- H40  S12% L68%
-- 	fg = "#d8d0c0", -- H42  S16% L82%
-- 	fg_alt = "#b0a898", -- H38  S12% L64%
--
-- 	accents_dark = {
-- 		coral = "#e08060", -- H18  S55% L63%  — hero
-- 		orange = "#c09058", -- H30  S42% L55%
-- 		gold = "#c8b468", -- H45  S42% L60%
-- 		olive = "#8a9868", -- H78  S22% L50%
-- 		sage = "#80a090", -- H150 S14% L56%
-- 		steel = "#7890a0", -- H205 S18% L55%
-- 		rose = "#b07878", -- H0   S25% L58%
-- 		mauve = "#988090", -- H315 S12% L55%
-- 	},
-- }

-- onedark_zed color palette
local onedark_zed = {
	yellow = "#dfc184",
	orange = "#bf956a",
	blue = "#73ade9",
	blue_gray = "#5a6f89",
	red = "#d07277",
	purple = "#b477cf",
	green = "#a1c181",
	cyan = "#6eb4bf",
	gray = "#2f343e",
	light_gray = "#5d636f",
	faint_gray = "#3b4048",
	linenr = "#5d636f",
	white = "#c8ccd4",
	black = "#282c33",
	selection = "#293b5b",
	frameline = "#97202a",
	none = "NONE",
}

local onedark_zed_fg = onedark_zed.white
local onedark_zed_bg = onedark_zed.black

-- colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
	-- background = "#282c33", -- onedark-zed

	-- colors based on ember theme
	-- foreground = ember.fg,
	-- background = ember.bg,
	-- selection_fg = ember.fg_alt,
	-- selection_bg = ember.base4,
	-- split = ember.base2,
	-- tab_bar = {
	-- 	background = ember.bg,
	-- 	active_tab = { bg_color = ember.bg, fg_color = ember.accents_dark.coral },
	-- 	inactive_tab = { bg_color = ember.base0, fg_color = ember.base7 },
	-- 	inactive_tab_hover = { bg_color = ember.base4, fg_color = ember.base8 },
	-- 	new_tab = { bg_color = ember.base0, fg_color = ember.base7 },
	-- 	new_tab_hover = { bg_color = ember.base4, fg_color = ember.base8 },
	-- },

	-- colors based on onedark_zed theme
	foreground = onedark_zed_fg,
	background = onedark_zed_bg,
	selection_fg = onedark_zed_fg,
	selection_bg = onedark_zed.selection,
	split = onedark_zed.gray,
	tab_bar = {
		background = onedark_zed_bg,
		active_tab = { bg_color = onedark_zed.blue_gray, fg_color = onedark_zed_fg },
		inactive_tab = { bg_color = onedark_zed.gray, fg_color = onedark_zed.light_gray },
		inactive_tab_hover = { bg_color = onedark_zed.gray, fg_color = onedark_zed_fg },
		new_tab = { bg_color = onedark_zed_bg, fg_color = onedark_zed.gray },
		new_tab_hover = { bg_color = onedark_zed.gray, fg_color = onedark_zed_fg },
	},
}

-- Appearance & Theme
config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("Annotation Mono")
-- config.font = wezterm.font("Geist Mono")
config.font_size = 9.0
-- config.line_height = 0.93
-- config.cell_width = 0.9
--
-- Window styling
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE" -- Minimalist border style
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
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
config.enable_kitty_keyboard = true

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
table.insert(config.keys, {
	key = "m",
	mods = "CTRL|SHIFT",
	action = wezterm.action_callback(function(_win, pane)
		pane:move_to_new_tab()
	end),
})
table.insert(config.keys, {
	key = "M",
	mods = "CTRL|SHIFT|ALT",
	action = wezterm.action_callback(function(_win, pane)
		pane:move_to_new_window()
	end),
})
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
