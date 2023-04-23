return {
	--	{
	--			"xiyaowong/transparent.nvim",
	--			lazy = false,
	--			config = function()
	--			require("transparent").setup {
	--			}
	--			end
	--	},

	------ ui for nvim-lsp progress ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("fidget").setup {
				-- window = {
				-- 	blend = 0 -- set 0 if using transparent background, otherwise set 100
				-- },
			}
		end
	},

	------ Neovim plugin to improve the default vim.ui interfaces ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"stevearc/dressing.nvim",
		event = "BufEnter",
		config = function()
			require("dressing").setup({
				input = {
					-- 	win_options = {
					-- 		winblend = 0,
					-- 	},
					-- },
					-- Set to false to disable the vim.ui.input implementation
					enabled = true,
					-- Default prompt string
					default_prompt = "Input:",
					-- Can be 'left', 'right', or 'center'
					title_pos = "left",
					-- When true, <Esc> will close the modal
					insert_only = true,
					-- When true, input will start in insert mode.
					start_in_insert = true,
					-- These are passed to nvim_open_win
					anchor = "SW",
					border = "rounded",
					-- 'editor' and 'win' will default to being centered
					relative = "cursor",
					-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
					prefer_width = 50,
					width = nil,
					-- min_width and max_width can be a list of mixed types.
					-- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
					max_width = { 140, 0.9 },
					min_width = { 20, 0.2 },
					buf_options = {},
					win_options = {
						-- Window transparency (0-100)
						winblend = 0,
						-- Disable line wrapping
						wrap = false,
						-- Indicator for when text exceeds window
						list = true,
						listchars = "precedes:…,extends:…",
						-- Increase this for more context when text scrolls off the window
						sidescrolloff = 0,
					},
					-- Set to `false` to disable
					mappings = {
						n = {
							["<Esc>"] = "Close",
							["<CR>"] = "Confirm",
						},
						i = {
							["<Esc>"] = "Close",
							["<CR>"] = "Confirm",
							["<Up>"] = "HistoryPrev",
							["<Down>"] = "HistoryNext",
						},
					},
					override = function(conf)
						-- This is the config that will be passed to nvim_open_win.
						-- Change values here to customize the layout
						return conf
					end,
					-- see :help dressing_get_config
					get_config = nil,
				},
				select = {
					-- Set to false to disable the vim.ui.select implementation
					enabled = true,
					-- Priority list of preferred vim.select implementations
					backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
					-- Trim trailing `:` from prompt
					trim_prompt = true,
					-- Options for telescope selector
					-- These are passed into the telescope picker directly. Can be used like:
					-- telescope = require('telescope.themes').get_ivy({...})
					telescope = nil,
					-- Options for fzf selector
					fzf = {
						window = {
							width = 0.5,
							height = 0.4,
						},
					},
					-- Options for nui Menu
					nui = {
						position = "50%",
						size = nil,
						relative = "editor",
						border = {
							style = "rounded",
						},
						buf_options = {
							swapfile = false,
							filetype = "DressingSelect",
						},
						win_options = {
							winblend = 10,
						},
						max_width = 80,
						max_height = 40,
						min_width = 40,
						min_height = 10,
					},
					-- Options for built-in selector
					builtin = {
						-- These are passed to nvim_open_win
						anchor = "NW",
						border = "rounded",
						-- 'editor' and 'win' will default to being centered
						relative = "editor",
						buf_options = {},
						win_options = {
							-- Window transparency (0-100)
							winblend = 10,
						},
						-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
						-- the min_ and max_ options can be a list of mixed types.
						-- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
						width = nil,
						max_width = { 140, 0.8 },
						min_width = { 40, 0.2 },
						height = nil,
						max_height = 0.9,
						min_height = { 10, 0.2 },
						-- Set to `false` to disable
						mappings = {
							["<Esc>"] = "Close",
							["<C-c>"] = "Close",
							["<CR>"] = "Confirm",
						},
						override = function(conf)
							-- This is the config that will be passed to nvim_open_win.
							-- Change values here to customize the layout
							return conf
						end,
					},
					-- Used to override format_item. See :help dressing-format
					format_item_override = {},
					-- see :help dressing_get_config
					get_config = nil,
				},
			})
		end
	},

	-- comments  ------
	{
		"tpope/vim-commentary",
		event = "VeryLazy",
		cmd = "Commentary",
	},
	------ auto pairs for brackets braces etc ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"jiangmiao/auto-pairs",
		event = "BufEnter",
	},
	--    {
	--        "windwp/nvim-autopairs",
	--       event = "InsertEnter",
	--       opts = {
	--           check_ts = true,
	--       },
	--       config = function(_, opts)
	--           require("nvim-autopairs").setup(opts)
	--
	--           --- setup for cmp
	--           local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	--           local cmp_status_ok, cmp = pcall(require, "cmp")
	--           if not cmp_status_ok then
	--               return
	--           end
	--           cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	--       end,
	--   },

	------ git signs ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "▎" },
				delete = { text = "-" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				-- stylua: ignore start
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>ghd", gs.diffthis, "Diff This")
				map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},

	------ references ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},

	------ indent guides for Neovim ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "nvim-tree", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},

	------ lualine status bar as well as noice for getting a floating inbuilt cmd line in nvim ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		opts = function()
			local icons = require("lazyvim.config").icons
			local function fg(name)
				return function()
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
					section_separators = { left = '', right = '' },
					component_separators = { left = '', right = '' },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_x = {
						{ "filetype", icon_only = true, separator = "  ", padding = { left = 1, right = 1 } },
					},
					lualine_c = {
						-- stylua: ignore
						{
							"filename",
							symbols = { separator = "  ", modified = "  ", readonly = "  ", unnamed = "  " }
						},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = fg("Special"),
						},
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
					},
					lualine_y = {
						-- stylua: ignore
						{
							function() return require("noice").api.status.command.get() end,
							cond = function()
								return package.loaded["noice"] and
										require("noice").api.status.command.has()
							end,
							color = fg("Statement")
						},
					},
					lualine_z = {
						-- function()
						-- 	return " " .. os.date("%r")
						-- end,
						{ "progress", separator = "",                   padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 1, right = 1 } },
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
				},
				extensions = { "neo-tree", "nvim-tree", "lazy", "fidget" },
			}
		end,
	},

	-- noicer ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = 'MunifTanjim/nui.nvim',
		opts = {
			lsp = {
					{ 'config.lsp.hover.enabled' } == false,
					{ 'config.lsp.signature.enabled' } == false,
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "notify",
					opts = {},
				},
				-- defaults for hover and signature help
				documentation = {
					view = "hover",
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		-- stylua: ignore
		keys = {
			{
				"<S-Enter>",
				function() require("noice").redirect(vim.fn.getcmdline()) end,
				mode = "c",
				desc =
				"Redirect Cmdline"
			},
			{
				"<leader>snl",
				function() require("noice").cmd("last") end,
				desc =
				"Noice Last Message"
			},
			{
				"<leader>snh",
				function() require("noice").cmd("history") end,
				desc =
				"Noice History"
			},
			{
				"<leader>sna",
				function() require("noice").cmd("all") end,
				desc =
				"Noice All"
			},
			-- {
			-- 	"<c-f>",
			-- 	function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
			-- 	silent = true,
			-- 	expr = true,
			-- 	desc =
			-- 	"Scroll forward",
			-- 	mode = {
			-- 		"i", "n", "s" }
			-- },
			-- {
			-- 	"<c-b>",
			-- 	function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
			-- 	silent = true,
			-- 	expr = true,
			-- 	desc =
			-- 	"Scroll backward",
			-- 	mode = {
			-- 		"i", "n", "s" }
			-- },
		},
	},

	---- notifications when using nvim-notify
	{
		-- local started = false,
		"rcarriga/nvim-notify",
	keys = {
    {
      "<leader>xn",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Delete all Notifications",
    },
	},
		config = function()
			vim.notify = function(msg, level, opts)
				if not started then
					require("notify").setup({
						background_colour = "#d79921",
						timeout = 3500,
						render = "minimal",
						stages = "static",
					})
				end

				msg = vim.trim(msg)

				if msg ~= "" then
					local filename = vim.trim(vim.fn.expand("%:t"))

					if filename ~= "" then
						filename = filename .. ": "
					end

					msg = " " .. filename .. msg

					require("notify")(msg, level, opts)
				end
			end
		end,
		version = "*",
		event = "VeryLazy",
	},

	------ file browser ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"nvim-tree/nvim-tree.lua", -- File browser
		event = "BufEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		config = function()
			local icons = require("config.icons").git
			require("nvim-tree").setup({
on_attach = on_attach,
				view = {
					mappings = {
						custom_only = false,
						list = {
							-- keys = {
							-- 	{ ";f", ":NvimTreeToggle<CR>", desc = "Toggle file tree" },
							-- 	{ "<leader>;f", ":NvimTreeFindFileToggle<CR>", desc = "Toggle file tree at current buffer" },
							-- },
							-- user mappings go here
							{ key = { "l" }, action = "edit" }, -- Open node with l
							{ key = { "h" }, action = "close_node" }, -- Close node with h
							{
								key = { "o" },                   -- Close the tree when opening node with "o"
								action = "edit_and_close",
								action_cb = function()
									local api = require("nvim-tree.api")
									api.node.open.edit()
									api.tree.close()
								end,
							},
						},
					},
				},
				renderer = {
					highlight_opened_files = "name",
					indent_markers = {
						enable = true,
					},
					icons = {
						git_placement = "after",
						glyphs = {
							git = {
								unstaged = icons.FileUnstaged,
								staged = icons.FileStaged,
								unmerged = icons.FileUnmerged,
								renamed = icons.FileRenamed,
								untracked = icons.FileUntracked,
								deleted = icons.FileDeleted,
								ignored = icons.FileIgnored,
							},
						},
					},
				},
				hijack_netrw = true,
				filters = {
					dotfiles = false,
					git_clean = false,
					no_buffer = false,
				},
				actions = { open_file = { quit_on_open = false } },
				update_focused_file = {
					enable = true,
				},
			})
		end,
	},

	-------- neo-tree file explorer -----------------------------
	-- {
	--   "nvim-neo-tree/neo-tree.nvim",
	--   cmd = "Neotree",
	--   keys = {
	--     {
	--       ";f",
	--       function()
	--         require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
	--       end,
	--       desc = "Explorer NeoTree (root dir)",
	--     },
	--     {
	--       ";F",
	--       function()
	--         require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
	--       end,
	--       desc = "Explorer NeoTree (cwd)",
	--     },
	--     -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
	--     -- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
	--   },
	--   deactivate = function()
	--     vim.cmd([[Neotree close]])
	--   end,
	--   init = function()
	--     vim.g.neo_tree_remove_legacy_commands = 1
	--     if vim.fn.argc() == 1 then
	--       local stat = vim.loop.fs_stat(vim.fn.argv(0))
	--       if stat and stat.type == "directory" then
	--         require("neo-tree")
	--       end
	--     end
	--   end,
	--   opts = {
	--     filesystem = {
	--       bind_to_cwd = false,
	--       follow_current_file = true,
	--     },
	--     window = {
	--       mappings = {
	--         ["<space>"] = "none",
	--       },
	--     },
	--     default_component_configs = {
	--       indent = {
	--         with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
	--         expander_collapsed = "",
	--         expander_expanded = "",
	--         expander_highlight = "NeoTreeExpander",
	--       },
	--     },
	--   },
	-- },

	------ floating terminal for better reach ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		event = VeryLazy,
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		-- keys = {
		-- 	{ "<C-\>", ":ToggleTerm<CR>", silent = true, desc = "Toggle terminal" },
		-- 	-- { "<leader>L", ":ToggleTermToggleAll<CR>", silent = true, desc = "Toggle all terminals" },
		-- },
		opts = {
			direction = "float",
			size = 20,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
		--     function _G.set_terminal_keymaps()
		--         local opts = { noremap = true }
		--         vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		--         vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		--     end

		--     vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		--     local Terminal = require("toggleterm.terminal").Terminal
		--     local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		--     function _LAZYGIT_TOGGLE()
		--         lazygit:toggle()
		--     end

		--     local node = Terminal:new({ cmd = "node", hidden = true })

		--     function _NODE_TOGGLE()
		--         node:toggle()
		--     end

		--     local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

		--     function _NCDU_TOGGLE()
		--         ncdu:toggle()
		--     end

		--     local htop = Terminal:new({ cmd = "htop", hidden = true })

		--     function _HTOP_TOGGLE()
		--         htop:toggle()
		--     end

		--     local python = Terminal:new({ cmd = "python", hidden = true })

		--     function _PYTHON_TOGGLE()
		--         python:toggle()
		--     end
	},

	------ which-key ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	------limelight and goyo---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		"junegunn/limelight.vim",
		event = VeryLazy,
		cmd = "Limelight",
	},

	-- Distraction-free coding for Neovim
	{
		"folke/zen-mode.nvim",
		event = VeryLazy,
		cmd = "ZenMode",
		config = function()
			vim.api.nvim_set_hl(0, 'ZenBg', { ctermbg = 0 })
		end
	},

	{
		"szw/vim-maximizer",
		event = VeryLazy,
		cmd = { "MaximizerToggle" },
		keys = {
			{ "<leader>mt", ":MaximizerToggle<CR>", desc = "Toggle file tree" },
		},
		config = function()
			vim.api.nvim_set_hl(0, 'ZenBg', { ctermbg = 0 })
		end
	},

	-- Getting you where you want with the fewest keystrokes
	{
		"ThePrimeagen/harpoon",
		event = VeryLazy,
		cmd = "Harpoon",
		keys = {
			{ "<leader>Ha", function() require("harpoon.ui").toggle_quick_menu() end, mode = "n", desc = "Harpoon Menu" },
			{
				"<leader>ad",
				function() require("harpoon.mark").add_file() end,
				mode = "n",
				desc =
				"Harpoon Add File"
			},
			{
				"<leader>1",
				function() require("harpoon.ui").nav_file(1) end,
				mode = "n",
				desc =
				"Harpoon Nav File 1"
			},
			{
				"<leader>2",
				function() require("harpoon.ui").nav_file(2) end,
				mode = "n",
				desc =
				"Harpoon Nav File 2"
			},
			{
				"<leader>3",
				function() require("harpoon.ui").nav_file(3) end,
				mode = "n",
				desc =
				"Harpoon Nav File 3"
			},
			{
				"<leader>4",
				function() require("harpoon.ui").nav_file(4) end,
				mode = "n",
				desc =
				"Harpoon Nav File 4"
			},
		},
		config = function()
			vim.api.nvim_create_autocmd({ "Filetype" }, {
				pattern = "harpoon",
				callback = function()
					vim.opt.cursorline = true
					vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
					vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
				end
			})
		end
	},
}
