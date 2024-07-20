return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { import = "user.plugins.lsp.mason" },
    { "williamboman/mason-lspconfig.nvim" },
    { import = "user.plugins.lsp.lazydev" },
    { "yioneko/nvim-vtsls" },
    { "b0o/SchemaStore.nvim" },
  },
  config = function()
    local assign_keymaps = function(_, bufnr)
      local bmap = require("user.utils").map(bufnr)
      local finder = nil
      if Settings.use_fzf then
        finder = require("fzf-lua")
      else
        finder = require("telescope.builtin")
      end

      local actions = {
        peekOrHover = function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        format_buffer = function()
          vim.lsp.buf.format({ async = true })
        end,
      }

      bmap("n", "K", actions.peekOrHover, "Hover symbol")
      bmap("n", "gd", finder.lsp_definitions, "Go to definitions")
      bmap("n", "gr", finder.lsp_references, "Go to references")
      bmap("n", "gl", vim.diagnostic.open_float, "Line diagnostic")
      bmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      bmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

      bmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      bmap("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")

      bmap("n", "<C-.>", vim.lsp.buf.code_action, "Code action")

      -- Lesser known
      bmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      bmap("n", "gI", finder.lsp_implementations, "Go to implementations")
    end

    local tweak_ui = function()
      local s = vim.diagnostic.severity
      local i = Settings.icons.diagnostics

      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = true,
        severity_sort = true,
        float = {
          border = "single",
          source = true,
        },
        signs = {
          text = {
            [s.ERROR] = i.Error,
            [s.WARN] = i.Warn,
            [s.HINT] = i.Hint,
            [s.INFO] = i.Info,
          },
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
      end

      local servers = {
        "lua_ls",
        "bashls",
        "html",
        "cssls",
        "somesass_ls",
        "emmet_language_server",
        "tailwindcss",
        "jsonls",
        "vtsls",
        "eslint",
        "volar",
        "prismals",
        "basedpyright",
        "ruff",
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
          ["cssls"] = function()
            require("user.plugins.lsp.servers.cssls").setup(capabilities, common_on_attach)
          end,
          ["tailwindcss"] = function()
            require("user.plugins.lsp.servers.tailwindcss").setup(capabilities, common_on_attach)
          end,
          ["jsonls"] = function()
            require("user.plugins.lsp.servers.jsonls").setup(capabilities, common_on_attach)
          end,
          ["vtsls"] = function()
            require("user.plugins.lsp.servers.vtsls").setup(capabilities, common_on_attach)
          end,
          ["volar"] = function()
            require("user.plugins.lsp.servers.volar").setup(capabilities)
          end,
          ["basedpyright"] = function()
            require("user.plugins.lsp.servers.basedpyright").setup(capabilities, common_on_attach)
          end,
        },
      })
    end

    tweak_ui()
    setup_servers()
  end,
  event = { "BufReadPre", "BufNewFile" },
}
