return {
	-- lua library for neovim
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- commenting
	-- {
	-- 	"numToStr/Comment.nvim",
	-- 	config = function()
	-- 		require("Comment").setup()
	-- 	end,
	-- },

	-- folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.o.foldcolumn = "0" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set("n", "<leader>fo", require("ufo").openAllFolds)
			vim.keymap.set("n", "<leader>fc", require("ufo").closeAllFolds)

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},

	-- auto detect indent
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup()
		end,
	},

	-- git wrapper
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		config = function()
		end,
	},

	-- displays a popup with possible keybindings of the command
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.timeoutlen = 300
			require("which-key").setup({
				plugins = {
					presets = {
						g = false,
					},
				},
				window = {
					border = "single",
				},
			})
		end,
	},
	--------------- previously present stuff ------------------------------------------------------------------------------
	"goolord/alpha-nvim",
	"LazyVim/LazyVim",
	-- "tpope/vim-commentary",
	{ "tpope/vim-surround",       lazy = true },
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
			ft = { "markdown" }
		end,
	},

	{
		"ThePrimeagen/vim-be-good",
		event = VeryLazy,
		cmd = "VimBeGood",
	},

	{
		"mbbill/undotree",
		event = VeryLazy,
		cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
	},

	{ "gruvbox-community/gruvbox" },

	-- { 'junegunn/fzf',              lazy = true },
	-- { 'junegunn/fzf.vim',          lazy = true },

	-- search/replace in multiple files
	{
		"windwp/nvim-spectre",
		-- stylua: ignore
		keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},
}
