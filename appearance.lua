-- Appearance: font, window styling, padding, background image options
-- (theme-agnostic; colors live in themes/*.lua)
local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Font
	-- config.font = wezterm.font("JetBrains Mono")
	-- config.font = wezterm.font("Fira Code")
	-- config.font = wezterm.font("Annotation Mono")
	config.font = wezterm.font("Kode Mono")
	config.font_size = 11.0
	config.cell_width = 1.1

	-- Switch between Vs Code Dark+/Light+ based on the system appearance (dark/light).
	local function color_scheme_for_appearance(appearance)
		if appearance and appearance:find("Dark") then
			return "Vs Code Dark+ (Gogh)"
		end
		return "Vs Code Light+ (Gogh)"
	end

	local system_appearance = "Light"
	if wezterm.gui then
		local ok, res = pcall(wezterm.gui.get_appearance)
		if ok and res then
			system_appearance = res
		end
	end
	config.color_scheme = color_scheme_for_appearance(system_appearance)

	-- Live update when the OS theme changes (or config reloads).
	wezterm.on("window-config-reloaded", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		overrides.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())
		window:set_config_overrides(overrides)
	end)

	-- Polling fallback: ensure the theme follows the system even if the
	-- config-reloaded event doesn't fire on every OS appearance change.
	wezterm.on("update-status", function(window, pane)
		local appearance = wezterm.gui.get_appearance()
		local desired = color_scheme_for_appearance(appearance)
		local overrides = window:get_config_overrides() or {}
		if overrides.color_scheme ~= desired then
			overrides.color_scheme = desired
			window:set_config_overrides(overrides)
		end
	end)

	-- Window styling
	config.adjust_window_size_when_changing_font_size = false
	-- config.window_background_opacity = 0.97
	config.window_decorations = "RESIZE"
	config.hide_tab_bar_if_only_one_tab = true
	config.window_padding = {
		left = 3,
		right = 3,
		top = 3,
		bottom = 3,
	}

	-- Background image (TEMP)
	-- local config_dir = wezterm.config_dir
	-- config.window_background_image = config_dir .. "/assets/wallpaperflare.com_wallpaper (5).jpg"
	-- config.window_background_image = config_dir .. "/assets/carley-matt-XN4rKm6pUaY-unsplash.jpg"
	-- config.window_background_image = config_dir .. "/assets/dark-love-wallpapers-6.jpg"
	-- config.window_background_image = config_dir .. "/assets/zetong-li-aCusqffy5sy-unsplash-blurred.jpg"
	-- config.window_background_image = config_dir .. "/assets/plain-bg.jpg"
	-- config.window_background_image = config_dir .. "/assets/plain-bg-spotlight.jpg"
	-- config.window_background_image_hsb = {
	-- 	brightness = 0.24,
	-- 	hue = 1.0,
	-- 	saturation = 1.0,
	-- }

	-- Enable Windows backdrop effects (Windows 11)
	-- config.win32_system_backdrop = "Acrylic" -- Options: 'Acrylic', 'Mica', 'Tabbed'

	-- Enable macOS native blur
	-- config.macos_window_background_blur = 20
end

return module
