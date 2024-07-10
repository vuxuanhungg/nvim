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
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.g.vscode,
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
    event = "InsertEnter",
  },
  {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
    keys = { { "<leader>sm", "<cmd> MaximizerToggle <cr>", desc = "Maximize window" } },
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
