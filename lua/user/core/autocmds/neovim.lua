local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("UIEnter", {
  desc = "Open Neo-tree on startup with directory",
  group = augroup("open_neotree", { clear = true }),
  nested = true,
  callback = function()
    local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0))
    if stats and stats.type == "directory" then
      vim.api.nvim_command("Neotree show dir=%:p:h")
    end
  end,
})

autocmd("FileType", {
  desc = "Don't list Fugitive as buffer",
  group = augroup("unlist_buffers", { clear = true }),
  pattern = "fugitive",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

autocmd("FileType", {
  desc = "Don't show cursorline on Mason",
  group = augroup("mason_hide_cursorline", { clear = true }),
  pattern = "mason",
  callback = function()
    vim.opt_local.cursorline = false
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
  desc = "Make q close help, notify, fugitive",
  group = augroup("q_close_windows", { clear = true }),
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if vim.tbl_contains({ "help", "nofile", "nowrite" }, buftype) and vim.fn.maparg("q", "n") == "" then
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
  callback = function()
    os.execute("kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default margin=default")

    -- HACK: Avoid uv_close: Assertion '!uv__is_closing(handle)' failed
    -- References: https://github.com/neovim/neovim/issues/21856#issuecomment-1514723887
    vim.cmd("sleep 10m")
  end,
})
