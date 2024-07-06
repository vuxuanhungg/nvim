return {
  ---------- Global utilities ----------

  -- File explorer
  { import = "user.plugins.editor.neo-tree" },

  -- Fuzzy finder
  { import = "user.plugins.editor.telescope" },
  { import = "user.plugins.editor.fzf-lua" },

  -- Syntax highlighter
  { import = "user.plugins.editor.treesitter" },

  -- Buffer & statusline
  { import = "user.plugins.editor.harpoon" },
  { import = "user.plugins.editor.lualine" },

  -- Keymaps helper
  { import = "user.plugins.editor.which-key" },

  -- Git
  { import = "user.plugins.editor.gitsigns" },
  { import = "user.plugins.editor.fugitive" },

  {
    -- Search & replace
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = { { "<leader>S", "<cmd> Spectre <cr>", desc = "Spectre" } },
  },

  ---------- Buffer-scope utilities ----------

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
    -- Highlight word under cursor
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- Show indent guides
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      show_trailing_blankline_indent = false,
    },
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

  ---------- Others ----------

  -- Welcome screen
  { import = "user.plugins.editor.alpha" },

  {
    -- Preview markdown in browser
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn",
    ft = "markdown",
  },
  {
    -- Prevent opening files in a mini window (help, aerial, fugitive, etc.)
    "stevearc/stickybuf.nvim",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
  },
}
