---@type LazySpec
return {
  ----- Override -----
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        height = 0.8,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 250,
      },
    },
  },
}
