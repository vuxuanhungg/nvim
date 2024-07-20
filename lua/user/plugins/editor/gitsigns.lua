return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame_opts = {
      delay = 300,
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local bmap = require("user.utils").map(bufnr)

      ---------- Navigation ----------
      bmap("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, "Next hunk")

      bmap("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, "Previous hunk")

      ---------- Actions ----------
      local actions = {
        blame_line = function()
          gitsigns.blame_line({ full = true })
        end,
        diff_this = function()
          gitsigns.diffthis("~")
        end,
      }

      bmap("n", "<leader>ub", gitsigns.toggle_current_line_blame, "Toggle line blame")
      bmap("n", "<leader>hb", actions.blame_line, "Blame line")
      bmap("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
      bmap("n", "<leader>hs", gitsigns.stage_hunk, "Stage hunk")
      bmap("n", "<leader>hS", gitsigns.stage_buffer, "Stage buffer")
      bmap("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo stage hunk")
      bmap("n", "<leader>hr", gitsigns.reset_hunk, "Reset hunk")
      bmap("n", "<leader>hR", gitsigns.reset_buffer, "Reset buffer")
    end,
  },
  event = { "BufReadPre", "BufNewFile" },
}
