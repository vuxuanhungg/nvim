return {
  ---------- Colorscheme ----------
  {
    "Mofiqul/vscode.nvim",
    opts = {
      italic_comments = true,
      group_overrides = {
        FzfLuaBorder = { link = "LspFloatWinBorder" },
        lualine_winbar = { fg = "#808080", bg = "NONE" },
      },
    },
    lazy = Settings.colorscheme ~= "vscode",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = {
        FzfLuaBorder = { link = "FloatBorder" },
      },
    },
    lazy = Settings.colorscheme ~= "catppuccin",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
    lazy = Settings.colorscheme ~= "tokyonight",
    priority = 1000,
  },

  -- Nerd-font icons
  { import = "user.plugins.ui.nvim-web-devicons" },

  -- Improve default vim.ui interfaces
  { import = "user.plugins.ui.dressing" },

  -- Fancy notification
  { import = "user.plugins.ui.nvim-notify" },
}
