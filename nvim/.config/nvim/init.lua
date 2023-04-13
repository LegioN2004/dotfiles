require("config.lazy")
require("config.macros")
-- lazy stuff
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.autocmds")
		require("config.icons")
		require("config.keymaps")
		require("config.settings")
	end,
})

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_win = has("win32")
local is_mac = has("macunix")
-- local is_unix = has "Linux"

if is_mac then
	require("macos")
end

if is_win then
	require("windows")
end

-- if is_unix then
--     require('unix')
-- end

vim.cmd([[
let g:coc_node_path = '~/.nvm/versions/node/v18.15.0/bin/node'
let g:coc_npm_path = '~/.nvm/versions/node/v18.15.0/bin/node'
au! BufWritePost $MYVIMRC source %
]])
