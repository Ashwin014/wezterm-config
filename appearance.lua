-- Appearance: font, window styling, padding, background image options
-- (theme-agnostic; colors live in themes/*.lua)
local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Font
	-- config.font = wezterm.font("JetBrains Mono")
	-- config.font = wezterm.font("Fira Code")
	-- config.font = wezterm.font("Annotation Mono")
	-- config.font = wezterm.font("Kode Mono")
	-- config.font = wezterm.font("0xProto Nerd Font")
	-- config.font = wezterm.font("Lilex Nerd Font")
	-- config.font = wezterm.font("Hurmit Nerd Font")
	-- config.font = wezterm.font("VictorMono NF")
	config.font = wezterm.font("psudoFont Liga Mono")
	-- config.font = wezterm.font("Fragment Mono")
	-- config.font = wezterm.font("Twilio Sans Mono")
	-- config.font = wezterm.font("Lyth Mono")
	-- config.font = wezterm.font("LythMono Nerd Font")
	-- config.font = wezterm.font("LythMonoTermSquare Nerd Font")
	-- config.font = wezterm.font("LythMonoTerm Nerd Font")
	config.font_size = 11.0

	-- Background color presets: add the hex colors for the themes you use regularly.
	-- Each theme has both a dark background and a light background.
	local background_presets = {
		ember = {
			dark = "#1c1b19",
			light = "#e6dac4",
		},
		vscode = {
			dark = "#1f1f1f",
			light = "#ffffff",
		},
		soviet = {
			dark = "#292727",
			light = "#ddd0b8",
		},
	}

	-- Change this to match your current neovim theme (use a key from the table above).
	-- You can also override without editing this file via env vars:
	--   WEZTERM_BACKGROUND_PRESET=catppuccin
	local theme_preset = os.getenv("WEZTERM_BACKGROUND_PRESET") or "vscode"

	local function background_color_for_appearance(appearance)
		local preset = background_presets[theme_preset] or background_presets.ember
		if appearance and appearance:find("Dark") then
			return preset.dark
		end
		return preset.light
	end

	local system_appearance = "Light"
	if wezterm.gui then
		local ok, res = pcall(wezterm.gui.get_appearance)
		if ok and res then
			system_appearance = res
		end
	end
	config.colors = config.colors or {}
	config.colors.background = background_color_for_appearance(system_appearance)

	-- Live update the background color when the OS theme changes.
	wezterm.on("window-config-reloaded", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		overrides.colors = overrides.colors or {}
		overrides.colors.background = background_color_for_appearance(wezterm.gui.get_appearance())
		window:set_config_overrides(overrides)
	end)

	-- Polling fallback: keep the background color in sync with the system theme.
	wezterm.on("update-status", function(window, pane)
		local appearance = wezterm.gui.get_appearance()
		local desired = background_color_for_appearance(appearance)
		local overrides = window:get_config_overrides() or {}
		overrides.colors = overrides.colors or {}
		if overrides.colors.background ~= desired then
			overrides.colors.background = desired
			window:set_config_overrides(overrides)
		end
	end)

	-- Window styling
	config.adjust_window_size_when_changing_font_size = false
	config.window_background_opacity = 0.99
	config.window_decorations = "RESIZE"
	config.hide_tab_bar_if_only_one_tab = true
	config.window_padding = {
		left = 3,
		right = 3,
		top = 3,
		bottom = 0,
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
