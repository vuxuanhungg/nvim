return {
  opts = {
    stages = "static",
    timeout = 3000,
  },

  init = function()
    local silent_messages = { "No information available", "Unsupported command" }

    vim.notify = function(msg, ...)
      for _, silent in ipairs(silent_messages) do
        if string.find(msg, silent) then
          return
        end
      end

      return require("notify")(msg, ...)
    end
  end,
}
