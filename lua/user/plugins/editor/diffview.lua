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
          ["<C-w><C-f>"] = false,
          ["<C-w>gf"] = false,
          { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
          ["<leader>b"] = false,
          ["g<C-x>"] = false,
          { "n", "<C-g>", actions.cycle_layout, { desc = "Cycle through available layouts" } },
          { "n", "gs", "<cmd> Git <bar> wincmd J <cr>", { desc = "Git status" } },
          { "n", "cc", "<cmd> Git commit <bar> wincmd J <cr>", { desc = "Commit staged changes" } },
          { "n", "ca", "<cmd> Git commit --amend <bar> wincmd J <cr>", { desc = "Amend the last commit" } },
        },
        file_history_panel = {
          ["[F"] = false,
          ["]F"] = false,
          ["<C-w><C-f>"] = false,
          ["<C-w>gf"] = false,
          { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
          ["<leader>b"] = false,
          ["g<C-x>"] = false,
          { "n", "<C-g>", actions.cycle_layout, { desc = "Cycle through available layouts" } },
        },
      },
      hooks = {
        view_enter = function()
          vim.opt_local.foldenable = false
          require("lualine").hide({
            place = { "winbar" },
          })
        end,
        view_leave = function()
          require("lualine").hide({ unhide = true })
        end,
      },
    })
  end,
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = function()
    local is_open = function()
      return package.loaded["diffview"] and require("diffview.lib").get_current_view()
    end

    local toggle_diffview = function()
      if is_open() then
        vim.cmd("DiffviewClose")
      else
        vim.cmd("DiffviewOpen")
      end
    end

    ---@param path "buffer" | "branch"
    local toggle_history = function(path)
      local arg = path == "buffer" and " %" or ""

      if is_open() then
        vim.cmd("DiffviewClose")
      else
        vim.cmd("DiffviewFileHistory" .. arg)
      end
    end

    local toggle_file_history = function()
      toggle_history("buffer")
    end
    local toggle_branch_history = function()
      toggle_history("branch")
    end

    return {
      { "<leader>gd", toggle_diffview, desc = "Toggle Diffview" },
      { "<leader>gh", toggle_file_history, desc = "Toggle file history" },
      { "<leader>gH", toggle_branch_history, desc = "Toggle branch history" },
    }
  end,
}
