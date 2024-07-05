return {
  -- Colorscheme
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
  {
    "nvim-tree/nvim-web-devicons",
    config = require("user.plugins.configs.devicons").config,
    lazy = true,
  },
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init({ preset = "codicons" })
    end,
    lazy = true,
  },
  {
    -- Improve default vim.ui interfaces
    "stevearc/dressing.nvim",
    opts = {
      input = { border = "single" },
      select = {
        backend = { Settings.use_fzf and "fzf_lua" or "telescope", "builtin", "nui" },
        fzf_lua = {
          winopts = {
            height = 0.5,
          },
        },
        telescope = {
          layout_config = { width = 75, height = 15 },
        },
      },
    },
  },
  {
    -- Notifications
    "rcarriga/nvim-notify",
    opts = require("user.plugins.configs.notify").opts,
    init = require("user.plugins.configs.notify").init,
  },
}
