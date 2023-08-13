-- function ColorMyPencils(color)
		-- color = color or "gruvbox"
		-- vim.cmd.colorscheme(color)
-- 
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

vim.cmd [[
if exists("&termguicolors") && exists ("&winblend")
syntax enable
set winblend=0
set wildoptions=pum
set pumblend=10
set termguicolors
set cursorline
set background=dark
colorscheme gruvbox
hi Normal ctermbg=NONE guibg=NONE
hi NormalNC ctermbg=NONE guibg=NONE
]]
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
