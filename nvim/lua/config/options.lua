local opt = vim.opt

-- ================================================================
-- Display
-- ================================================================

opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.termguicolors = true
opt.shellslash = true
opt.signcolumn = "yes"
opt.showtabline = 2
opt.title = true
opt.titlestring = "nvim %F"

-- ================================================================
-- Editing
-- ================================================================

opt.mouse = "a"
opt.shiftwidth = 2
opt.expandtab = true
opt.undofile = true
opt.whichwrap = "b,s,<,>,[,]"
opt.inccommand = "split"
opt.fileformats = { "unix", "dos" }
opt.fileformat = "unix"

-- ================================================================
-- Whitespace visualization
-- ================================================================

opt.list = true

opt.listchars = {
	space = "·",
	tab = "→ ",
	trail = "·",
}

-- ================================================================
-- Diagnostics
-- ================================================================

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	signs = true,
	update_in_insert = true,
})
