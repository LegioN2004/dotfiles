return {
  {
    "VonHeikemen/lsp-zero.nvim",
    event = { "BufEnter" },
    branch = "v2.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        priority = 100,
        build = ":MasonUpdate",
        config = function()
          require("mason").setup({
            providers = {
              "mason.providers.registry-api", -- default
              "mason.providers.client",
            },
            ui = {
              height = 0.85,
              border = "rounded",
            },
          })
        end,
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
      { "hrsh7th/nvim-cmp" },         -- Required
      { "hrsh7th/cmp-buffer" },       --  Optional
      { "hrsh7th/cmp-path" },         --  Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" },     -- Required
      { "hrsh7th/cmp-nvim-lua" },     -- Required
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      { "hrsh7th/cmp-vsnip" }, -- Required
    },
  },
}
