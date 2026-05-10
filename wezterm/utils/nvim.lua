local M = {}

function M.is_nvim(title)
	return title and title:match("^nvim") ~= nil
end

function M.get_nvim_color(title)
	if not M.is_nvim(title) then
		return nil
	end

	local lang = require("utils.lang")
	return lang.get_lang_color(title)
end

return M
