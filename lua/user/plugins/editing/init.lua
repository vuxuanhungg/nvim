return {
  {
    "max397574/better-escape.nvim",
    main = "better_escape",
    opts = {},
    event = "InsertEnter",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    opts = {},
    event = "VeryLazy",
    cond = vim.g.vscode,
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
    event = "InsertEnter",
  },
  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Autocompletion
  { import = "user.plugins.editing.nvim-cmp" },

  -- Comment
  { import = "user.plugins.editing.comment" },
}
