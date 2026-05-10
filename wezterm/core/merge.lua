return function(dst, src)
	for k, v in pairs(src) do
		if type(v) == "table" and type(dst[k]) == "table" then
			require("core.merge")(dst[k], v)
		else
			dst[k] = v
		end
	end
end
