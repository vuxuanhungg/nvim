return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["volar"].setup({
      capabilities = capabilities,
      on_attach = common_on_attach,
    })
  end,
}
