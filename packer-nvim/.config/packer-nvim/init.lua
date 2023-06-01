require('legion.plugins')
require('legion.alpha-startup')
--require('legion.onedark') -- this and neosolarized .lua files are req btw
--require('legion.neosolarized')
--require('legion.gruvbox') --use this sometimes not needed for the community edition of gruvbox
require('legion.lspconfig')
-- require('legion.lspkind')
require('legion.lspsaga')
require('legion.lualine')
require('legion.macros')
require('legion.nvim-tree')
require('legion.settings')
require('legion.keymaps')
require('legion.telescope')
require('legion.toggleterm')
require('legion.treesitter')
require('legion.gitsigns')

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_win = has "win32"
local is_mac = has "macunix"
-- local is_unix = has "Linux"

if is_mac then
	require('macos')
end

if is_win then
	require('windows')
end

-- if is_unix then
--     require('unix')
-- end
--
vim.cmd([[
let g:coc_node_path = '~/.nvm/versions/node/v18.15.0/bin/node'
let g:coc_npm_path = '~/.nvm/versions/node/v18.15.0/bin/node'
au! BufWritePost $MYVIMRC source %
]])
