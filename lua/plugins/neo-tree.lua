---@type LazySpec
return {
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
}
