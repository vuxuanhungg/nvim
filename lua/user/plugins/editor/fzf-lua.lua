return {
  "ibhagwan/fzf-lua",
  dependencies = {
    {
      "junegunn/fzf",
      build = "./install --bin",
      enabled = Settings.use_fzf and not vim.fn.executable("fzf"),
    },
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
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
    oldfiles = {
      cwd_only = true,
    },
    grep = {
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
      },
    },
    lsp = {
      symbols = {
        symbol_icons = Settings.icons.kinds,
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
  },
  cmd = "FzfLua",
  keys = {
    { "<leader>fa", "<cmd> FzfLua <cr>", desc = "Find all" },
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
  },
  enabled = Settings.use_fzf,
}
