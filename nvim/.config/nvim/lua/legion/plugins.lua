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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--put plugins here
require('lazy').setup({
		'lewis6991/impatient.nvim',
		{
				"olimorris/onedarkpro.nvim",
				priority = 1000 -- Ensure it loads first
		},
		'nvim-lualine/lualine.nvim',
		{
				-- amongst your other plugins
				{'akinsho/toggleterm.nvim', version = "*", config = true}
		},
		'tjdevries/express_line.nvim',
		'j-hui/fidget.nvim',
		'ThePrimeagen/vim-be-good',
		'mbbill/undotree',
		'lewis6991/gitsigns.nvim',
		'szw/vim-maximizer',
		-- 'xolox/vim-session',
		-- 'xolox/vim-misc',
		-- bufferline
		'akinsho/bufferline.nvim',
		--colorscheme
		{
				'svrana/neosolarized.nvim',
				requires = { 'tjdevries/colorbuddy.nvim' }
		},
		--language specific stuff
		'tpope/vim-commentary',
		'tpope/vim-surround',
		'tpope/vim-fugitive',

		-- 'windwp/nvim-ts-autotag',
		'jiangmiao/auto-pairs',
		'kyazdani42/nvim-web-devicons',
		{
				'nvim-treesitter/nvim-treesitter',
				run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		},
		'nvim-lua/popup.nvim',
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
		-- not using the telescope file explorer doesn't show files like ide's i need to see them without entering the folder everytime
		-- instead this
		{
				'nvim-tree/nvim-tree.lua',
				requires = {
						'nvim-tree/nvim-web-devicons', -- optional, for file icons
				},
				tag = 'nightly' -- optional, updated every week. (see issue #1193)
		},
		'junegunn/fzf.vim',
		-- use = { 'junegunn/fzf', run = './install --bin', }
		{ 'neoclide/coc.nvim', branch = "release" },
		{
				'goolord/alpha-nvim',
				requires = { 'kyazdani42/nvim-web-devicons' },
				config = function()
						require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
				end
		},
})
