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
    keys = { { "<leader>e", "<cmd> Neotree toggle <cr>", desc = "NeoTree" } },
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
        enabled = not Settings.use_fzf,
      },
    },
    config = require("user.plugins.configs.telescope").config,
    cmd = "Telescope",
    keys = {
      { "<C-p>", "<cmd> Telescope find_files <cr>", desc = "Find files" },
      { "<leader>ff", "<cmd> Telescope find_files <cr>", desc = "Find files" },
      { "<leader>fF", "<cmd> Telescope find_files no_ignore=true hidden=true <cr>", desc = "Find files (all)" },
      { "<leader>fo", "<cmd> Telescope oldfiles <cr>", desc = "Recent files" },
      { "<leader>fw", "<cmd> Telescope live_grep <cr>", desc = "Find words" },
      { "<leader>fb", "<cmd> Telescope buffers <cr>", desc = "Find buffers" },
      { "<leader>fc", "<cmd> Telescope commands <cr>", desc = "Find commands" },
      { "<leader>fC", "<cmd> Telescope colorscheme <cr>", desc = "Find colorschemes" },
      { "<leader>fk", "<cmd> Telescope keymaps <cr>", desc = "Find keymaps" },
      { "<leader>fr", "<cmd> Telescope resume <cr>", desc = "Resume last search" },
      { "<leader>fs", "<cmd> Telescope lsp_document_symbols <cr>", desc = "Document symbols" },
      { "<leader>fS", "<cmd> Telescope lsp_workspace_symbols <cr>", desc = "Workspace symbols" },
    },
    enabled = not Settings.use_fzf,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      { "junegunn/fzf", build = "./install --bin", enabled = Settings.use_fzf },
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = require("user.plugins.configs.fzf").config,
    cmd = "FzfLua",
    keys = {
      { "<C-p>", "<cmd> FzfLua files <cr>", desc = "Find files" },
      { "<leader>ff", "<cmd> FzfLua files <cr>", desc = "Find files" },
      { "<leader>fo", "<cmd> FzfLua oldfiles <cr>", desc = "Recent files" },
      { "<leader>fw", "<cmd> FzfLua live_grep <cr>", desc = "Find words" },
      { "<leader>fb", "<cmd> FzfLua buffers <cr>", desc = "Find buffers" },
      { "<leader>fc", "<cmd> FzfLua commands <cr>", desc = "Find commands" },
      { "<leader>fC", "<cmd> FzfLua colorschemes <cr>", desc = "Find colorschemes" },
      { "<leader>fk", "<cmd> FzfLua keymaps <cr>", desc = "Find keymaps" },
      { "<leader>fr", "<cmd> FzfLua resume <cr>", desc = "Resume last search" },
      { "<leader>fs", "<cmd> FzfLua lsp_document_symbols <cr>", desc = "Document symbols" },
      { "<leader>fS", "<cmd> FzfLua lsp_workspace_symbols <cr>", desc = "Workspace symbols" },
    },
    enabled = Settings.use_fzf,
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
    keys = {
      { "H", "<cmd> BufferLineCyclePrev <cr>", desc = "Prev buffer " },
      { "L", "<cmd> BufferLineCycleNext <cr>", desc = "Next buffer" },
      { "Q", "<cmd> Bdelete <cr>", desc = "Close buffer" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("user.plugins.configs.harpoon").config,
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
    keys = { { "<leader>S", "<cmd> Spectre <cr>", desc = "Spectre" } },
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
    keys = { { "<leader>uo", "<cmd> AerialToggle <cr>", desc = "Symbols outline" } },
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
    keys = {
      {
        "<leader>ft",
        Settings.use_fzf and function()
          require("todo-comments.fzf").todo()
        end or "<cmd> TodoTelescope <cr>",
        desc = "Find todos",
      },
    },
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
    keys = require('user.plugins.configs.fugitive').keys,
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
