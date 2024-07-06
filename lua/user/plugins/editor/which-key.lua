return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup({
      window = { border = "single" },
      layout = { align = "center" },
    })
    local opts = {
      ["<leader>f"] = { name = "Finder", _ = "which_key_ignore" },
      ["<leader>r"] = { name = "Rename", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "Split", _ = "which_key_ignore" },
      ["<leader>u"] = { name = "Toggle", _ = "which_key_ignore" },
      ["<leader>h"] = { name = "Git Hunk", _ = "which_key_ignore" },
      ["<leader>b"] = { name = "Harpoon", _ = "which_key_ignore" },
    }
    wk.register(opts)
  end,
  event = "VeryLazy",
}
