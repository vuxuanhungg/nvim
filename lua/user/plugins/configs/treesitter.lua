return {
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
}
