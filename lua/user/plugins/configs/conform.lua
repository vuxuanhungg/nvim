return {
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
