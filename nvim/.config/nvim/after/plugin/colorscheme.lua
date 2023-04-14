vim.cmd([[
syntax enable
set winblend=0
set wildoptions=pum
set pumblend=5
set termguicolors
set cursorline
set background=dark
colorscheme gruvbox
"hi Normal ctermbg=NONE guibg=NONE
"hi NormalNC ctermbg=NONE guibg=NONE
"hl FloatBorder  ctermfg=NONE ctermbg=NONE guibg=NONE
]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
