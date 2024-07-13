local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

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

autocmd("FileType", {
  desc = "Prevent indenting when pressing colon in Python files",
  group = augroup("python_no_colon_indent", { clear = true }),
  pattern = "python",
  callback = function()
    vim.opt_local.indentkeys:remove({ "<:>" })
  end,
})

autocmd("FileType", {
  desc = "Prevent indenting when pressing bracket in Vue files",
  group = augroup("vue_no_bracket_indent", { clear = true }),
  pattern = "vue",
  callback = function()
    vim.opt_local.indentkeys:remove({ "{", "}" })
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

-- Reference: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/editing-support/vim-visual-multi/init.lua
autocmd("User", {
  desc = "Avoid spurious 'hit-enter-prompt' when exiting vim-visual-multi",
  pattern = "visual_multi_exit",
  callback = function()
    local cmdheight = vim.api.nvim_get_option_value("cmdheight", {})
    -- Temporarily set cmdheight to 1, then set back to previous value
    vim.opt.cmdheight = 1
    vim.schedule(function()
      vim.opt.cmdheight = cmdheight
    end)
  end,
})
