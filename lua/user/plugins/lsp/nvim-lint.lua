local linters_by_ft = {}

return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = linters_by_ft

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  event = { "BufReadPre", "BufNewFile" },
  enabled = not require("user.utils").is_table_empty(linters_by_ft),
}
