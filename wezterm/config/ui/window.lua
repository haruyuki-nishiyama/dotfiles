local wezterm = require("wezterm")
local transparent = "rgba(0, 0, 0, 0.00)"

return {
	-- ================================================================
	-- Background
	-- ================================================================

	window_background_opacity = 0.76,
	text_background_opacity = 1.0,
	win32_system_backdrop = "Acrylic",

	-- ================================================================
	-- Padding
	-- ================================================================

	window_padding = {
		left = 12,
		right = 12,
		top = 12,
		bottom = 12,
	},

	-- ================================================================
	-- Title bar
	-- ================================================================

	-- hide title bar
	window_decorations = "RESIZE",

	window_frame = {
		inactive_titlebar_bg = transparent,
		active_titlebar_bg = transparent,
		inactive_titlebar_fg = transparent,
		active_titlebar_fg = transparent,
		font = wezterm.font("JetBrainsMono Nerd Font Mono"),
		font_size = 12,
	},
}
