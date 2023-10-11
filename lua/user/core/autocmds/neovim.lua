local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("UIEnter", {
  desc = "Change working directory to the current file",
  group = augroup("change_directory", { clear = true }),
  pattern = "*",
  command = "cd %:p:h",
})

autocmd("UIEnter", {
  desc = "Open Neo-tree on startup with directory",
  group = augroup("open_neotree", { clear = true }),
  nested = true,
  callback = function()
    local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0))
    if stats and stats.type == "directory" then
      vim.api.nvim_command("Neotree show")
    end
  end,
})

autocmd("BufWinEnter", {
  desc = "Save buffer without formatting",
  group = augroup("noautocmd_save", { clear = true }),
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    -- Exclude Telescope, Rename, etc.
    if not vim.tbl_contains({ "prompt" }, buftype) then
      local save_without_formatting = function()
        vim.cmd("noautocmd write")
      end

      vim.keymap.set(
        "i",
        "<C-k>s",
        save_without_formatting,
        { desc = "Save buffer without formatting", buffer = args.buf, silent = true, nowait = true }
      )
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

autocmd("BufWinEnter", {
  desc = "Make q close help, notify",
  group = augroup("q_close_windows", { clear = true }),
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if vim.tbl_contains({ "help", "notify" }, buftype) and vim.fn.maparg("q", "n") == "" then
      vim.keymap.set("n", "q", "<cmd> close <cr>", {
        desc = "Close window",
        buffer = args.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
})
