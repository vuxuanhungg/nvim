return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["basedpyright"].setup({
      capabilities = capabilities,
      on_attach = common_on_attach,
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
          },
        },
      },
    })
  end,
}
