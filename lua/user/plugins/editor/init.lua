return {
  ---------- Global utilities ----------

  -- File explorer
  { import = "user.plugins.editor.neo-tree" },

  -- Fuzzy finder
  { import = "user.plugins.editor.fzf-lua" },

  -- Syntax highlighter
  { import = "user.plugins.editor.treesitter" },

  -- Buffer & statusline
  { import = "user.plugins.editor.lualine" },
  { import = "user.plugins.editor.bufdelete" },
  { import = "user.plugins.editor.harpoon" },

  -- Keymaps helper
  { import = "user.plugins.editor.which-key" },

  -- Git
  { import = "user.plugins.editor.gitsigns" },
  { import = "user.plugins.editor.fugitive" },
  { import = "user.plugins.editor.diffview" },

  {
    -- Search & replace
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = { { "<leader>S", "<cmd> Spectre <cr>", desc = "Spectre" } },
  },

  -- Session management
  { import = "user.plugins.editor.persistence" },

  ---------- Buffer-scope utilities ----------

  -- Highlight word under cursor
  { import = "user.plugins.editor.illuminate" },

  -- Symbols outline
  { import = "user.plugins.editor.aerial" },

  -- Todo comments
  { import = "user.plugins.editor.todo-comments" },

  {
    -- Auto set indenting-related options
    "tpope/vim-sleuth",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- Show indent guides
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- Color highlighter
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "virtualtext",
        names = false,
        tailwind = true,
      },
    },
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- Preview markdown in browser
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn",
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_combine_preview = 1
    end,
    ft = "markdown",
  },
}
