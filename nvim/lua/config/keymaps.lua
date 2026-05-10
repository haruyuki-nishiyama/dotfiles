local map = vim.keymap.set

-- ================================================================
-- Clipboard (sync with system clipboard)
-- ================================================================

map({ "n", "v" }, "y", '"+y')
map({ "n", "v" }, "p", '"+p')

-- ================================================================
-- Search
-- ================================================================

map("n", "<Esc>", "<cmd>noh<CR>")

-- ================================================================
-- Navigation (keep cursor centered after scroll)
-- ================================================================

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", function()
	if vim.fn.getreg("/") ~= "" then
		vim.cmd("normal! nzzzv")
	else
		vim.cmd("normal! n")
	end
end)

map("n", "N", function()
	if vim.fn.getreg("/") ~= "" then
		vim.cmd("normal! Nzzzv")
	else
		vim.cmd("normal! N")
	end
end)

-- Preserve cursor position when joining lines
map("n", "J", "mzJ`z")

-- ================================================================
-- Move lines
-- ================================================================

map("v", "<M-j>", ":m '>+1<CR>gv=gv")
map("v", "<M-k>", ":m '<-2<CR>gv=gv")
map("n", "<M-j>", ":m .+1<CR>==")
map("n", "<M-k>", ":m .-2<CR>==")

-- ================================================================
-- Buffers -- <leader>b
-- ================================================================

map("n", "<leader>bd", vim.cmd.bdelete)
map("n", "<leader>bn", vim.cmd.bnext)
map("n", "<leader>bp", vim.cmd.bprevious)

-- ================================================================
-- Fzf-lua -- <leader>f (find)
-- ================================================================

local fzf = require("fzf-lua")

map("n", "<leader>ff", fzf.files)
map("n", "<leader>fg", fzf.live_grep)
map("n", "<leader>fb", fzf.buffers)
map("n", "<leader>fh", fzf.help_tags)
map("n", "<leader>fr", fzf.oldfiles) -- recent files
map("n", "<leader>fs", fzf.grep_cword) -- word under cursor

-- ================================================================
-- LSP: jump -- <leader>g (go to)
-- ================================================================

map("n", "<leader>gd", vim.lsp.buf.definition)
map("n", "<leader>gr", vim.lsp.buf.references)
map("n", "<leader>gi", vim.lsp.buf.implementation)
map("n", "<leader>gt", vim.lsp.buf.type_definition)
map("n", "<leader>gD", vim.lsp.buf.declaration)

-- ================================================================
-- LSP: actions -- <leader>c (code)
-- ================================================================

map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>cr", vim.lsp.buf.rename)
map("n", "<leader>cf", vim.lsp.buf.format)
map("n", "<leader>ck", vim.lsp.buf.hover)
map("n", "<leader>ch", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- ================================================================
-- Diagnostics -- <leader>d
-- ================================================================

map("n", "<leader>dd", vim.diagnostic.open_float)
map("n", "<leader>dl", vim.diagnostic.setloclist)

map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)

-- ================================================================
-- File explorer (oil.nvim)
-- ================================================================

map("n", "<leader>e", function()
	require("oil").open()
end)
