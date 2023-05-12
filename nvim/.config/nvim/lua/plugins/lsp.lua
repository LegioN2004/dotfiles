return {
{
  'VonHeikemen/lsp-zero.nvim',
  event = {'BufEnter'},
  branch = 'v2.x',
  dependencies = {
  { 'neovim/nvim-lspconfig' },
    {
      "williamboman/mason.nvim",
      cmd = 'Mason',
      build = ':MasonUpdate',
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
},
}
