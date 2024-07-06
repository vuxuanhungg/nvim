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
  cmd = "TodoTelescope",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "<leader>ft",
      Settings.use_fzf and function()
        require("todo-comments.fzf").todo()
      end or "<cmd> TodoTelescope <cr>",
      desc = "Find todos",
    },
  },
}
