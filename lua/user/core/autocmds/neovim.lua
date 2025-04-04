local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

if vim.env.TERM == "kitty" then
  autocmd("VimEnter", {
    desc = "Set kitty spacing for neovim",
    group = augroup("nvim_set_kitty_spacing", { clear = true }),
    command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0 margin=0",
  })
end

if vim.env.TERM == "kitty" then
  autocmd("VimLeavePre", {
    desc = "Reset kitty spacing on quit",
    group = augroup("reset_kitty_spacing", { clear = true }),
    command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default margin=default",
  })
end

-- Reference: https://www.lazyvim.org/configuration/general#auto-commands
autocmd("VimResized", {
  desc = "Resize splits on window resize",
  group = augroup("splits_resize", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
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
    if cmdheight < 1 then
      -- Temporarily set cmdheight to 1, then set back to previous value
      vim.opt.cmdheight = 1
      vim.schedule(function()
        vim.opt.cmdheight = cmdheight
      end)
    end
  end,
})
