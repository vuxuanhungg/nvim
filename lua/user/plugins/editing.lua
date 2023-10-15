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
  { "szw/vim-maximizer", cmd = "MaximizerToggle" },
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
    event = { "BufReadPost", "BufNewFile" },
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
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = require("user.plugins.configs.cmp").config,
    event = "InsertEnter",
  },
  {
    "folke/which-key.nvim",
    config = require("user.plugins.configs.which-key").config,
    event = "VeryLazy",
  },
}
