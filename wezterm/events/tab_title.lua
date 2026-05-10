local wezterm = require("wezterm")
local path = require("utils.path")
local nvim = require("utils.nvim")
local lang = require("utils.lang")
local make_theme = require("config.theme.tab")

return function(config)
	local theme = make_theme(config)

	wezterm.on("format-tab-title", function(tab, tabs, _, _, _, max_width)
		local is_active = tab.is_active
		local title = tab.active_pane.title

		local color = nil

		if nvim.is_nvim(title) then
			color = lang.get_lang_color(title, config) or theme.nvim_fallback
		else
			color = lang.get_lang_color(title, config)
		end

		if not color then
			color = {
				bg = theme.bg_active,
				fg = theme.text_active,
			}
		end

		local bg = is_active and color.bg or theme.bg_inactive
		local fg = is_active and color.fg or theme.text_inactive

		local cwd = tab.active_pane.current_working_dir
		local cwd_str = cwd and path.trim_path(path.normalize_path(cwd.file_path), max_width - 4) or ""
		local text = wezterm.truncate_right(cwd_str, max_width - 4)

		local d = theme.decorations
		local is_first = tab.tab_index == 0
		local is_last = tab.tab_index == #tabs - 1

		local left = is_first and d.first_left or is_last and d.last_left or d.middle_left
		local right = is_first and d.first_right or is_last and d.last_right or d.middle_right

		return {
			{ Background = { Color = theme.transparent } },
			{ Foreground = { Color = bg } },
			{ Text = left },

			{ Background = { Color = bg } },
			{ Foreground = { Color = fg } },
			{ Text = " " .. text .. " " },

			{ Background = { Color = theme.transparent } },
			{ Foreground = { Color = bg } },
			{ Text = right },
		}
	end)
end
