return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim", -- FZF algorithm for telescope
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
          require("telescope").load_extension("fzf")
        end,
        -- "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        lazy = true,
      },
    },

    -- BUG: change the find_command i.e the stuff inside the function brackets if there are any performance related issues or stuff breaking or some unusual stuff
    -- I added fd , rg here to make the find_files and grep_string process faster as they use rust instead of traditional vimscript
    -- keys = {
    --   { "<leader>/", vim.NIL },
    --   { "<leader>te", ":Telescope<CR>", desc = "Toggle Telescope" },
    --   {
    --     "<leader>ps",
    --     function()
    --       require("telescope.builtin").grep_string({
    --         -- custom command to use rg/fd, need to add this to the function call or in the api call itself `{ find_command = { "rg", fname } }`,
    --         search = vim.fn.input("Grep > "),
    --       })
    --     end,
    --     desc = "Toggle Telescope grep",
    --   },
    --   {
    --     "<leader><space>",
    --     function()
    --       require("telescope.builtin").find_files()
    --     end,
    --     desc = "Find file",
    --   },
    --   {
    --     ";r",
    --     function()
    --       -- require("telescope.builtin").live_grep({ find_command = { "rg", fname } })
    --       require("telescope.builtin").live_grep()
    --     end,
    --     desc = "Grep directory",
    --   },
    --   {
    --     "<leader>?",
    --     function()
    --       require("telescope.builtin").current_buffer_fuzzy_find()
    --     end,
    --     desc = "Grep current buffer",
    --   },
    --   {
    --     "<leader>;",
    --     function()
    --       require("telescope.builtin").command_history()
    --     end,
    --     desc = "Command history",
    --   },
    --   {
    --     "<leader>:",
    --     function()
    --       require("telescope.builtin").commands()
    --     end,
    --     desc = "Commands",
    --   },
    --   {
    --     "<leader>re",
    --     function()
    --       require("telescope.builtin").resume()
    --     end,
    --     desc = "Resume telescope",
    --   },
    --   {
    --     "<leader>bb",
    --     function()
    --       require("telescope.builtin").buffers()
    --     end,
    --     desc = "Find buffer",
    --   },
    --   {
    --     "<leader>cs",
    --     function()
    --       require("telescope.builtin").lsp_document_symbols()
    --     end,
    --     desc = "Symbols in document",
    --   },
    --   {
    --     "<leader>fr",
    --     function()
    --       require("telescope.builtin").oldfiles()
    --     end,
    --     desc = "Find previously opened file",
    --   },
    --   {
    --     "<leader>km",
    --     function()
    --       require("telescope.builtin").keymaps()
    --     end,
    --     desc = "Find the user defined keymaps",
    --   },
    --   {
    --     ";h",
    --     function()
    --       require("telescope.builtin").help_tags()
    --     end,
    --     desc = "NeoVim help tags",
    --   },
    --   {
    --     "<leader>fP",
    --     function()
    --       require("telescope.builtin").find_files({
    --         cwd = require("lazy.core.config").options.root,
    --       })
    --     end,
    --     desc = "Find plugin files",
    --   },
    --   {
    --     ";s",
    --     function()
    --       local builtin = require("telescope.builtin")
    --       builtin.treesitter()
    --     end,
    --   },
    --   {
    --     ";e",
    --     function()
    --       local builtin = require("telescope.builtin")
    --       builtin.diagnostics()
    --     end,
    --     desc = "Lists Diagnostics for all open buffers or a specific buffer",
    --   },
    -- },
    config = function(_, opts)
      local telescope = require("telescope")
      local telescope_config = require("telescope.config")
      local actions = require("telescope.actions")
      -- local fb_actions = require("telescope").extensions.file_browser.actions

      -- -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

      -- -- I want to search in hidden/dot files.
      -- -- table "--hidden")
      -- -- -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!.git/*")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      -- opts.extensions = {
      --   file_browser = {
      --     theme = "dropdown",
      --     -- disables netrw and use telescope-file-browser in its place
      --     hijack_netrw = true,
      --     mappings = {
      --       -- your custom insert mode mappings
      --       ["n"] = {
      --         -- your custom normal mode mappings
      --         ["a"] = fb_actions.create,
      --         ["-"] = fb_actions.goto_parent_dir,
      --         ["i"] = function()
      --           vim.cmd("startinsert")
      --         end,
      --         ["<C-u>"] = function(prompt_bufnr)
      --           for i = 1, 10 do
      --             actions.move_selection_previous(prompt_bufnr)
      --           end
      --         end,
      --         ["<C-d>"] = function(prompt_bufnr)
      --           for i = 1, 10 do
      --             actions.move_selection_next(prompt_bufnr)
      --           end
      --         end,
      --         ["<PageUp>"] = actions.preview_scrolling_up,
      --         ["<PageDown>"] = actions.preview_scrolling_down,
      --       },
      --     },
      -- },
      -- }
      telescope.setup(opts)
      local trouble = require("trouble.providers.telescope")
      telescope.setup({
        defaults = {
          -- `hidden = true` is not supported in text grep commands.
          -- vimgrep_arguments = vimgrep_arguments,
          mappings = {
            i = {
              ["<c-n>"] = actions.move_selection_next,
              ["<c-p>"] = actions.move_selection_previous,
              ["<c-t>"] = trouble.open_with_trouble,
              -- ["<esc>"] = actions.close, -- Close on first press of esc. No "normal" mode.
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
      })
    end,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  -- },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you still want to use netrw.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = true,
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = false,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 20000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = true,
        -- Constrain the cursor to the editable parts of the oil buffer
        -- Set to `false` to disable, or "name" to keep it on the file names
        constrain_cursor = "editable",
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["t"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".git node_modules")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
          max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })
    end,
  },

  -- A plugin to make the current buffer take full window
  {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
    keys = {
      { "<leader>mt", ":MaximizerToggle<CR>", desc = "Make buffer full screen" },
    },
  },

  -- A telescope extension to view and search your undo tree
  {
    "debugloop/telescope-undo.nvim",
    cmd = "Telescope undo",
    keys = {
      { "<leader>tu", ":Telescope undo<CR>", desc = "Toggle Telescope version of undo tree" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            -- telescope-undo.nvim config, see below
          },
        },
      })
      require("telescope").load_extension("undo")
      vim.keymap.set("n", "<leader>tu", "<cmd>Telescope undo<cr>")
    end,
  },
}
