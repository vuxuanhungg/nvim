return {
  "rcarriga/nvim-notify",
  opts = {
    stages = "static",
    timeout = 3000,
  },

  init = function()
    local silent_messages = { "No information available" }

    vim.notify = function(msg, ...)
      for _, silent in ipairs(silent_messages) do
        if string.find(msg, silent) then
          return
        end
      end

      return require("notify")(msg, ...)
    end
  end,

  keys = {
    {
      "<leader>fn",
      Settings.use_fzf and "<cmd> Notifications <cr>" or function()
        require("telescope").load_extension("notify").notify()
      end,
      desc = "Notifications history",
    },
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all notifications",
    },
  },
}
