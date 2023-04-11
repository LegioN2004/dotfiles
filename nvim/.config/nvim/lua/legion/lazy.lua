local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--put plugins here
require('lazy').setup({
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'tpope/vim-fugitive',
	'nvim-orgmode/orgmode',
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" }
			ft = { "markdown" }
		end
	},
	'jiangmiao/auto-pairs',
	{
		'nvim-treesitter/nvim-treesitter',
		build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	},
	'folke/zen-mode.nvim',
	'junegunn/limelight.vim',
	'junegunn/goyo.vim',
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	'ThePrimeagen/vim-be-good',
	'mbbill/undotree',
	'nvim-lualine/lualine.nvim',
	'lewis6991/gitsigns.nvim',
	'szw/vim-maximizer',
	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'gruvbox-community/gruvbox',
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		version = "nightly" -- optional, updated every week. (see issue #1193)
	},
	'junegunn/fzf',
	'junegunn/fzf.vim',
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
