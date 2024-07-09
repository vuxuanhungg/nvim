local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("FileType", {
  pattern = { "neo-tree" },
  callback = function()
    local status_ok, ufo = pcall(require, "ufo")
    if status_ok then
      ufo.detach()
    end
  end,
})

autocmd("FileType", {
  desc = "Prevent indenting when pressing colon in Python files",
  group = augroup("python_no_indent_on_colon_press", { clear = true }),
  pattern = "python",
  callback = function()
    vim.opt_local.indentkeys:remove({ "<:>" })
  end,
})

autocmd("FileType", {
  desc = "Don't insert comment leader after pressing o/O",
  group = augroup("no_insert_comment_leader", { clear = true }),
  pattern = { "c", "lua", "javascript", "typescript" },
  callback = function()
    vim.opt_local.formatoptions:remove({ "o" })
  end,
})

autocmd("BufWinEnter", {
  desc = "Make q close help, quickfix, notify, fugitive",
  group = augroup("q_close_windows", { clear = true }),
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if vim.tbl_contains({ "help", "quickfix", "nofile", "nowrite" }, buftype) and vim.fn.maparg("q", "n") == "" then
      vim.keymap.set("n", "q", "<cmd> close <cr>", {
        desc = "Close window",
        buffer = args.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
})

autocmd("VimEnter", {
  desc = "Set kitty spacing for neovim",
  group = augroup("nvim_set_kitty_spacing", { clear = true }),
  command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  desc = "Reset kitty spacing on quit",
  group = augroup("reset_kitty_spacing", { clear = true }),
  command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default margin=default",
})
