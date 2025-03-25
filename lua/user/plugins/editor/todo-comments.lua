return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIX = { icon = "󰃤" },
      TODO = { icon = "󰄬" },
      HACK = { icon = "󰈸" },
      WARN = { icon = "󰔶" },
      PERF = { icon = "󱐋" },
      NOTE = { icon = "󰍩", color = "#4ec9b0" },
      TEST = { icon = "󰙨" },
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "<leader>ft",
      function()
        require("todo-comments.fzf").todo()
      end,
      desc = "Find todos",
    },
  },
}
