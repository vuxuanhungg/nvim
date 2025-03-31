return {
  "declancm/cinnamon.nvim",
  version = "*",
  config = function()
    local cinnamon = require("cinnamon")

    cinnamon.setup({
      keymaps = {
        basic = true,
      },
      options = {
        delay = 10,
      },
    })

    -- PageUp/Down scroll half the page
    vim.keymap.set("n", "<PageUp>", function()
      cinnamon.scroll("<C-u>")
    end)
    vim.keymap.set("n", "<PageDown>", function()
      cinnamon.scroll("<C-d>")
    end)
  end,
}
