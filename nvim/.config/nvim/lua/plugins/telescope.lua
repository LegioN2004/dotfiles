return {
	"nvim-telescope/telescope.nvim",
	event = "BufEnter",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim", -- FZF algorithm for telescope
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
	},
	cmd = "Telescope",
	keys = {
		{
			"<leader><leader>",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find file",
		},
		{
			";r",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Grep directory",
		},
		{
			"<leader>?",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Grep current buffer",
		},
		{
			"<leader>;",
			function()
				require("telescope.builtin").command_history()
			end,
			desc = "Command history",
		},
		{
			"<leader>:",
			function()
				require("telescope.builtin").commands()
			end,
			desc = "Commands",
		},
		-- {
		-- 	"<leader>r",
		-- 	function()
		-- 		require("telescope.builtin").resume()
		-- 	end,
		-- 	desc = "Resume telescope",
		-- },
		{
			"<leader>bb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffer",
		},
		{
			"<leader>cs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Symbols in document",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Find previously opened file",
		},
		{
			"<leader>km",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Find the user defined keymaps",
		},
		-- {
		-- 	"<leader>fF",
		-- 	function()
		-- 		require("telescope").extensions.file_browser.file_browser({
		-- 			hidden = true,
		-- 			grouped = true,
		-- 			initial_mode = "normal",
		-- 		})
		-- 	end,
		-- 	desc = "Browse files",
		-- },
		{
			";h",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "NeoVim help tags",
		},
	},
	config = function()
		local telescope = require("telescope")
		local telescope_config = require("telescope.config")
		local actions = require("telescope.actions")

		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!.git/*")

		local trouble = require("trouble.providers.telescope")
		telescope.setup({
			defaults = {
				-- `hidden = true` is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						["<c-n>"] = actions.move_selection_next,
						["<c-p>"] = actions.move_selection_previous,
						["<c-t>"] = trouble.open_with_trouble,
						["<esc>"] = actions.close, -- Close on first press of esc. No "normal" mode.
					},
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
				-- Themeing
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
				},
			},
			-- extensions = {
			-- 	file_browser = { hijack_netrw = true },
			-- 	fzf = {
			-- 		fuzzy = true, -- false will only do exact matching
			-- 		override_generic_sorter = true, -- override the generic sorter
			-- 		override_file_sorter = true, -- override the file sorter
			-- 		case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- 	},
			-- 	},
		})
		-- telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
	end,

	-- enable passing arguments to the live_grep of telescope
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		lazy = true,
	},
}
