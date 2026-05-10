return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },

		config = function()
			require("ibl").setup({
				indent = {
					char = "│",

					highlight = {
						"RainbowRed",
						"RainbowYellow",
						"RainbowBlue",
						"RainbowGreen",
						"RainbowPurple",
					},
				},

				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
				},

				exclude = {
					filetypes = { "help", "dashboard", "NvimTree" },
				},
			})
		end,
	},
}
