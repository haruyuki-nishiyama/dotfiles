local M = {}

-- ================================================================
-- LSP capabilities extended with nvim-cmp completion
-- ================================================================

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
