return {
  ---------- Colorscheme ----------
  {
    "Mofiqul/vscode.nvim",
    lazy = Settings.colorscheme ~= "vscode",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = Settings.colorscheme ~= "catppuccin",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = Settings.colorscheme ~= "tokyonight",
    priority = 1000,
    opts = {
      style = "night",
    },
  },

  -- Nerd-font icons
  { import = "user.plugins.ui.nvim-web-devicons" },

  -- Kind icons
  { import = "user.plugins.ui.lspkind" },

  -- Improve default vim.ui interfaces
  { import = "user.plugins.ui.dressing" },

  -- Fancy notification
  { import = "user.plugins.ui.nvim-notify" },
}
