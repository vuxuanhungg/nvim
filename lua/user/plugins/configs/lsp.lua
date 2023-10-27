return {
  config = function()
    local assign_keymaps = function(_, bufnr)
      local bmap = require("user.utils").map(bufnr)

      local actions = {
        go_to_definitions = function()
          require("trouble").toggle("lsp_definitions")
        end,
        go_to_references = function()
          require("trouble").toggle("lsp_references")
        end,
        go_to_implementations = function()
          require("trouble").toggle("lsp_implementations")
        end,
      }

      local peekOrHover = function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end

      bmap("n", "K", peekOrHover, "Hover symbol")
      bmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      bmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      bmap("n", "gl", vim.diagnostic.open_float, "Line diagnostic")
      bmap("n", "gd", actions.go_to_definitions, "Go to definitions")
      bmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      bmap("n", "gr", actions.go_to_references, "Go to references")
      bmap("n", "gI", actions.go_to_implementations, "Go to implementations")
      bmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      bmap("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
      bmap("n", "<C-.>", vim.lsp.buf.code_action, "Code action")
    end

    local tweak_ui = function()
      ---@param level string
      ---@param icon string
      local define_sign = function(level, icon)
        local name = "DiagnosticSign" .. level
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      define_sign("Error", "")
      define_sign("Warn", "")
      define_sign("Hint", "")
      define_sign("Info", "")

      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = true,
        severity_sort = true,
        float = {
          style = "minimal",
          border = "single",
          source = "always",
        },
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
      })
    end

    local setup_servers = function()
      -- Setup capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local common_on_attach = assign_keymaps

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
        bashls = {},
        html = {},
        cssls = {},
        emmet_language_server = {},
        tailwindcss = {},
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        pyright = {},
        ruff_lsp = {
          init_options = {
            settings = {
              -- Don't hook these two into code actions
              organizeImports = false,
              fixAll = false,
            },
          },
          on_attach = function(client, bufnr)
            common_on_attach(client, bufnr)

            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false

            ---------- Create user commands ----------
            local ruff_lsp_client = require("lspconfig.util").get_active_client_by_name(bufnr, "ruff_lsp")

            local organize_imports = function()
              ruff_lsp_client.request("workspace/executeCommand", {
                command = "ruff.applyOrganizeImports",
                arguments = {
                  { uri = vim.uri_from_bufnr(bufnr) },
                },
              })
            end

            local auto_fix = function()
              ruff_lsp_client.request("workspace/executeCommand", {
                command = "ruff.applyAutofix",
                arguments = {
                  { uri = vim.uri_from_bufnr(bufnr) },
                },
              })
            end

            vim.api.nvim_create_user_command(
              "RuffOrganizeImports",
              organize_imports,
              { desc = "Ruff: Organize Imports" }
            )
            vim.api.nvim_create_user_command("RuffAutoFix", auto_fix, { desc = "Ruff: Fix all auto-fixable problems" })

            vim.keymap.set("n", "<A-O>", organize_imports, { desc = "Organize imports", buffer = bufnr })
          end,
        },
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = servers[server_name].on_attach or common_on_attach,
              settings = servers[server_name].settings or {},
              init_options = servers[server_name].init_options or {},
            })
          end,
        },
      })

      require("typescript-tools").setup({
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          local map = vim.keymap.set
          map("n", "<A-O>", "<cmd> TSToolsOrganizeImports <cr>", { desc = "Organize imports", buffer = bufnr })
          map(
            "n",
            "<leader>ai",
            "<cmd> TSToolsAddMissingImports <cr>",
            { desc = "Add missing imports", buffer = bufnr }
          )
        end,
      })
    end

    tweak_ui()
    setup_servers()
  end,
}
