local web_format_opts = { "prettierd", "prettier", stop_after_first = true }

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- lua
      lua = { "stylua" },

      -- bash
      sh = { "shfmt" },

      -- web dev
      html = web_format_opts,
      css = web_format_opts,
      scss = web_format_opts,
      json = web_format_opts,
      javascript = web_format_opts,
      javascriptreact = web_format_opts,
      typescript = web_format_opts,
      typescriptreact = web_format_opts,
      vue = web_format_opts,

      -- python
      python = { "ruff_organize_imports", "ruff_format" },

      -- others
      markdown = web_format_opts,
      yaml = web_format_opts,
    },

    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
  },
  cmd = { "ConformInfo" },
  event = { "BufWritePre" },
}
