local fn = vim.fn

vim.cmd [[packadd packer.nvim]]

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
		PACKER_BOOTSTRAP = fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
		})
		print("Installing packer close and reopen Neovim...")
		vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
		print("Packer is not installed")
		return
end

-- Have packer use a popup window
packer.init({
		display = {
				open_fn = function()
						return require("packer.util").float({ border = "rounded" })
				end,
		},
})

return require('packer').startup(function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		use {
				'nvim-telescope/telescope.nvim', tag = '0.1.2',
				-- or                            , branch = '0.1.x',
				requires = { {'nvim-lua/plenary.nvim'} }
		}
		use { 'svrana/neosolarized.nvim' }
		use { "ellisonleao/gruvbox.nvim" }
		use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
		use { 'theprimeagen/harpoon' }
		use { 'mbbill/undotree' }
		use { 'tpope/vim-fugitive' }
		use {
				'VonHeikemen/lsp-zero.nvim',
				branch = 'v1.x',
				requires = {
						-- LSP Support
						{'neovim/nvim-lspconfig'},
						{'williamboman/mason.nvim'},
						{'williamboman/mason-lspconfig.nvim'},

						-- Autocompletion
						{'hrsh7th/nvim-cmp'},
						{'hrsh7th/cmp-buffer'},
						{'hrsh7th/cmp-path'},
						{'saadparwaiz1/cmp_luasnip'},
						{'hrsh7th/cmp-nvim-lsp'},
						{'hrsh7th/cmp-nvim-lua'},

						-- Snippets
						{'L3MON4D3/LuaSnip'},
						{'rafamadriz/friendly-snippets'},
				}
		}

		-- Lazy loading:
		-- Load on specific commands
		-- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
		-- Load on an autocommand event
		-- use {'andymass/vim-matchup', event = 'VimEnter'}
		-- Load on a combination of conditions: specific filetypes or commands
		-- Also run code after load (see the "config" key)
end)
