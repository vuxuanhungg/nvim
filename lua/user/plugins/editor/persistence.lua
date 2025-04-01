return {
  "folke/persistence.nvim",
  opts = {},
  event = "BufReadPre",
  keys = {
    {
      "<leader>qr",
      function()
        require("persistence").load()
      end,
      desc = "Restore the session for the current directory",
    },
    {
      "<leader>qs",
      function()
        require("persistence").select()
      end,
      desc = "Select a session to restore",
    },
    {
      "<leader>ql",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore the last session",
    },
    {
      "<leader>qd",
      function()
        require("persistence").stop()
      end,
      desc = "Don't save the current session",
    },
  },
}
