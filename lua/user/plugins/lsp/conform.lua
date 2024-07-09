local slow_format_filetypes = {}

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

    format_on_save = function(bufnr)
      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local on_format = function(err)
        if err and err:match("timeout$") then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 200, lsp_format = "fallback" }, on_format
    end,

    format_after_save = function(bufnr)
      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      return { lsp_format = "fallback" }
    end,
  },
  cmd = { "ConformInfo" },
  event = { "BufWritePre" },
  enabled = not Settings.use_nls,
}
