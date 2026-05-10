-- config/theme/lang.lua
local scheme = require("config.theme.colorscheme")
local M = {}

function M.get(config)
	local s = scheme.get_scheme(config)
	local ansi = s.ansi or {}
	local brights = s.brights or {}

	local function entry(bg, fg)
		return { bg = bg or "#333333", fg = fg or "#ffffff" }
	end

	return {
		lua = entry(ansi[5], "#ffffff"), -- blue
		rs = entry(ansi[2], "#ffffff"), -- red
	}
end

return M
