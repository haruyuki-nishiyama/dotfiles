return {
	"stevearc/conform.nvim",
	event = "BufWritePre",

	config = function()
		require("conform").setup({
			-- ================================================================
			-- Formatters (LSP formatting disabled via on_attach)
			-- ================================================================

			formatters_by_ft = {
				rust = { "rustfmt" },
				lua = { "stylua" },
			},

			format_on_save = {
				lsp_fallback = false,
			},
		})
	end,
}
