return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},

		config = function()
			local cmp = require("cmp")
			local cmp_types = require("cmp.types")
			local luasnip = require("luasnip")

			-- ================================================================
			-- Keymaps
			-- ================================================================

			local mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<CR>"] = cmp.mapping.confirm({ select = true }),
			})

			-- ================================================================
			-- Setup
			-- ================================================================

			cmp.setup({
				completion = {
					autocomplete = { cmp_types.cmp.TriggerEvent.TextChanged },
				},

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = mapping,

				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "luasnip" },
				},

				window = {
					completion = cmp.config.window.bordered({ border = "rounded" }),
					documentation = cmp.config.window.bordered({ border = "rounded" }),
				},

				experimental = {
					ghost_text = true,
				},
			})
		end,
	},
}
