return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
    {
      "SmiteshP/nvim-navic",
      opts = {
        click = true,
        lsp = {
          auto_attach = true,
          preference = { "volar", "vtsls" },
        },
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

    -- Create hl_group so that we can easily update it afterword
    vim.api.nvim_set_hl(0, "lualine_winbar", { link = "Comment" })

    lualine.setup({
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          winbar = {
            "help",
            "alpha",
            "neo-tree",
            "fugitive",
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
          { filepath, color = "lualine_winbar" },
          { "navic", color = "lualine_winbar" },
        },
      },
      inactive_winbar = {
        lualine_a = {
          { filepath, color = "lualine_winbar" },
          { "navic", color = "lualine_winbar" },
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
        -- Reference: https://www.reddit.com/r/neovim/comments/xy0tu1/cmdheight0_recording_macros_message/
        local timer = vim.uv.new_timer()
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
