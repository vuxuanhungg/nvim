return {
  config = function()
    local wk = require("which-key")
    wk.setup({
      window = { border = "single" },
      layout = { align = "center" },
    })
    wk.register({
      ["<leader>f"] = { name = "Finder", _ = "which_key_ignore" },
      ["<leader>r"] = { name = "Rename", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "Split/Search", _ = "which_key_ignore" },
      ["<leader>u"] = { name = "Toggle", _ = "which_key_ignore" },
      ["<leader>x"] = { name = "Trouble", _ = "which_key_ignore" },
      ["<leader>h"] = { name = "Git Hunk", _ = "which_key_ignore" },
    })
  end,
}
