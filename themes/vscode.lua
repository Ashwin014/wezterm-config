-- vscode theme
local module = {}

module.name = "vscode"

local bc = {
	base00 = "#212121",
	base01 = "#303030",
	base02 = "#424242",
	base03 = "#545454",
	base04 = "#636363",
	base05 = "#727272",
	base06 = "#878787",
}

module.palette = {
	bg = "#1f1f1f",
	bg_alt = bc.base00, -- floats, statusline, cursorline
	bg_sel = bc.base02, -- selection, popup selection, visual
	bg_dark = bc.base01, -- dashboard, dimmer panels
	fg = bc.base06,
	fg_alt = bc.base05, -- secondary text, inactive items
	muted = bc.base03, -- comments, line numbers, delimiters
	border = bc.base02,

	red = "#b85860",
	orange = "#b58559",
	yellow = "#ccab6e",
	green = "#83a868",
	cyan = "#4a9da8",
	blue = "#589dd6",
	purple = "#af6ac4",
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
		background = p.bg,
		active_tab = { bg_color = bc.base02, fg_color = p.fg },
		inactive_tab = { bg_color = p.bg_alt, fg_color = p.border },
		inactive_tab_hover = { bg_color = p.bg, fg_color = p.fg },
		new_tab = { bg_color = p.bg, fg_color = p.muted },
		new_tab_hover = { bg_color = p.muted, fg_color = p.fg },
	},
}

return module
