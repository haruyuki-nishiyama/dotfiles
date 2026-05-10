local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- Recommended: assign F13 using PowerToys
	-- (e.g. map a physical key such as Ctrl+CapsLock to F13)

	leader = { key = "F13", timeout_milliseconds = 2000 },

	keys = {
		{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },

		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },

		{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "/", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

		{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },

		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

		{ key = "h", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "l", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "k", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "j", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },

		{ key = "f", mods = "LEADER", action = act.ToggleFullScreen },
	},
}
