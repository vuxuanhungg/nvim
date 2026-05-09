---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<C-CR>"] = { "edit_vsplit", mode = { "i", "n" } },
            ["<C-j>"] = { "history_forward", mode = { "i", "n" } },
            ["<C-k>"] = { "history_back", mode = { "i", "n" } },
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    },
    scroll = {},
  },
}
