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
      local fb_actions = require("telescope").extensions.file_browser.actions

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
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
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
