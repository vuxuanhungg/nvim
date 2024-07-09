return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- lua
      lua = { "stylua" },

      -- bash
      sh = { "shfmt" },

      -- web dev
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      vue = { { "prettierd", "prettier" } },

      -- python
      python = { "black" },

      -- others
      markdown = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  cmd = { "ConformInfo" },
  event = { "BufWritePre" },
  enabled = not Settings.use_nls,
}
