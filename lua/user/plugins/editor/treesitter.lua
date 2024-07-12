return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    { "windwp/nvim-ts-autotag", opts = {} },
    { "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
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
        "prisma",
        "markdown",
        "markdown_inline",
        "python",
        "toml",
        "yaml",
      },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Select outter part of a function definition" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a function definition" },
            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
          },
        },
      },
    })
  end,
  cmd = { "TSInstall", "TSInstallInfo", "TSModuleInfo" },
  event = { "BufReadPost", "BufNewFile" },
}
