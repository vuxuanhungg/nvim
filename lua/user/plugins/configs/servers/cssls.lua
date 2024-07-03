return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["cssls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)

        -- Disable in favor of `somesass_ls`
        if vim.bo.filetype == "scss" then
          client.server_capabilities.definitionProvider = false
          client.server_capabilities.referencesProvider = false
        end
      end,
    })
  end,
}
