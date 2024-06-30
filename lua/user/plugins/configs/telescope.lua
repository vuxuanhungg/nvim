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
          ".venv/",
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
            ["<ScrollWheelUp>"] = actions.move_selection_previous,
            ["<ScrollWheelDown>"] = actions.move_selection_next,
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
}
