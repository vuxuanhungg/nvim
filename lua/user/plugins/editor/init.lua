return {
  ---------- Global utilities ----------

  -- File explorer
  { import = "user.plugins.editor.neo-tree" },

  -- Fuzzy finder
  { import = "user.plugins.editor.telescope", enabled = not Settings.use_fzf },
  { import = "user.plugins.editor.fzf-lua", enabled = Settings.use_fzf },

  -- Syntax highlighter
  { import = "user.plugins.editor.treesitter" },

  -- Buffer & status line
  { import = "user.plugins.editor.harpoon" },
  { import = "user.plugins.editor.bufferline" },
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
    -- VSCode-like winbar
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup({
        attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
      })
    end,
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
