local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- the how it be paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- remember yanked
vim.keymap.set("v", "p", '"_dp', opts)

-- Yank to system clipboard with <leader>y (normal/visual)
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- leader d delete to blackhole (does not affect any register)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to blackhole (not yanked)" })

-- ctrl c as escape cuz Im lazy to reach up to the esc key
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
-- format without prettier using the built in
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Unmaps Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

--Stars new tmux session from in here
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

-- Executes shell command from in here making file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- tab stuff
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")   --open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
-- Tab movement (your file uses <TAB> and <S-TAB> for tabn/tabp, but not these)
vim.api.nvim_set_keymap("n", "<tab>", ":tabnext<Return>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-tab>", ":tabprevious<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tnt", "<cmd>tabnew %<CR>") --open current tab in new tab

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })

-- Remap space as leader key (already set in your file, but not this exact mapping)
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Increment / decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Delete a word backwards (your file deletes with 'dw', but not this mapping)
-- vim.keymap.set("n", "dw", 'vb"_d')

-- Select all text at once
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
vim.keymap.set("n", "<C-m>", "<C-i>", { noremap = true, silent = true })

-- Keybinds for easier saving and quitting
vim.api.nvim_set_keymap("n", "<leader>tw", ":w!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tq", ":q!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tqa", ":qa!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>twq", ":wq!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":so<CR>", { noremap = true, silent = true })


-- Buffer movement (not present)
vim.api.nvim_set_keymap("n", "<leader><tab>", ":bnext<Return>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><S-tab>", ":bprevious<Return>", { noremap = true, silent = true })

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Telescope and plugin keymaps (all below are not present in your file)
-- vim.keymap.set("n", "<leader>tu", "<cmd>Telescope undo<cr>")
-- vim.keymap.set("n", "<leader>/", "vim.NIL")
-- vim.keymap.set("n", "<leader>te", ":Telescope<CR>")
-- vim.keymap.set("n", "<leader>ps", function()
--   require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- vim.keymap.set("n", ";r", function()
--   require("telescope.builtin").live_grep()
-- end)
-- vim.keymap.set("n", "<leader>?", function()
--   require("telescope.builtin").current_buffer_fuzzy_find()
-- end)
-- vim.keymap.set("n", "<leader>;", function()
--   require("telescope.builtin").command_history()
-- end)
-- vim.keymap.set("n", "<leader>:", function()
--   require("telescope.builtin").commands()
-- end)
-- vim.keymap.set("n", "<leader>re", function()
--   require("telescope.builtin").resume()
-- end)
-- vim.keymap.set("n", "<leader>bb", function()
--   require("telescope.builtin").buffers()
-- end)
-- vim.keymap.set("n", "<leader>cs", function()
--   require("telescope.builtin").lsp_document_symbols()
-- end)
-- vim.keymap.set("n", "<leader>fr", function()
--   require("telescope.builtin").oldfiles()
-- end)
-- vim.keymap.set("n", "<leader>km", function()
--   require("telescope.builtin").keymaps()
-- end)
-- vim.keymap.set("n", "<leader>;h", function()
--   require("telescope.builtin").help_tags()
-- end)
-- vim.keymap.set("n", "<leader>fP", function()
--   require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
-- end)
-- vim.keymap.set("n", "<leader>;s", function()
--   require("telescope.builtin").treesitter()
-- end)
-- vim.keymap.set("n", "<leader>;d", function()
--   require("telescope.builtin").diagnostics()
-- end)


-- Auto save keymap
vim.api.nvim_set_keymap("n", "<leader>ast", ":ASToggle<CR>", {})
