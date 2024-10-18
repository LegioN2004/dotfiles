return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    ---@type lc.lang
    lang = "java",
    ---@type lc.storage
    storage = {
      home = vim.fn.stdpath("data") .. "~/ghq/github.com/LegioN2004/Programs/LeetCode/",
      cache = vim.fn.stdpath("cache") .. "~/ghq/github.com/LegioN2004/Programs/LeetCode/",
    },
  },
}
