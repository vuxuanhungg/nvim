return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  opts = function()
    return {
      mappings = {
        basic = false,
        extra = false,
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
  end,
  keys = {
    { "<C-/>", "<cmd> lua require('Comment.api').toggle.linewise.current() <cr>", desc = "Toggle comment" },
    {
      "<C-/>",
      "<esc><cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode()) <cr>",
      mode = "v",
      desc = "Toggle comment",
    },
  },
}
