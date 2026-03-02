local equalize_windows = function(position)
  if position == "left" or position == "right" then vim.cmd "wincmd =" end
end

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
          handler = function(args) equalize_windows(args.position) end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args) equalize_windows(args.position) end,
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

  ----- Custom -----
  {
    "Mofiqul/vscode.nvim",
    opts = {
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
      },
    },
  },
}
