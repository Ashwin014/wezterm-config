-- Appearance: font, window styling, padding, background image options
-- (theme-agnostic; colors live in themes/*.lua)
local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Font
	config.font = wezterm.font("JetBrains Mono")
	-- config.font = wezterm.font("Fira Code")
	-- config.font = wezterm.font("Annotation Mono")
	-- config.font = wezterm.font("Geist Mono")
	config.font_size = 12.0
	-- config.line_height = 0.93
	-- config.cell_width = 0.9

	-- Window styling
	config.adjust_window_size_when_changing_font_size = false
	config.window_background_opacity = 0.72
	config.window_decorations = "RESIZE"
	config.hide_tab_bar_if_only_one_tab = true
	config.window_padding = {
		left = 5,
		right = 0,
		top = 9,
		bottom = 0,
	}

	-- Background image (TEMP)
	-- local config_dir = wezterm.config_dir
	-- config.window_background_image = config_dir .. "/assets/wallpaperflare.com_wallpaper (5).jpg"
	-- config.window_background_image = config_dir .. "/assets/carley-matt-XN4rKm6pUaY-unsplash.jpg"
	-- config.window_background_image = config_dir .. "/assets/dark-love-wallpapers-6.jpg"
	-- config.window_background_image = config_dir .. "/assets/zetong-li-aCusqffy5sy-unsplash-blurred.jpg"
	-- config.window_background_image_hsb = {
	-- 	brightness = 0.1,
	-- 	hue = 1.0,
	-- 	saturation = 1.0,
	-- }

	-- Enable Windows backdrop effects (Windows 11)
	config.win32_system_backdrop = "Acrylic" -- Options: 'Acrylic', 'Mica', 'Tabbed'

	-- Enable macOS native blur
	-- config.macos_window_background_blur = 20
end

return module
