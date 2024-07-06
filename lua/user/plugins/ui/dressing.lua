return {
  "stevearc/dressing.nvim",
  opts = {
    input = { border = "single" },
    select = {
      backend = { Settings.use_fzf and "fzf_lua" or "telescope", "builtin", "nui" },
      fzf_lua = {
        winopts = {
          height = 0.5,
        },
      },
      telescope = {
        layout_config = { width = 75, height = 15 },
      },
    },
  },
  event = "VeryLazy",
}
