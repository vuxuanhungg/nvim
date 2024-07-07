return {
  -- LSP core stuffs
  { import = "user.plugins.lsp.nvim-lspconfig" },

  -- Better fold
  { import = "user.plugins.lsp.nvim-ufo" },

  -- LSP diagnostics, formatting and code actions
  { import = "user.plugins.lsp.none-ls" },
  { import = "user.plugins.lsp.conform" },
  { import = "user.plugins.lsp.nvim-lint" },

  {
    -- LSP progress UI
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = {
      text = { spinner = "dots" },
    },
    event = "LspAttach",
  },
}
