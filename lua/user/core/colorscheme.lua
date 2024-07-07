if vim.g.vscode then
  return
end

vim.cmd.colorscheme(Settings.colorscheme)

vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Customize highlights",
  group = vim.api.nvim_create_augroup("colorscheme_load", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "WinSeparator", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "AerialLine", { link = "Visual" })
    vim.api.nvim_set_hl(0, "AerialGuide", { link = "IndentBlanklineChar" })

    if vim.g.colors_name == "vscode" then
      vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "LspFloatWinBorder" })
      vim.api.nvim_set_hl(0, "lualine_winbar", { fg = "#888888", bg = "NONE" })
    end
  end,
})
