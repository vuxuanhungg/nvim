return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    layout = {
      width = 30,
      placement = "edge",
      default_direction = "right",
      preserve_equality = true,
    },
    attach_mode = "global",
    show_guides = true,
    icons = Settings.icons.kinds,
  },
  cmd = "AerialToggle",
  keys = {
    { "<leader>uo", "<cmd> AerialToggle <cr>", desc = "Symbols outline" },
  },
}
