-- go to last loc when opening a buffer
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 		callback = function()
-- 				local mark = vim.api.nvim_buf_get_mark(0, '"')
-- 				local lcount = vim.api.nvim_buf_line_count(0)
-- 				if mark[1] > 0 and mark[1] <= lcount then
-- 						pcall(vim.api.nvim_win_set_cursor, 0, mark)
-- 				end
-- 		end,
-- })

vim.api.nvim_create_autocmd("FileType", {
		pattern = { "gitcommit", "markdown", "org", "gitignore" },
		callback = function()
				vim.opt_local.wrap = true
				vim.opt_local.spell = true
		end,
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
		group = yank_group,
		pattern = "*",
		callback = function()
				vim.highlight.on_yank({
						higroup = "IncSearch",
						timeout = 40,
				})
		end,
})

--vim.cmd([[
--" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
--" set autochdir
--"autocmd BufEnter * call CHANGE_CURR_DIR()
--"function! CHANGE_CURR_DIR()
--"   let _dir = expand("%:p:h")
--"   exec "cd " . _dir
--"   unlet _dir
--"endfunction
--]]

-- close lazy panel with esc
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lazy",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end
})
