return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			resume = true,

			defaults = {
				cwd_prompt = false,
			},

			-- ================================================================
			-- Fzf core options
			-- ================================================================

			fzf_opts = {
				["--no-multi"] = "",
				["--ansi"] = "",
				["--layout"] = "reverse",
				["--info"] = "inline",
				["--tiebreak"] = "end,length",
				["--keep-right"] = "",
			},

			-- ================================================================
			-- Files
			-- ================================================================

			files = {
				multiprocess = true,
				git_icons = true,
				file_icons = true,

				cmd = "fd --type f --hidden --follow --exclude .git --path-separator / --color=never",

				fzf_opts = {
					["--scheme"] = "path",
				},
			},

			-- ================================================================
			-- Grep
			-- ================================================================

			grep = {
				multiprocess = true,

				rg_opts = table.concat({
					"--column",
					"--line-number",
					"--no-heading",
					"--color=always",
					"--smart-case",
					"--max-columns=4096",
					"--path-separator=/",
					"--threads=0",
					"--no-ignore-parent",
					"-e",
				}, " "),
			},

			-- ================================================================
			-- Preview window
			-- ================================================================

			winopts = {
				preview = {
					layout = "flex",
					delay = 100,
					wrap = "nowrap",
					bufopts = {
						["buflisted"] = false,
						["bufhidden"] = "wipe",
					},
				},
			},

			-- ================================================================
			-- Previewers
			-- ================================================================

			previewers = {
				builtin = {
					syntax_limit_b = 51200,
					syntax_limit_l = 500,

					treesitter = {
						enabled = true,
						disabled = {},
					},
				},
			},
		})
	end,
}
