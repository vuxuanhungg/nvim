return {
  "stevearc/dressing.nvim",
  opts = {
    input = { border = Settings.border },
    select = {
      backend = { "fzf_lua", "builtin", "nui" },
      fzf_lua = {
        winopts = {
          height = 0.5,
        },
      },
    },
  },
  event = "VeryLazy",
}
