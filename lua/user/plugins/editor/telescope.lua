return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      enabled = not Settings.use_fzf,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = "  ",
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        sorting_strategy = "ascending",
        scroll_strategy = "limit",
        layout_config = {
          width = 0.8,
          height = 0.8,
          horizontal = {
            prompt_position = "top",
          },
        },
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
          ".next/",
          "venv/",
          "__pycache__/",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<C-cr>"] = actions.file_vsplit,
            ["<C-u>"] = false,
            ["<ScrollWheelUp>"] = actions.move_selection_previous,
            ["<ScrollWheelDown>"] = actions.move_selection_next,
          },
          n = {
            q = actions.close,
            ["<ScrollWheelUp>"] = actions.preview_scrolling_up,
            ["<ScrollWheelDown>"] = actions.preview_scrolling_down,
          },
        },
      },
      pickers = {
        oldfiles = {
          only_cwd = true,
        },
      },
    })

    telescope.load_extension("fzf")
  end,
  cmd = "Telescope",
  keys = {
    { "<leader>fa", "<cmd> Telescope <cr>", desc = "Find all" },
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
    { "<leader>fx", "<cmd> Telescope diagnostics bufnr=0 <cr>", desc = "Document diagnostics" },
    { "<leader>fX", "<cmd> Telescope diagnostics <cr>", desc = "Workspace diagnostics" },
  },
  enabled = not Settings.use_fzf,
}
