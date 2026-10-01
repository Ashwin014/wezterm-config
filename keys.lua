local wezterm = require("wezterm")
local act = wezterm.action

local keys = {}

-- Pane splits
table.insert(keys, { key = "d", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) })
table.insert(keys, { key = "e", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) })
table.insert(keys, {
	key = "m",
	mods = "CTRL|SHIFT",
	action = wezterm.action_callback(function(_, pane)
		pane:move_to_new_tab()
	end),
})
table.insert(keys, {
	key = "M",
	mods = "CTRL|SHIFT|ALT",
	action = wezterm.action_callback(function(_, pane)
		pane:move_to_new_window()
	end),
})

-- Pane navigation
table.insert(keys, { key = "h", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Left") })
table.insert(keys, { key = "j", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Down") })
table.insert(keys, { key = "k", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Up") })
table.insert(keys, { key = "l", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Right") })
table.insert(keys, { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) })

-- Tab switching
table.insert(keys, { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") })
table.insert(keys, { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) })
table.insert(keys, { key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) })

-- jump to tab by number
for i = 1, 8 do
	table.insert(keys, { key = tostring(i), mods = "ALT", action = act.ActivateTab(i - 1) })
end

return keys
