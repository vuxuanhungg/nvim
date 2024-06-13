return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["ruff_lsp"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)

        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false

        ---------- Create user commands ----------
        local ruff_lsp_client = require("lspconfig.util").get_active_client_by_name(bufnr, "ruff_lsp")

        local organize_imports = function()
          ruff_lsp_client.request("workspace/executeCommand", {
            command = "ruff.applyOrganizeImports",
            arguments = {
              { uri = vim.uri_from_bufnr(bufnr) },
            },
          })
        end

        local auto_fix = function()
          ruff_lsp_client.request("workspace/executeCommand", {
            command = "ruff.applyAutofix",
            arguments = {
              { uri = vim.uri_from_bufnr(bufnr) },
            },
          })
        end

        vim.api.nvim_create_user_command("RuffOrganizeImports", organize_imports, { desc = "Ruff: Organize Imports" })
        vim.api.nvim_create_user_command("RuffAutoFix", auto_fix, { desc = "Ruff: Fix all auto-fixable problems" })

        vim.keymap.set("n", "<A-O>", organize_imports, { desc = "Organize imports", buffer = bufnr })
      end,
      init_options = {
        settings = {
          -- Don't hook these two into code actions
          organizeImports = false,
          fixAll = false,
        },
      },
    })
  end,
}
