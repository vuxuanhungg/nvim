return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvimtools/none-ls-extras.nvim", enabled = Settings.use_nls },
    { "gbprod/none-ls-shellcheck.nvim", enabled = Settings.use_nls },
  },
  opts = function()
    local nls = require("null-ls")
    local formatting = nls.builtins.formatting
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    return {
      sources = {
        -- lua
        formatting.stylua,

        -- bash
        formatting.shfmt,
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),

        -- node
        formatting.prettierd,

        -- python
        formatting.black,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = false,
                filter = function()
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    }
  end,
  event = { "BufReadPre", "BufNewFile" },
  enabled = Settings.use_nls,
}
