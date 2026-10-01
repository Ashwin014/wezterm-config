-- ember color palette
-- sourced from https://github.com/ember-theme/nvim/blob/main/lua/ember/palette.lua
local ember = {
	bg = "#1c1b19", -- H45  S6%  L10%
	bg_alt = "#242320", -- H30  S4%  L13% — Emacs hl-line value
	base0 = "#151412", -- H40  S8%  L7%
	base1 = "#1c1b19", -- H45  S6%  L10%
	base2 = "#252422", -- H40  S5%  L14%
	base3 = "#2e2d2a", -- H42  S5%  L17%
	base4 = "#3e3c38", -- H42  S5%  L23%
	base5 = "#585550", -- H40  S5%  L33%
	base6 = "#706c61", -- H43  S8%  L41%
	base7 = "#908a7e", -- H42  S8%  L53%
	base8 = "#b8b0a0", -- H40  S12% L68%
	fg = "#d8d0c0", -- H42  S16% L82%
	fg_alt = "#b0a898", -- H38  S12% L64%

	accents_dark = {
		coral = "#e08060", -- H18  S55% L63%  — hero
		orange = "#c09058", -- H30  S42% L55%
		gold = "#c8b468", -- H45  S42% L60%
		olive = "#8a9868", -- H78  S22% L50%
		sage = "#80a090", -- H150 S14% L56%
		steel = "#7890a0", -- H205 S18% L55%
		rose = "#b07878", -- H0   S25% L58%
		mauve = "#988090", -- H315 S12% L55%
	},
}

config.colors = {

	-- colors based on ember theme
	foreground = ember.fg,
	background = ember.bg,
	selection_fg = ember.fg_alt,
	selection_bg = ember.base4,
	split = ember.base2,
	tab_bar = {
		background = ember.bg,
		active_tab = { bg_color = ember.bg, fg_color = ember.accents_dark.coral },
		inactive_tab = { bg_color = ember.base0, fg_color = ember.base7 },
		inactive_tab_hover = { bg_color = ember.base4, fg_color = ember.base8 },
		new_tab = { bg_color = ember.base0, fg_color = ember.base7 },
		new_tab_hover = { bg_color = ember.base4, fg_color = ember.base8 },
	},
}
