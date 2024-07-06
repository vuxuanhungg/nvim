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
          add_missing_imports = function()
            require("vtsls").commands.add_missing_imports()
          end,
        }

        local map = vim.keymap.set
        map("n", "<leader>rf", actions.rename_file, { desc = "Rename file", buffer = bufnr })
        map("n", "<A-O>", actions.organize_imports, { desc = "Organize imports", buffer = bufnr })
        map("n", "<leader>ai", actions.add_missing_imports, { desc = "Add missing imports", buffer = bufnr })
      end,
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                location = require("mason-registry").get_package("vue-language-server"):get_install_path()
                  .. "/node_modules/@vue/language-server",
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              },
            },
          },
        },
      },
    })
  end,
}
