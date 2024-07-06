--[[
Note: `eslint_d` cannot auto switch between (new) flat and old config format
inside a monorepo where each repo uses a different config format

And I cannot get `nvim-lint` to work with `eslint` yet
--]]
return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  event = function()
    return require("user.utils").should_plugin_load(not Settings.use_nls, { "BufReadPre", "BufNewFile" })
  end,
}
