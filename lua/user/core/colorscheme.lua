if vim.g.vscode then
  return
end

vim.cmd.colorscheme(Settings.colorscheme)

vim.api.nvim_create_autocmd({ "BufWinEnter", "ColorScheme" }, {
  desc = "Customize highlights",
  group = vim.api.nvim_create_augroup("highlights_customize", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "AerialLine", { link = "Visual" })
    vim.api.nvim_set_hl(0, "AerialGuide", { link = "IblIndent" })
  end,
})
