---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    options = {
      opt = {
        wrap = true,
      },
    },
    filetypes = {
      pattern = {
        ["%.env%.[%w_.-]+"] = "sh",
        [".*/kitty/.+%.conf"] = "bash",
      },
    },
    mappings = {
      n = {
        ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<C-p>"] = { function() require("snacks.picker").smart() end, desc = "Smart find Files" },
        ["J"] = { "mzJ`z", desc = "Retain cursor position on line join" },
        ["W"] = { ":noautocmd w<CR>", desc = "Save without formatting" },
        ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down", silent = true },
        ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up", silent = true },
        ["<A-J>"] = { "yyp", desc = "Copy line down", silent = true },
        ["<A-K>"] = { "yyP", desc = "Copy line up", silent = true },
        ["[c"] = {
          function() require("treesitter-context").go_to_context(vim.v.count1) end,
          desc = "Jump to upward context",
          silent = true,
        },
      },
      v = {
        ["<A-j>"] = { ":m '>+1<CR>gv-gv", desc = "Move block down", silent = true },
        ["<A-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move block up", silent = true },
        ["<A-J>"] = { "yPgv", desc = "Copy block down", silent = true },
        ["<A-K>"] = { "y'>pgv", desc = "Copy block up", silent = true },
        ["<"] = { "<gv", desc = "Indent left" },
        [">"] = { ">gv", desc = "Indent right" },
      },
      c = {
        -- https://github.com/mhinz/vim-galore?tab=readme-ov-file#saner-command-line-history
        ["<C-n>"] = { 'wildmenumode() ? "\\<C-n>" : "\\<Down>"', expr = true },
        ["<C-p>"] = { 'wildmenumode() ? "\\<C-p>" : "\\<Up>"', expr = true },
      },
    },
    autocmds = {
      restore_session = {
        -- https://docs.astronvim.com/recipes/sessions/#automatically-restore-previous-session
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true,
          callback = function()
            if vim.fn.argc(-1) == 0 then
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        },
      },
      set_kitty_spacing = {
        {
          event = "VimEnter",
          desc = "Set kitty spacing for neovim",
          command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0 margin=0",
        },
      },
      reset_kitty_spacing = {
        {
          event = "VimLeavePre",
          desc = "Reset kitty spacing on quit",
          command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default margin=default",
        },
      },
      resize_splits = {
        -- https://www.lazyvim.org/configuration/general#auto-commands
        {
          event = "VimResized",
          desc = "Resize splits on window resize",
          callback = require("utils").equalize_windows,
        },
      },
      mason_hide_cursorline = {
        {
          event = "FileType",
          pattern = "mason",
          desc = "Hide cursorline in Mason",
          callback = function() vim.opt_local.cursorline = false end,
        },
      },
    },
  },
}
