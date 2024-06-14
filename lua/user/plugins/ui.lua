return {
  -- Colorscheme
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
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
