return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",

		delay = 100,

		show_help = true,
		showkeys = true,

		icons = {
			mappings = true,
			keys = {
				Up = "↑",
				Down = "↓",
				Left = "←",
				Right = "→",
			},
		},
	},
}
