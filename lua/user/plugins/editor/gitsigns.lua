return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame_opts = {
      delay = 300,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local bmap = require("user.utils").map(bufnr)

      local navigation = {
        next_hunk = function()
          if vim.wo.diff then
            return "]h"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end,
        prev_hunk = function()
          if vim.wo.diff then
            return "[h"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end,
      }

      local actions = {
        blame_line = function()
          gs.blame_line({ full = true })
        end,
        diff_this = function()
          gs.diffthis("~")
        end,
      }

      -- Navigation
      bmap("n", "]h", navigation.next_hunk, "Next hunk", { expr = true })
      bmap("n", "[h", navigation.prev_hunk, "Prev hunk", { expr = true })

      -- Actions
      bmap("n", "<leader>ub", gs.toggle_current_line_blame, "Toggle line blame")
      bmap("n", "<leader>hb", actions.blame_line, "Blame line")
      bmap("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
      bmap("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      bmap("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      bmap("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
      bmap("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      bmap("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
      bmap("n", "<leader>hd", gs.diffthis, "Diff against the index")
      bmap("n", "<leader>hD", actions.diff_this, "Diff against the last commit")
    end,
  },
  event = { "BufReadPre", "BufNewFile" },
}
