-- ================================================================
-- LSP attach
-- ================================================================

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf

		-- Use LSP as tagfunc backend for definition jumps
		vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"

		-- Enable inlay hints if the server supports them
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,
})
