-- ================================================================
-- Indent colors (paired with indent-blankline)
-- ================================================================

vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#e06c75" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#e5c07b" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98c379" })
vim.api.nvim_set_hl(0, "RainbowPurple", { fg = "#c678dd" })

-- ================================================================
-- Cursor line
-- ================================================================

vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

vim.api.nvim_set_hl(0, "CursorLineNr", {
	fg = "#f5e2b8",
	bold = true,
})
