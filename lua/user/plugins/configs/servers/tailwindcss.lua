return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = common_on_attach,
      settings = {
        tailwindCSS = {
          emmetCompletions = true,
        },
      },
    })
  end,
}
