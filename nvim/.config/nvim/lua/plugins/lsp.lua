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
        priority = 100,
    },
    {
      -- bridges mason with the lspconfig
        priority = 80,
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({})
        end,
      },
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
},
}
