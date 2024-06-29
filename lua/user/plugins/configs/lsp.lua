return {
  config = function()
    local assign_keymaps = function(_, bufnr)
      local bmap = require("user.utils").map(bufnr)

      local actions = {
        peekOrHover = function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        go_to_definitions = function()
          require("trouble").toggle("lsp_definitions")
        end,
        go_to_references = function()
          require("trouble").toggle("lsp_references")
        end,
        go_to_implementations = function()
          require("trouble").toggle("lsp_implementations")
        end,
        format_buffer = function()
          vim.lsp.buf.format({ async = true })
        end,
      }

      bmap("n", "K", actions.peekOrHover, "Hover symbol")
      bmap("n", "gd", actions.go_to_definitions, "Go to definitions")
      bmap("n", "gr", actions.go_to_references, "Go to references")
      bmap("n", "gl", vim.diagnostic.open_float, "Line diagnostic")
      bmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      bmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

      bmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      bmap("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")

      bmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      bmap("n", "<C-.>", vim.lsp.buf.code_action, "Code action")

      bmap("n", "<leader>gf", actions.format_buffer, "Format buffer")

      -- Lesser known
      bmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      bmap("n", "gI", actions.go_to_implementations, "Go to implementations")
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

      -- Set border for :LspInfo
      require("lspconfig.ui.windows").default_options.border = "single"
      vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FloatBorder" })
    end

    local setup_servers = function()
      -- Setup capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local common_on_attach = function(client, bufnr)
        assign_keymaps(client, bufnr)

        if client.server_capabilities["documentSymbolProvider"] and client.name ~= "volar" then
          require("nvim-navic").attach(client, bufnr)
        end
      end

      local servers = {
        "lua_ls",
        "bashls",
        "html",
        "cssls",
        "emmet_language_server",
        "tailwindcss",
        "jsonls",
        "vtsls",
        "eslint",
        "volar",
        "prismals",
        "pyright",
        "ruff_lsp",
        "clangd",
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = common_on_attach,
            })
          end,
          ["lua_ls"] = function()
            require("user.plugins.configs.servers.luals").setup(capabilities, common_on_attach)
          end,
          ["tailwindcss"] = function()
            require("user.plugins.configs.servers.tailwindcss").setup(capabilities, common_on_attach)
          end,
          ["jsonls"] = function()
            require("user.plugins.configs.servers.jsonls").setup(capabilities, common_on_attach)
          end,
          ["vtsls"] = function()
            require("user.plugins.configs.servers.vtsls").setup(capabilities, common_on_attach)
          end,
          ["volar"] = function()
            require("user.plugins.configs.servers.volar").setup(capabilities)
          end,
          ["ruff_lsp"] = function()
            require("user.plugins.configs.servers.ruff-lsp").setup(capabilities, common_on_attach)
          end,
        },
      })
    end

    tweak_ui()
    setup_servers()
  end,
}
