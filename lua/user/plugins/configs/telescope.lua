return {
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = "  ",
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        sorting_strategy = "ascending",
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
          },
          n = { q = actions.close },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
