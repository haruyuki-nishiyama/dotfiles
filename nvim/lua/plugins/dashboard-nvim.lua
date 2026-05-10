return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",

		config = function()
			require("dashboard").setup({
				theme = "doom",

				config = {
					header = {
						"                                   __                   ",
						"  ___       __     ___    __  __  /\\_\\     ___ ___      ",
						" /' _`\\   /'__`\\  / __`\\ /\\ \\/\\ \\ \\/\\ \\  /' __` __`\\    ",
						"/\\ \\/\\ \\ /\\  __/ /\\ \\L\\ \\\\ \\ \\_/ | \\ \\ \\ /\\ \\/\\ \\/\\ \\   ",
						"\\ \\_\\ \\_\\\\ \\____\\\\ \\____/ \\ \\___/   \\ \\_\\\\ \\_\\ \\_\\ \\_\\  ",
						" \\/_/\\/_/ \\/____/ \\/___/   \\/__/     \\/_/ \\/_/\\/_/\\/_/  ",
						"                                                        ",
					},

					center = {
						{ icon = " ", desc = "New File", action = "ene | startinsert" },
						{ icon = " ", desc = "Find File", action = "FzfLua files" },
						{ icon = " ", desc = "Recent Files", action = "FzfLua oldfiles" },
					},

					recent_files = {
						enable = true,
						limit = 5,
						cwd_only = false,
					},
				},
			})
		end,
	},
}
