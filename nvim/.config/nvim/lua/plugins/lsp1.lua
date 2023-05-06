return {
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
  { 'neovim/nvim-lspconfig' },
    {
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
      opts = {
        pip = {
          upgrade_pip = true,
        },
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
},
config = function()
-- lsp configurations-----------------------------

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed ({
  'clangd' ,
  'lua_ls' ,
})

require'lspconfig'.clangd.setup {
  capabilities = {['default'] = require('lsp').protocol.make_client_capabilities(), ['offsetEncoding'] = 'utf-8'},
  on_attach = on_attach,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  cmd = { "clangd" },
  root_dir = { 
    root_pattern(
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac',
      '.git'
    )
  },
  single_file_support = true,
}

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- library = 
        library = {
          vim.api.nvim_get_runtime_file("", true),
          vim.fn.stdpath("config"),
        },
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = '',
    warn = '',
    hint = '',
    info = ''
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vac", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
  end
}

-- from here --------------------------------------------------------------------------

-- -- Setup language servers.
-- local lspconfig = require('lspconfig')
-- -- lspconfig.pyright.setup {}
-- -- lspconfig.tsserver.setup {}
-- -- lspconfig.rust_analyzer.setup {
-- -- -- Server-specific settings. See `:help lspconfig-setup`
-- -- settings = {
-- -- ['rust-analyzer'] = {},
-- -- },
-- -- }


-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
-- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
-- callback = function(ev)
-- -- Enable completion triggered by <c-x><c-o>
-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

-- -- Buffer local mappings.
-- -- See `:help vim.lsp.*` for documentation on any of the below functions
-- local opts = { buffer = ev.buf }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workleader_folder, opts)
-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workleader_folder, opts)
-- vim.keymap.set('n', '<leader>wl', function()
-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
-- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', '<leader>f', function()
-- vim.lsp.buf.format { async = true }
-- end, opts)
-- end,
-- })
-- }


-- to here is the sane lspconfig defaults
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
