require('legion.alpha')
require('legion.settings')
require('legion.plugins')
require('legion.keymaps')
require('legion.hightlights')
-- require('legion.cmp')
-- require('legion.macros')
require('legion.neosolarized')
require('legion.lualine')
require('legion.treesitter')
-- require('legion.ts-autotags')
require('legion.telescope')
require('legion.bufferline')
-- require('legion.lspconfig')
require('legion.neovide')
require('legion.coc')
-- require('legion.gruvbox')
-- require('legion.colorscheme')
-- require('legion.onedark')
-- require('legion.lspkind')


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
vim.cmd([[let g:coc_node_path = '~/.nvm/versions/node/v19.0.0/bin/node']])
vim.cmd([[let g:coc_npm_path = '~/.nvm/versions/node/v19.0.0/bin/node']])
