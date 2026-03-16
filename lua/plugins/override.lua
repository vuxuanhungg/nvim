---@type LazySpec
return {
  ----- Override -----
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        height = 0.8,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40,
        mappings = {
          ["<C-cr>"] = "open_vsplit",
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = { ".git" },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = require("utils").equalize_windows,
        },
        {
          event = "neo_tree_window_after_close",
          handler = require("utils").equalize_windows,
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 250,
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
      require("luasnip").filetype_extend("typescript", { "typescriptreact" })
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {
      preview = { winblend = 0 },
    },
  },
  {
    "esmuellert/codediff.nvim",
    opts = {
      keymaps = {
        view = {
          next_hunk = "]g",
          prev_hunk = "[g",
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<C-CR>"] = { "edit_vsplit", mode = { "i", "n" } },
              ["<C-j>"] = { "history_forward", mode = { "i", "n" } },
              ["<C-k>"] = { "history_back", mode = { "i", "n" } },
            },
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrotheme",
    opts = {
      highlights = {
        astrodark = {
          -- Make `neo-tree` focus and blur state look different
          NeoTreeNormal = { link = "Normal" },
          NeoTreeNormalNC = { link = "NormalNC" },
        },
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    enabled = false,
  },
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
    },
  },

  ----- Custom -----
  {
    "Mofiqul/vscode.nvim",
    opts = {
      style = "dark",
      italic_comments = true,
      group_overrides = {
        AerialLine = {
          bg = "#37373D",
          blend = 0,
          bold = true,
          cterm = {
            bold = true,
          },
        },
        AerialGuide = { link = "IblIndent" },
        NeoTreeCursorLine = { link = "AerialLine" },
        NeoTreeIndentMarker = { link = "IblIndent" },
        NormalFloat = { bg = "#181818" },
        NeoTreeNormal = { link = "NormalFloat" },
        NeoTreeNormalNC = { link = "NormalFloat" },
        FloatBorder = { link = "NeoTreeFloatBorder" },
        SnacksPickerBorder = { link = "NeoTreeFloatBorder" },
      },
    },
  },
}
