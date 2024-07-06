return {
  { import = "user.plugins.lsp.nvim-lspconfig" },
  { import = "user.plugins.lsp.nvim-ufo" },

  { import = "user.plugins.lsp.none-ls" },
  { import = "user.plugins.lsp.conform" },
  { import = "user.plugins.lsp.nvim-lint" },

  {
    -- Show trouble
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { focus = true },
    cmd = "Trouble",
    keys = { { "<leader>x", "<cmd> Trouble <cr>", desc = "Trouble" } },
  },
  {
    -- Show lightbulb where code actions are available
    "kosayoda/nvim-lightbulb",
    opts = {
      priority = 1000,
      autocmd = { enabled = true },
    },
    event = "LspAttach",
  },
  {
    -- LSP progress UI
    "j-hui/fidget.nvim",
    tag = "v1.4.4",
    opts = {},
    event = "LspAttach",
  },
}
