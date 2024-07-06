return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["jsonls"].setup({
      capabilities = capabilities,
      on_attach = common_on_attach,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
}
