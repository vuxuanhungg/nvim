return {
  "tpope/vim-fugitive",

  config = function()
    ---------- Extended ----------
    vim.api.nvim_create_user_command("Ghistory", function()
      vim.cmd("vert G log -p " .. vim.api.nvim_buf_get_name(0))
    end, { desc = "View commit history of current buffer in a vertical split" })
  end,

  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRemove",
    "GRename",
    "Glgrep",
    "Gedit",
    "Ghistory",
  },

  keys = function()
    local toggle_fugitive = function()
      if not require("user.utils").is_git_repo() then
        vim.notify("File does not belong to a Git repository", vim.log.levels.ERROR, { title = "futigive.vim" })
        return
      end

      local winids = vim.api.nvim_list_wins()
      for _, id in pairs(winids) do
        local status = pcall(vim.api.nvim_win_get_var, id, "fugitive_status")
        if status then
          vim.api.nvim_win_close(id, false)
          return
        end
      end
      vim.cmd.Git()
    end

    return {
      { "<leader>g", toggle_fugitive, desc = "(Git) Fugitive" },
    }
  end,
}
