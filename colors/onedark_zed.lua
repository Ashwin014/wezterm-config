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

return {
	colors = {
		cursor_bg = "white",
		cursor_border = "white",
		foreground = onedark_zed.white,
		background = onedark_zed.black,
		selection_fg = onedark_zed.white,
		selection_bg = onedark_zed.selection,
		split = onedark_zed.gray,
		tab_bar = {
			background = onedark_zed.black,
			active_tab = { bg_color = onedark_zed.blue_gray, fg_color = onedark_zed.white },
			inactive_tab = { bg_color = onedark_zed.gray, fg_color = onedark_zed.light_gray },
			inactive_tab_hover = { bg_color = onedark_zed.gray, fg_color = onedark_zed.white },
			new_tab = { bg_color = onedark_zed.black, fg_color = onedark_zed.gray },
			new_tab_hover = { bg_color = onedark_zed.gray, fg_color = onedark_zed.white },
		},
	},
	palette = onedark_zed,
}
