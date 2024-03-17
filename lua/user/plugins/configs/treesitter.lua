return {
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "bash",
        "html",
        "css",
        "json",
        "javascript",
        "typescript",
        "tsx",
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
