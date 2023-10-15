return {
  {
    -- File explorer
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = require("user.plugins.configs.neo-tree").opts,
    cmd = "Neotree",
  },
  {
    -- Fuzzy finder
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    config = require("user.plugins.configs.telescope").config,
    cmd = "Telescope",
  },
  {
    -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = require("user.plugins.configs.treesitter").config,
    cmd = { "TSInstall", "TSModuleInfo", "TSUpdateSync" },
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- Buffer line
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "famiu/bufdelete.nvim",
    },
    opts = require("user.plugins.configs.bufferline").opts,
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    config = require("user.plugins.configs.lualine").config,
    event = "VeryLazy",
  },
  {
    -- Symbols outline
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "onsails/lspkind.nvim",
    },
    config = require("user.plugins.configs.aerial").config,
    cmd = "AerialToggle",
  },
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
    -- Highlight todos
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("user.plugins.configs.todo-comments").opts,
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = require("user.plugins.configs.gitsigns").opts,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  {
    -- Search & replace
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
  },
  {
    -- Welcome screen
    "goolord/alpha-nvim",
    config = require("user.plugins.configs.alpha").config,
  },
  {
    -- Lock buffer to a window
    "stevearc/stickybuf.nvim",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    -- Preview markdown in browser
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn",
    ft = "markdown",
  },
}
