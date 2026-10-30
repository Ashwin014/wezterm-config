-- Behavior: launch program, tabs, geometry & performance
local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Tab bar
	config.tab_bar_at_bottom = false
	config.use_fancy_tab_bar = false -- thinner, plain-text bar instead of the fancy retro one
	config.tab_max_width = 30

	-- Initial geometry for new windows
	config.initial_cols = 130
	config.initial_rows = 40

	local has_pwsh = false
	for dir in (os.getenv("PATH") or ""):gmatch("[^;]+") do
		local f = io.open(dir .. "\\pwsh.exe", "r")
		if f then
			f:close()
			has_pwsh = true
			break
		end
	end

	if wezterm.target_triple:find("windows") then
		if has_pwsh then
			config.default_prog = { "pwsh" }
		else
			config.default_prog = { "powershell" }
		end
	else
		config.default_prog = { "bash" }
	end

	-- Kitty protocols
	config.enable_kitty_graphics = true
	config.enable_kitty_keyboard = true

	-- Performance
	config.front_end = "WebGpu" -- Faster GPU rendering
	config.max_fps = 144
	config.animation_fps = 1
	config.prefer_egl = true
end

return module
