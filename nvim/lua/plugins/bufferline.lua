return {
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",

		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
				},
			})
		end,
	},
}
