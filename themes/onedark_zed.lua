-- onedark_zed theme
-- Palette + colors table for the "onedark_zed" look.
local module = {}

module.name = "onedark_zed"

module.palette = {
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

local p = module.palette
local fg = p.white
local bg = p.black

module.colors = {
	cursor_bg = "white",
	cursor_border = "white",
	foreground = fg,
	background = bg,
	selection_fg = fg,
	selection_bg = p.selection,
	split = p.gray,
	tab_bar = {
		background = bg,
		active_tab = { bg_color = p.blue_gray, fg_color = fg },
		inactive_tab = { bg_color = p.gray, fg_color = p.light_gray },
		inactive_tab_hover = { bg_color = p.gray, fg_color = fg },
		new_tab = { bg_color = bg, fg_color = p.gray },
		new_tab_hover = { bg_color = p.gray, fg_color = fg },
	},
}

return module
