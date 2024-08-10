-- Trim icons whitespace
local icons = vim.deepcopy(Settings.icons.kinds)
for k, v in pairs(icons) do
  icons[k] = v:gsub(" ", "")
end

return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    layout = {
      width = 30,
      placement = "edge",
      default_direction = "right",
      preserve_equality = true,
      win_opts = {
        statuscolumn = " ",
      },
    },
    attach_mode = "global",
    show_guides = true,
    icons = icons,
    filter_kind = false,
    lsp = {
      priority = {
        volar = 11,
      },
    },
  },
  cmd = "AerialToggle",
  keys = {
    { "<leader>uo", "<cmd> AerialToggle <cr>", desc = "Symbols outline" },
  },
}
