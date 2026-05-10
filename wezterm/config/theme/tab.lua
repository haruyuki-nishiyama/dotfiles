local scheme = require("config.theme.colorscheme")

return function(config)
	return {
		bg_active = scheme.get_tab_active_bg(config),
		bg_inactive = scheme.get_tab_inactive_bg(config),

		text_active = scheme.get_tab_active_fg(config),
		text_inactive = scheme.get_tab_inactive_fg(config),

		nvim_fallback = {
			bg = "#57A143",
			fg = "#ffffff",
		},

		decorations = {
			first_left = "",
			first_right = "",
			middle_left = "",
			middle_right = "",
			last_left = "",
			last_right = "",
		},

		transparent = "rgba(0,0,0,0.0)",
	}
end
