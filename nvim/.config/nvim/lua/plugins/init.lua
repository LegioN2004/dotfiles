return {
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
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	{ "gruvbox-community/gruvbox", lazy = true },

	-- { 'junegunn/fzf',              lazy = true },
	-- { 'junegunn/fzf.vim',          lazy = true },
	--   -- add telescope-fzf-native
	{
		"nvim-telescope/telescope.nvim",
	},
		  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
}
