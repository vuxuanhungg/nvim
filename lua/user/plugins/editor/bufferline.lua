return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  opts = {
    options = {
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { "H", "<cmd> BufferLineCyclePrev <cr>", desc = "Prev buffer " },
    { "L", "<cmd> BufferLineCycleNext <cr>", desc = "Next buffer" },
    { "Q", "<cmd> Bdelete <cr>", desc = "Close buffer" },
  },
}
