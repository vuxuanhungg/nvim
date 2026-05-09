---@type LazySpec
return {
  "esmuellert/codediff.nvim",
  opts = {
    keymaps = {
      view = {
        next_hunk = "]g",
        prev_hunk = "[g",
      },
    },
  },
}
