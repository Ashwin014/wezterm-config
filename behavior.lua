-- Behavior: launch program, tabs, geometry & performance
local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Tab bar
	config.tab_bar_at_bottom = false
	config.use_fancy_tab_bar = false -- thinner, plain-text bar instead of the fancy retro one
	config.tab_max_width = 25

	-- Initial geometry for new windows
	config.initial_cols = 130
	config.initial_rows = 40

	-- Default program: PowerShell 7 (pwsh)
	config.default_prog = { "pwsh" }
	-- Or for Windows PowerShell (5.1) if pwsh isn't installed
	-- config.default_prog = { "powershell" }

	-- Kitty protocols
	config.enable_kitty_graphics = true
	config.enable_kitty_keyboard = true

	-- Performance
	config.front_end = "WebGpu" -- Faster GPU rendering
	-- config.max_fps = 120
	config.max_fps = 144
	config.animation_fps = 1
	config.prefer_egl = true
end

return module
