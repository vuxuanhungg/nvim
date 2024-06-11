--- Toggle between null-ls and alternatives
local use_nls = false

return {
  ---------- LSP core stuffs ----------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = require("user.plugins.configs.mason").config,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
      },
      { "williamboman/mason-lspconfig.nvim" },
      -- { "pmizio/typescript-tools.nvim" },
      { "yioneko/nvim-vtsls" },
      { "b0o/SchemaStore.nvim" },
    },
    config = require("user.plugins.configs.lsp").config,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      focus = true,
      use_diagnostic_signs = true,
    },
    cmd = { "TroubleToggle", "Trouble" },
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      priority = 1000,
      autocmd = { enabled = true },
    },
    event = "LspAttach",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = require("user.plugins.configs.ufo").config,
    event = "LspAttach",
  },
  {
    -- LSP progress UI
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = {
      text = { spinner = "dots" },
    },
    event = "LspAttach",
  },

  ---------- Linters, formatters and code actions ----------
  {
    "nvimtools/none-ls.nvim",
    opts = require("user.plugins.configs.null-ls").opts,
    event = { "BufReadPre", "BufNewFile" },
    cond = use_nls,
  },
  {
    "stevearc/conform.nvim",
    opts = require("user.plugins.configs.conform").opts,
    event = { "BufReadPost", "BufNewFile" },
    cond = not use_nls,
  },
  {
    "mfussenegger/nvim-lint",
    config = require("user.plugins.configs.nvim-lint").config,
    event = { "BufReadPre", "BufNewFile" },
    cond = not use_nls,
  },
}
