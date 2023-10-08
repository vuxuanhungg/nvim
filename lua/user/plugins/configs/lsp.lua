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

      -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      --   border = "single",
      -- })
      -- HACK: Remove 'No information available' notification when multiple language servers are active
      vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
        config = config or {}
        config.border = "single"
        config.focus_id = ctx.method
        if not (result and result.contents) then
          return
        end
        local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
        if vim.tbl_isempty(markdown_lines) then
          return
        end
        return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
      end

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

      local servers = {
        lua_ls = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
        html = {},
        cssls = {},
        emmet_language_server = {},
        tailwindcss = {},
        jsonls = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
        pyright = {},
        ruff_lsp = {},
      }

      local on_attach = function(client, bufnr)
        assign_keymaps(client, bufnr)

        if client.name == "ruff_lsp" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end

      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = servers[server_name],
              filetypes = (servers[server_name] or {}).filetypes,
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
