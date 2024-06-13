return {
  setup = function(capabilities)
    require("lspconfig")["volar"].setup({
      capabilities = capabilities,
      on_attach = function(client)
        -- let vtsls handle instead
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.implementationProvider = false
        client.server_capabilities.referencesProvider = false
      end,
    })
  end,
}
