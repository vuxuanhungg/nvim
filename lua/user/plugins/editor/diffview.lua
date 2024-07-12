return {
  "sindrets/diffview.nvim",
  config = function()
    local actions = require("diffview.actions")

    require("diffview").setup({
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      file_panel = {
        win_config = {
          width = 40,
        },
      },
      keymaps = {
        view = {
          ["[F"] = false,
          ["]F"] = false,
          ["gf"] = false,
          ["<C-w><C-f>"] = false,
          ["<C-w>gf"] = false,
          { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
          ["<leader>b"] = false,
          ["g<C-x>"] = false,
          { "n", "<C-g>", actions.cycle_layout, { desc = "Cycle through available layouts" } },
        },
        file_panel = {
          ["[F"] = false,
          ["]F"] = false,
          ["gf"] = false,
          ["<C-w><C-f>"] = false,
          ["<C-w>gf"] = false,
          { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
          ["<leader>b"] = false,
          ["g<C-x>"] = false,
          { "n", "<C-g>", actions.cycle_layout, { desc = "Cycle through available layouts" } },
          { "n", "gs", "<cmd> Git <bar> wincmd J <cr>", { desc = "Show all status" } },
          { "n", "cc", "<cmd> Git commit <bar> wincmd J <cr>", { desc = "Commit staged changes" } },
          { "n", "ca", "<cmd> Git commit --amend <bar> wincmd J <cr>", { desc = "Amend the last commit" } },
        },
        file_history_panel = {
          ["[F"] = false,
          ["]F"] = false,
          ["gf"] = false,
          ["<C-w><C-f>"] = false,
          ["<C-w>gf"] = false,
          { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
          ["<leader>b"] = false,
          ["g<C-x>"] = false,
          { "n", "<C-g>", actions.cycle_layout, { desc = "Cycle through available layouts" } },
        },
      },
    })
  end,
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
}
