return {
  "famiu/bufdelete.nvim",
  config = function()
    -- Close other buffers, except `neo-tree`
    local delete_other_bufs = function()
      local bufs = vim.api.nvim_list_bufs()
      local current_buf = vim.api.nvim_get_current_buf()

      for _, buf in ipairs(bufs) do
        local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
        if buf ~= current_buf and ft ~= "neo-tree" then
          require("bufdelete").bufdelete(buf)
        end
      end
    end

    vim.api.nvim_create_user_command("BdeleteOthers", delete_other_bufs, { desc = "Close other buffers" })
  end,
  cmd = { "Bdelete", "BdeleteOthers" },
  keys = {
    { "[b", "<cmd> bprevious <cr>", desc = "Prev buffer " },
    { "]b", "<cmd> bnext <cr>", desc = "Next buffer" },
    { "H", "<cmd> bprevious <cr>", desc = "Prev buffer " },
    { "L", "<cmd> bnext <cr>", desc = "Next buffer" },
    { "Q", "<cmd> Bdelete <cr>", desc = "Close buffer" },
    { "<leader>bd", "<cmd> BdeleteOthers <cr>", desc = "Close other buffers" },
  },
}
