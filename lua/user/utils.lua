local M = {}

--- Define a keymap. If `bufnr` is present, the mapping is buffer-scoped.
---@param bufnr? any
M.map = function(bufnr)
  ---@param mode string | table Can be a single mode or multiple modes
  ---@param lhs string Left-hand side `{lhs}` of the mapping
  ---@param rhs string | function Right-hand side `{rhs}` of the mapping
  ---@param desc? string Description
  ---@param opts? table | nil Other map arguments
  return function(mode, lhs, rhs, desc, opts)
    local full_opts = vim.tbl_deep_extend("force", opts or {}, { desc = desc }, bufnr and { buffer = bufnr } or {})
    vim.keymap.set(mode, lhs, rhs, full_opts)
  end
end

M.is_git_repo = function()
  local path = vim.uv.cwd() .. "/.git"
  return not not vim.uv.fs_stat(path)
end

M.toggle_cmdline = function()
  local cmdheight = vim.api.nvim_get_option_value("cmdheight", {})
  vim.api.nvim_set_option_value("cmdheight", 1 - cmdheight, {})
  vim.notify(
    "Command line: " .. (cmdheight == 1 and "disabled" or "enabled"),
    vim.log.levels.INFO,
    { title = "neovim" }
  )
end

M.toggle_word_wrap = function()
  local word_wrap = vim.api.nvim_get_option_value("wrap", {})
  vim.api.nvim_set_option_value("wrap", not word_wrap, {})
  vim.notify("Word wrap: " .. (word_wrap and "off" or "on"), vim.log.levels.INFO, { title = "neovim" })
end

--- Filter out diagnostic messages we do not want to see
---@param messages string[]
M.filter_diagnostics = function(messages)
  local filter = function(diagnostics)
    return vim.tbl_filter(function(diagnostic)
      for _, message in pairs(messages) do
        return not string.find(diagnostic.message, message)
      end
    end, diagnostics)
  end

  local old_set = vim.diagnostic.set

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.diagnostic.set = function(namespace, bufnr, diagnostics, opts)
    old_set(namespace, bufnr, filter(diagnostics), opts)
  end
end

return M
