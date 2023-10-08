return {
  opts = function()
    local nls = require("null-ls")
    local formatting = nls.builtins.formatting
    local diagnostics = nls.builtins.diagnostics

    return {
      sources = {
        formatting.stylua,
        formatting.prettierd,
        diagnostics.eslint_d,
        formatting.black,
      },
      on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    }
  end,
}
