return {
  {
    "max397574/better-escape.nvim",
    opts = {},
    event = "InsertEnter",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.g.vscode,
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
    event = "InsertEnter",
  },
  {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
    keys = { { "<leader>sm", "<cmd> MaximizerToggle <cr>", desc = "Maximize window" } },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = function()
      return {
        mappings = {
          basic = false,
          extra = false,
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    keys = {
      { "<C-/>", "<cmd> lua require('Comment.api').toggle.linewise.current() <cr>", desc = "Toggle comment" },
      {
        "<C-/>",
        "<esc><cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode()) <cr>",
        mode = "v",
        desc = "Toggle comment",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-cmdline",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = require("user.plugins.configs.cmp").config,
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "folke/which-key.nvim",
    config = require("user.plugins.configs.which-key").config,
    event = "VeryLazy",
  },
}
