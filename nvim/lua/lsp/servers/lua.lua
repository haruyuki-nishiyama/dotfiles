local on_attach = require("lsp.on_attach").on_attach
local capabilities = require("lsp.capabilities").capabilities

-- ================================================================
-- lua_ls
-- ================================================================

vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},

			diagnostics = {
				globals = { "vim" },
			},

			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},

			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

vim.lsp.enable("lua_ls")
