-- Persistent VS Code-style bottom terminal toggle
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
	bottom = {
		buf = -1,
		win = -1,
	},
}

local function create_bottom_window(opts)
	opts = opts or {}
	local height = opts.height or math.max(10, math.floor(vim.o.lines * 0.3))

	local buf
	if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win = vim.api.nvim_open_win(buf, true, {
		split = "below",
		win = -1,
		height = height,
	})

	vim.wo[win].number = false
	vim.wo[win].relativenumber = false
	vim.wo[win].signcolumn = "no"
	vim.wo[win].winfixheight = true

	return { buf = buf, win = win }
end

local pop_terminal = function()
	if not vim.api.nvim_win_is_valid(state.bottom.win) then
		state.bottom = create_bottom_window({ buf = state.bottom.buf })
		if vim.bo[state.bottom.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end

		vim.api.nvim_set_current_win(state.bottom.win)
		vim.cmd("startinsert!")
	else
		vim.api.nvim_win_hide(state.bottom.win)
	end
end

vim.api.nvim_create_user_command("Terminalpop", pop_terminal, {})

vim.keymap.set({ "n", "t" }, "<space>/", pop_terminal, { desc = "Toggle bottom terminal" })
