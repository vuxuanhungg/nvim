return {
  setup = function(capabilities, common_on_attach)
    require("lspconfig")["vtsls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)

        local actions = {
          rename_file = function()
            require("vtsls").commands.rename_file()
          end,
          organize_imports = function()
            require("vtsls").commands.organize_imports()
          end,
        }

        local map = vim.keymap.set
        map("n", "<leader>rf", actions.rename_file, { desc = "Rename file", buffer = bufnr })
        map("n", "<A-O>", actions.organize_imports, { desc = "Organize imports", buffer = bufnr })
      end,
    })
  end,
}
