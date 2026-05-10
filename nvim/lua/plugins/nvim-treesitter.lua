return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },

		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = { "lua", "vim", "rust", "toml" },

				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
