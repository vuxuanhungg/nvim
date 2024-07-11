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
}
