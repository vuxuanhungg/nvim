return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
    {
      "SmiteshP/nvim-navic",
      opts = {
        click = true,
        -- TODO: Extract icons to separate file
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      },
    },
  },
  config = function()
    local lualine = require("lualine")

    local macro_record = function()
      local register = vim.fn.reg_recording()
      if register == "" then
        return ""
      else
        return "Recording @" .. register
      end
    end

    local function filepath()
      local path = vim.fn.expand("%")
      path = path:gsub("/", " > ")
      return path
    end

    local harpoon2 = { sections = { lualine_a = { "filetype" } }, filetypes = { "harpoon" } }

    lualine.setup({
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "help",
          "alpha",
          "fugitive",
          winbar = {
            "neo-tree",
            "gitcommit",
          },
        },
      },
      sections = {
        lualine_c = {
          { "searchcount" },
          { macro_record, type = "lua_expr" },
        },
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            padding = 2,
            symbols = {
              alternate_file = "",
            },
            section_separators = { left = "", right = "" },
            filetype_names = {
              ["neo-tree"] = "Neo-tree",
              lazy = "Lazy",
              mason = "Mason",
              harpoon = "Harpoon",
              aerial = "Aerial",
              spectre_panel = "Spectre",
            },
          },
        },
      },
      winbar = {
        lualine_a = {
          { filepath, color = Settings.colorscheme == "vscode" and { fg = "#888888", bg = "NONE" } or "Comment" },
          { "navic", color = Settings.colorscheme == "vscode" and { fg = "#888888", bg = "NONE" } or "Comment" },
        },
      },
      extensions = { "lazy", "mason", "neo-tree", "trouble", "fugitive", "aerial", harpoon2 },
    })

    ---------- Refresh lualine correctly ----------
    local autocmd = vim.api.nvim_create_autocmd
    local refresh = function()
      lualine.refresh({
        place = { "statusline" },
      })
    end

    autocmd("RecordingEnter", { callback = refresh })
    autocmd("RecordingLeave", {
      callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(50, 0, vim.schedule_wrap(refresh))
      end,
    })
  end,
  event = "VeryLazy",
  keys = {
    { "H", "<cmd> bprevious <cr>", desc = "Prev buffer " },
    { "L", "<cmd> bnext <cr>", desc = "Next buffer" },
    { "Q", "<cmd> Bdelete <cr>", desc = "Close buffer" },
  },
}
