return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["basedpyright"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)

        vim.keymap.set("n", "<A-O>", "<cmd> PyrightOrganizeImports <cr>", { desc = "Organize imports", buffer = bufnr })
      end,
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
