vim.cmd [[
if exists("&termguicolors") && exists ("&winblend")
syntax enable
set winblend=0
set wildoptions=pum
set pumblend=5
hi Normal ctermbg=NONE guibg=NONE
hi NormalNC ctermbg=NONE guibg=NONE
set termguicolors
colorscheme onedark
]]
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.opt.cursorline = true
vim.opt.background = 'dark'
