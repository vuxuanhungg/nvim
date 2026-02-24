-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = false, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        ["[c"] = {
          function() require("treesitter-context").go_to_context(vim.v.count1) end,
          desc = "Jump to upward context",
          silent = true,
        },
        ["<C-p>"] = { function() require("snacks.picker").smart() end, desc = "Smart find Files" },
        ["J"] = { "mzJ`z", desc = "Retain cursor position on line join" },
        ["W"] = { ":noautocmd w<CR>", desc = "Save without formatting" },
        ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down", silent = true },
        ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up", silent = true },
        ["<A-J>"] = { "yyp", desc = "Copy line down", silent = true },
        ["<A-K>"] = { "yyP", desc = "Copy line up", silent = true },
      },
      v = {
        ["<"] = { "<gv", desc = "Indent left" },
        [">"] = { ">gv", desc = "Indent right" },
        ["<A-j>"] = { ":m '>+1<CR>gv-gv", desc = "Move block down", silent = true },
        ["<A-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move block up", silent = true },
        ["<A-J>"] = { "yPgv", desc = "Copy block down", silent = true },
        ["<A-K>"] = { "y'>pgv", desc = "Copy block up", silent = true },
      },
    },
    autocmds = {
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
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
          callback = function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd "tabdo wincmd ="
            vim.cmd("tabnext " .. current_tab)
          end,
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
