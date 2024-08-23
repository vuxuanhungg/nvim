return {
  -- LSP core stuffs
  { import = "user.plugins.lsp.nvim-lspconfig" },

  -- Better fold
  { import = "user.plugins.lsp.nvim-ufo" },

  -- LSP diagnostics, formatting and code actions
  { import = "user.plugins.lsp.none-ls" },
  { import = "user.plugins.lsp.conform" },
  { import = "user.plugins.lsp.nvim-lint" },

  -- LSP progress status
  {
    "j-hui/fidget.nvim",
    tag = "v1.4.5",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
    event = "VeryLazy",
  },
}
