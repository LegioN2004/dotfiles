set relativenumber
set tabstop=4
set autoindent
set number
set splitbelow
set splitright
set nowritebackup
set noswapfile
set nobackup
"set clipboard=unnamed,unnamedplus
set mouse=a
set guifont=Hack\ NF:h12:cANSI
set hls
set is
set sw=4	
set si	

"8.2 Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64

        function! CHANGE_CURR_DIR()
            let _dir = expand("%:p:h")
            exec "cd " . _dir
            unlet _dir
        endfunction

"some keybinds for convenience
let mapleader = " "
nmap tw :w!<cr>
nmap twq :wq!<cr>
nmap ts  :so %<cr>
nmap tq :q!<cr>
nmap ts :so %<cr>
vnoremap <C-c> "*y

"some windows keybinds
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap tn :tabnew<Return><C-w>w

"tab movement
nmap <tab> :tabnext<Return>
nmap <S-tab> :tabprevious<Return>
" nmap <leader> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sl <C-w>l
map sj <C-w>j
map sk <C-w>k

"for resizing windows 
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-


"neovide stuff
if exists("g:neovide")   " Put anything you want to happen only in Neovide here
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	let g:neovide_transparency=0.8
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	" let g:neovide_cursor_vfx_mode = "railgun"
	let g:neovide_remember_window_size = v:true
endif
								
call plug#begin('C:/Users/sunny/AppData/Local/nvim-data/site/autoload')
Plug 'tpope/vim-commentary'
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

colorscheme gruvbox

lua <<EOF
require('lualine').setup()
EOF
