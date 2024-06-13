return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = common_on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })
  end,
}
