-- school theme
-- Palette + colors table for the "school" look.
local module = {}

module.name = "school"

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
	-- yellow = "#dfc184",
	-- orange = "#bf956a",
	-- blue = "#73ade9",
	-- blue_gray = "#5a6f89",
	-- red = "#d07277",
	-- purple = "#b477cf",
	-- green = "#a1c181",
	-- cyan = "#6eb4bf",
	-- gray = "#2f343e",
	-- light_gray = "#5d636f",
	-- faint_gray = "#3b4048",
	-- linenr = "#5d636f",
	-- white = "#c8ccd4",
	-- black = "#282c33",
	-- selection = "#293b5b",
	-- frameline = "#97202a",
	-- none = "NONE",

	bg = bc.base01,
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

	-- diff/git backgrounds (dark, desaturated tints)
	diff_add_bg = "#20301f",
	diff_change_bg = "#232b3a",
	diff_delete_bg = "#3a2226",
	diff_text_bg = "#33415c",
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
		active_tab = { bg_color = p.bg_alt, fg_color = p.fg },
		inactive_tab = { bg_color = p.bg_alt, fg_color = p.border },
		inactive_tab_hover = { bg_color = bp.base02, fg_color = p.fg },
		new_tab = { bg_color = p.bg, fg_color = p.muted },
		new_tab_hover = { bg_color = p.muted, fg_color = p.fg },
	},
}

return module
