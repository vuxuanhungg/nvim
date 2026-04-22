---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = false,
    },
    mappings = {
      n = {
        gd = { function() require("snacks.picker").lsp_definitions() end, desc = "Go to definitions" },
        gr = { function() require("snacks.picker").lsp_references() end, nowait = true, desc = "Go to references" },
        ["<A-O>"] = {
          function() require("vtsls").commands.organize_imports() end,
          desc = "Typescript: Organize imports",
          cond = function(client) return client.name == "vtsls" end,
        },
      },
    },
    autocmds = {
      biome_fix_on_save = {
        cond = function(client) return client.name == "biome" end,
        {
          event = "BufWritePre",
          desc = "Biome: Organize imports & Fix all errors on save",
          callback = function(args)
            if vim.F.if_nil(vim.b[args.buf].autoformat, vim.g.autoformat, true) then
              local client = vim.lsp.get_clients({ bufnr = args.buf, name = "biome" })[1]
              if not client then return end
              local encoding = client.offset_encoding or "utf-8"

              local function apply_code_action(kind)
                local line_count = vim.api.nvim_buf_line_count(args.buf)
                local last_line = vim.api.nvim_buf_get_lines(args.buf, -2, -1, false)[1] or ""
                local params = {
                  textDocument = vim.lsp.util.make_text_document_params(args.buf),
                  range = {
                    start = { line = 0, character = 0 },
                    ["end"] = { line = line_count - 1, character = vim.str_utfindex(last_line, encoding) },
                  },
                  context = {
                    diagnostics = {},
                    only = { kind },
                    triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Invoked,
                  },
                }
                local results = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 3000)
                for _, res in pairs(results or {}) do
                  for _, action in pairs(res.result or {}) do
                    if action.edit then vim.lsp.util.apply_workspace_edit(action.edit, encoding) end
                  end
                end
              end

              apply_code_action "source.organizeImports.biome"
              apply_code_action "source.fixAll.biome"
            end
          end,
        },
      },
    },
  },
}
