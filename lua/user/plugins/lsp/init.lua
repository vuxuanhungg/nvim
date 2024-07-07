return {
  { import = "user.plugins.lsp.nvim-lspconfig" },
  { import = "user.plugins.lsp.nvim-ufo" },

  { import = "user.plugins.lsp.none-ls" },
  { import = "user.plugins.lsp.conform" },
  { import = "user.plugins.lsp.nvim-lint" },

  {
    -- LSP progress UI
    "j-hui/fidget.nvim",
    tag = "v1.4.4",
    opts = {},
    event = "LspAttach",
  },
}
