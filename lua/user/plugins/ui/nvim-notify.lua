return {
  "rcarriga/nvim-notify",
  opts = {
    stages = "static",
    timeout = 3000,
    icons = {
      DEBUG = Settings.icons.misc.Debugger,
      ERROR = Settings.icons.diagnostics.Error,
      INFO = Settings.icons.diagnostics.Info,
      TRACE = Settings.icons.diagnostics.Hint,
      WARN = Settings.icons.diagnostics.Warn,
    },
  },

  init = function()
    local silent_messages = {
      -- Multiple servers are attached to a filetype
      -- but only one server has the information
      -- on hover over (e.g. tailwindcss - vtsls)
      "No information available",

      -- [Code action] Move to a new file (vtsls)
      "Request codeAction/resolve failed with message: <semantic> TypeScript Server Error",
    }

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
