return {
  "folke/which-key.nvim",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>f", group = "Finder" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunk" },
      { "<leader>q", group = "Session" },
      { "<leader>r", group = "Rename" },
      { "<leader>s", group = "Split" },
      { "<leader>u", group = "Toggle" },
    },
    win = {
      border = "single",
      padding = { 1, 4 },
    },
    icons = {
      mappings = false,
    },
  },
  event = "VeryLazy",
}
