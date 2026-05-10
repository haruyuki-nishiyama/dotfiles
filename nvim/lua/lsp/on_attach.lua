local M = {}

-- ================================================================
-- Disable LSP formatting in favor of conform.nvim
-- ================================================================

function M.on_attach(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	vim.bo[bufnr].formatexpr = nil
end

return M
