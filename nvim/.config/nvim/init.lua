require('legion.alpha')
require('legion.settings')
require('legion.plugins')
require('legion.keymaps')
require('legion.hightlights')
require('legion.macros')
require('legion.neosolarized')
require('legion.lualine')
require('legion.treesitter')
require('legion.telescope')
require('legion.coc')
require('legion.impatient')
require('legion.gitsigns')
require('legion.toggleterm')
require('legion.nvim-tree')
-- require('legion.elbytj')
-- require('legion.ts-autotags')
-- require('legion.bufferline')
-- require('legion.lspconfig')
-- require('legion.neovide')
-- require('legion.colorscheme')

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
vim.cmd([[let g:coc_node_path = '~/.nvm/versions/node/v18.14.0/bin/node']])
vim.cmd([[let g:coc_npm_path = '~/.nvm/versions/node/v18.14.0/bin/node']])
