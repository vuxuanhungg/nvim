return {
  ---------- Global utilities ----------
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
    event = function()
      return require("user.utils").should_plugin_load(
        Settings.buffers_management == "traditional",
        { "BufReadPost", "BufNewFile" }
      )
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("user.plugins.configs.harpoon").config,
    event = function()
      return require("user.utils").should_plugin_load(Settings.buffers_management == "harpoon")
    end,
  },
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    config = require("user.plugins.configs.lualine").config,
    event = "VeryLazy",
  },
  {
    -- Search & replace
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
  },

  ---------- Buffer-scope utilities ----------
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

  ---------- Git ----------
  {
    "lewis6991/gitsigns.nvim",
    opts = require("user.plugins.configs.gitsigns").opts,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-fugitive",
    config = require("user.plugins.configs.fugitive").config,
    cmd = require("user.plugins.configs.fugitive").cmd,
    ft = "fugitive",
  },

  ---------- Other features (nice to have) ----------
  {
    -- Welcome screen
    "goolord/alpha-nvim",
    config = require("user.plugins.configs.alpha").config,
  },
  {
    -- Preview markdown in browser
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn",
    ft = "markdown",
  },
  {
    -- HACK: Prevent opening files in a mini window (help, aerial, fugitive, etc.)
    "stevearc/stickybuf.nvim",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
  },
}
