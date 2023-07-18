return {
	-- main colorscheme
	-- solarized or gruvbox
	{
		"gruvbox-community/gruvbox",
		-- lazy = true,
	},
	{
		"svrana/neosolarized.nvim",
		dependencies = "tjdevries/colorbuddy.nvim",
		lazy = true,
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		keys = {
			{
				"<leader>cl",
				"<cmd>Telescope colorscheme enable_preview=true<cr>",
				desc = "Select Colorscheme with Preview",
			},
		},
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
		end,
	},

	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		keys = {
			{
				"<leader>cl",
				"<cmd>Telescope colorscheme enable_preview=true<cr>",
				desc = "Select Colorscheme with Preview",
			},
		},
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},

	-- vscode
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
		keys = {
			{
				"<leader>cl",
				"<cmd>Telescope colorscheme enable_preview=true<cr>",
				desc = "Select Colorscheme with Preview",
			},
		},
		config = function()
			require("vscode").setup({
				transparent = true,
			})
		end,
	},

	-- darcula (JetBrains Intellij IDEA default theme)
	{
		"briones-gabriel/darcula-solid.nvim",
		keys = {
			{
				"<leader>cl",
				"<cmd>Telescope colorscheme enable_preview=true<cr>",
				desc = "Select Colorscheme with Preview",
			},
		},
		dependencies = {
			{
				"rktjmp/lush.nvim",
			},
		},
	},
}
