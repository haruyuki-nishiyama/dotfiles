local merge = require("core.merge")

return function(config, mod)
	if type(mod) == "function" then
		mod(config)
	elseif type(mod) == "table" then
		merge(config, mod)
	end
end
