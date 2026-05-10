local BG = "none"
local BORDER = "#565f89"

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			-- ================================================================
			-- Catppuccin setup
			-- ================================================================

			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,

				integrations = {
					telescope = true,
					treesitter = true,
					cmp = true,
					gitsigns = true,
					indent_blankline = { enabled = true },
				},
			})

			vim.cmd.colorscheme("catppuccin")

			-- ================================================================
			-- Transparency overrides
			-- ================================================================

			local overrides = {
				Normal = { bg = BG },
				NormalFloat = { fg = BORDER, bg = BG },
				FloatBorder = { fg = BORDER, bg = BG },
				SignColumn = { bg = BG },
				LineNr = { bg = BG },
				EndOfBuffer = { bg = BG },
				TelescopeBorder = { fg = BORDER, bg = BG },
			}

			for group, opts in pairs(overrides) do
				vim.api.nvim_set_hl(0, group, opts)
			end
		end,
	},
}
