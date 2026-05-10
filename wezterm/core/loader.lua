local apply = require("core.apply")

return function(config, modules)
	for _, mod in ipairs(modules) do
		apply(config, require(mod))
	end
end
