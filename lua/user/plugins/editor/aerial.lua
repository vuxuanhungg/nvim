return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "onsails/lspkind.nvim",
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
  },
  cmd = "AerialToggle",
  keys = {
    { "<leader>uo", "<cmd> AerialToggle <cr>", desc = "Symbols outline" },
  },
}
