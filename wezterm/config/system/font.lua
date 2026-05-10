local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font Mono",
		"FiraCode Nerd Font Mono",
		"Noto Sans Mono",
		"Noto Sans CJK JP",
		"Noto Color Emoji",
	}),

	font_size = 13,
	line_height = 1.15,
}
