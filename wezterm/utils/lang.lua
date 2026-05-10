local M = {}

function M.get_lang_color(title, config)
	local lang_colors = require("config.theme.lang").get(config)
	local ext = title:match("%.([%w]+)%s*$") or title:match("%.([%w]+)")
	if not ext then
		return nil
	end
	return lang_colors[ext:lower()]
end

return M
