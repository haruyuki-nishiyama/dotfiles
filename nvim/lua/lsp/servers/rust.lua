local on_attach = require("lsp.on_attach").on_attach

-- ================================================================
-- rust-analyzer
-- ================================================================

vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,

	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				buildScripts = true,
			},

			checkOnSave = true,
			check = { command = "clippy" },
			procMacro = { enable = true },
		},
	},
})

vim.lsp.enable("rust_analyzer")
