local slow_format_filetypes = {}
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
