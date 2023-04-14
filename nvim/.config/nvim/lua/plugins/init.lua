return {
		------------------------ already added to configs stuff-----------------------------------------------------
		--lsp stuff---------------
		-- "neovim/nvim-lspconfig",
		-- "williamboman/mason-lspconfig.nvim",
		-- 'j-hui/fidget.nvim',
		-- 'folke/neodev.nvim',
		-- "hrsh7th/nvim-cmp",
		-- dependencies = {
		-- 		"hrsh7th/cmp-nvim-lsp",
		-- 		"hrsh7th/cmp-buffer",
		-- 		"hrsh7th/cmp-path",
		-- 		"hrsh7th/cmp-cmdline",
		-- 		'saadparwaiz1/cmp_luasnip' ,
		-- 		"L3MON4D3/LuaSnip",
		-- 		{'rafamadriz/friendly-snippets'},
		-- },

		----- ui stuff---------------------------- 
		"lewis6991/gitsigns.nvim",
		"akinsho/toggleterm.nvim", 
		"goolord/alpha-nvim",
		-- "RRethy/vim-illuminate",
		-- "lukas-reineke/indent-blankline.nvim",
		-- "echasnovski/mini.indentscope",
		-- "folke/noice.nvim",
		-- "nvim-neo-tree/neo-tree.nvim",
		-- "nvim-orgmode/orgmode", -- note taking stuff
		-- "nvim-telescope/telescope.nvim",
		-- "nvim-lua/popup.nvim",
		-- "nvim-lua/plenary.nvim",

		-------------------- previously present stuff ---------------------------------
		"LazyVim/LazyVim",
		"tpope/vim-commentary",
		{ "tpope/vim-surround", lazy = true },
		{ "tpope/vim-fugitive", lazy = true },
		{ "nvim-orgmode/orgmode", lazy = true },
		{
				"iamcco/markdown-preview.nvim",
				lazy = true,
				build = "cd app && npm install",
				setup = function()
						vim.g.mkdp_filetypes = { "markdown" }
						ft = { "markdown" }
				end,
		},
		"folke/zen-mode.nvim",
		"junegunn/limelight.vim",
		"junegunn/goyo.vim",
		"ThePrimeagen/vim-be-good",
		{
				"mbbill/undotree",
				lazy = true,
				cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
		},
		{ "szw/vim-maximizer", lazy = true },
		{
				"nvim-tree/nvim-tree.lua", -- File browser
				dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{ "gruvbox-community/gruvbox", lazy = true },

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
