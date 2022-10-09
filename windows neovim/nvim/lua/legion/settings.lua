vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = false --Switch on search pattern highlighting.
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
-- vim.opt.expandtab = true
-- vim.opt.scrolloff = 10
-- vim.opt.shell = 'zsh'
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.breakindent = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- while finding files it also looks in the subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.ai = true -- always set autoindenting on
vim.opt.si = true -- smart indent
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cmdheight=2 --give more space for displaying messages.
vim.opt.smartindent = true
vim.opt.undofile = false
vim.opt.ruler = true
vim.opt.mouse = a
-- vim.opt.clipboard=unnamed,unnamedplus -- set clipboard to universal for easy copy/paste to diff apps
vim.opt.completeopt = menuone, noinsert, noselect --as required by nvim-cmp
vim.opt.hidden = true --This option allows you to switch between multiple buffers without saving a changed buffer
vim.opt.mousehide = true --Hide the mouse pointer while typing.
vim.opt.updatetime = 50 --updatetime

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = 'set nopaste'
})

vim.opt.formatoptions:append { 'r' }
-- vim.opt.signcolumn = yes
-- Undo and backup options
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false

-- copy to clipboard
-- vim.api.nvim_set_option("clipboard", "unnamedplus")

-- use mouse in neovim
vim.opt.mouse = a

-- Always change the directory to working directory of file in current buffer
vim.cmd([[
" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
autocmd BufEnter * call CHANGE_CURR_DIR()

function! CHANGE_CURR_DIR()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction

"neovide stuff
if exists("g:neovide")   " Put anything you want to happen only in Neovide here
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	let g:neovide_transparency=0.9
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	"let g:neovide_cursor_vfx_mode = "railgun"
	let g:neovide_remember_window_size = v:true
endif

]])

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
		group = yank_group,
		pattern = '*',
		callback = function ()
				vim.highlight.on_yank({
						higroup = 'IncSearch',
						timeout = 40,
				})
		end,
})
