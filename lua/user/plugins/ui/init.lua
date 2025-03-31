return {
  ---------- Colorscheme ----------
  {
    "Mofiqul/vscode.nvim",
    opts = {
      italic_comments = true,
      group_overrides = {
        lualine_winbar = { fg = "#808080", bg = "NONE" },
        lualine_buffers_active = { fg = "#569CD6", bg = "NONE" },
        lualine_buffers_inactive = { fg = "#808080", bg = "#262626" },
        FzfLuaHeaderText = { link = "lualine_buffers_active" },
      },
    },
    lazy = Settings.colorscheme ~= "vscode",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      dim_inactive = {
        enabled = true,
      },
      custom_highlights = {
        FzfLuaBorder = { link = "FloatBorder" },
        FzfLuaHeaderText = { link = "FloatBorder" },
        lualine_winbar = { link = "Comment" },
        lualine_buffers_active = { link = "lualine_b_normal" },
        lualine_buffers_inactive = { link = "lualine_a_buffers_inactive" },
      },
    },
    lazy = Settings.colorscheme ~= "catppuccin",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      dim_inactive = true,
      on_highlights = function(hl, _)
        hl.lualine_winbar = { link = "Comment" }
        hl.lualine_buffers_active = { link = "lualine_b_normal" }
        hl.lualine_buffers_inactive = { link = "lualine_a_buffers_inactive" }

        -- HACK: Dim `foldcolumn` and `signcolumn`
        hl.FoldColumn = { bg = "NONE" }
        hl.SignColumn = { bg = "NONE" }
      end,
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

  -- Smooth scrolling
  { import = "user.plugins.ui.cinnamon" },
}
