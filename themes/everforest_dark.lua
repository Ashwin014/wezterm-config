local module = {}

module.name = "everforest_dark"

module.palette = {
	bg = "#2d353b",
	bg_alt = "#343f44",
	bg_sel = "#475258",

	grey0 = "#7a8478"
	grey1 = "#859289"
	grey2 = "#9da9a0"

	fg = "#d3c6aa",
	-- fg_alt = "#d4d4d4",
	border = "#444444",
	tab_bg = "#2d353b",
}

local p = module.palette

module.colors = {
	cursor_bg = "white",
	cursor_border = "white",
	foreground = p.fg,
	background = p.bg,
	selection_fg = p.fg,
	selection_bg = p.bg_sel,
	split = p.border,
	tab_bar = {
		background = p.tab_bg,
	-- 	active_tab = { bg_color = p.bg, fg_color = p.fg_alt },
	-- 	inactive_tab = { bg_color = p.tab_bg, fg_color = p.fg_alt },
	-- 	inactive_tab_hover = { bg_color = p.tab_bg, fg_color = p.fg_alt },
	-- 	new_tab = { bg_color = p.tab_bg, fg_color = p.fg_alt },
	-- 	new_tab_hover = { bg_color = p.tab_bg, fg_color = p.fg_alt },
	},
}

return module
