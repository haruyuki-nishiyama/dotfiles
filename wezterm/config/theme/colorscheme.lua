local wezterm = require("wezterm")
local chached_scheme = nil

local M = {}

local function get_scheme_name(config)
	return config.color_scheme or "Builtin Solarized Dark"
end

function M.get_scheme(config)
	if not chached_scheme then
		local schemes = wezterm.color.get_builtin_schemes()
		chached_scheme = schemes[get_scheme_name(config)]
	end
	return chached_scheme
end

local function pick(t, key, fallback)
	return (t and t[key]) or fallback
end

-- -------- Public API --------

function M.get_bg(config)
	local s = M.get_scheme(config)
	return pick(s, "background", "#000000")
end

function M.get_fg(config)
	local s = M.get_scheme(config)
	return pick(s, "foreground", "#ffffff")
end

function M.get_tab_active_bg(config)
	local s = M.get_scheme(config)
	return pick(s.tab_bar and s.tab_bar.active_tab, "bg_color", M.get_bg(config))
end

function M.get_tab_active_fg(config)
	local s = M.get_scheme(config)
	return pick(s.tab_bar and s.tab_bar.active_tab, "fg_color", M.get_fg(config))
end

function M.get_tab_inactive_bg(config)
	local s = M.get_scheme(config)
	return pick(s.tab_bar and s.tab_bar.inactive_tab, "bg_color", M.get_bg(config))
end

function M.get_tab_inactive_fg(config)
	local s = M.get_scheme(config)
	return pick(s.tab_bar and s.tab_bar.inactive_tab, "fg_color", "#888888")
end

return M
