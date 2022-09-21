if vim.g.neovide == true then
    -- vim.cmd 'set guifont=Hack\ NF:h10'
    -- vim.o.guifont='Consolas:h10'
    -- vim.o.guifont='FiraCode NF:h14'
    -- vim.o.guifont='Hack NF:h12'
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end


vim.cmd([[
"font for neovide
set guifont=Hack\ NF:h12

"neovide stuff
if exists("g:neovide")   " Put anything you want to happen only in Neovide here
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	let g:neovide_transparency=0.8
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	let g:neovide_cursor_vfx_mode = "railgun"
	let g:neovide_remember_window_size = v:true
endif
]])