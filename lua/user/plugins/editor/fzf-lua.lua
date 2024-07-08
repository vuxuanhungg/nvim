return {
  "ibhagwan/fzf-lua",
  dependencies = {
    { "junegunn/fzf", build = "./install --bin", enabled = Settings.use_fzf },
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("fzf-lua").setup({
      "default-title",
      winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        on_create = function()
          vim.keymap.set("t", "<C-cr>", "<C-v>")
        end,
      },
      files = {
        cwd_prompt = false,
        git_icons = false,
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
        },
        file_ignore_patterns = {
          "node_modules/",
          ".next/",
          "venv/",
          "__pycache__/",
        },
      },
      grep = {
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
        },
      },
      lsp = {
        symbols = {
          symbol_icons = require("lspkind").symbol_map,
        },
        jump_to_single_result = true,
      },
      fzf_colors = {
        gutter = "-1",
      },
      keymap = {
        fzf = {
          ["ctrl-n"] = "down",
          ["ctrl-p"] = "up",
          ["ctrl-j"] = "next-history",
          ["ctrl-k"] = "previous-history",
        },
      },
    })
  end,
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
    { "<leader>fx", "<cmd> FzfLua diagnostics_document <cr>", desc = "Document diagnostics" },
    { "<leader>fX", "<cmd> FzfLua diagnostics_workspace <cr>", desc = "Workspace diagnostics" },
    { "<leader>fgs", "<cmd> FzfLua git_status <cr>", desc = "Git status" },
    { "<leader>fgc", "<cmd> FzfLua git_commits <cr>", desc = "Git commits" },
  },
  enabled = Settings.use_fzf,
}
