local M = {}

local sep = package.config:sub(1, 1)
local sep_pattern = "[^" .. sep .. "]+"

local trim_cache = { size = 0 }
local CACHE_LIMIT = 128

function M.trim_path(path, max_len)
	local cache_key = path .. "\t" .. max_len
	if trim_cache[cache_key] then
		return trim_cache[cache_key]
	end

	if trim_cache.size >= CACHE_LIMIT then
		trim_cache = { size = 0 }
	end

	local parts = {}
	for part in path:gmatch(sep_pattern) do
		parts[#parts + 1] = part
	end

	local result = ""
	for i = #parts, 1, -1 do
		local candidate = #result > 0 and (parts[i] .. sep .. result) or parts[i]

		if #candidate <= max_len then
			result = candidate
		else
			break
		end
	end

	trim_cache[cache_key] = result
	trim_cache.size = (trim_cache.size or 0) + 1
	return result
end

function M.normalize_path(p)
	if not p then
		return ""
	end
	return p:gsub("^file://[^/]*/", ""):gsub("^/", "")
end

return M
