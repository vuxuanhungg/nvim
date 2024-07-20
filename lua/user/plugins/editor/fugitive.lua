return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gread", "Gwrite" },
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
      { "<leader>gs", toggle_fugitive, desc = "Toggle Fugitive" },
    }
  end,
}
