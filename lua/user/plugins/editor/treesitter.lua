return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "vim",
        "vimdoc",
        "query",
        "lua",

        "bash",
        "html",
        "css",
        "scss",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "pug",
        "markdown",
        "markdown_inline",
        "python",
        "prisma",
      },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
        enable_close_on_slash = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
  cmd = { "TSInstall", "TSInstallInfo", "TSModuleInfo" },
  event = { "BufReadPost", "BufNewFile" },
}
