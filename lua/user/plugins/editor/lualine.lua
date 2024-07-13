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
        icons = Settings.icons.kinds,
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

    local fugitive = {
      sections = {
        lualine_a = {
          function()
            return " " .. vim.fn.FugitiveHead()
          end,
        },
        lualine_z = { "location" },
      },

      filetypes = { "fugitive" },
    }

    local harpoon = {
      sections = {
        lualine_a = {
          function()
            return "󱂬 Harpoon"
          end,
        },
        lualine_z = {
          "location",
        },
      },
      filetypes = { "harpoon" },
    }

    local aerial = {
      sections = {
        lualine_a = {
          function()
            return " Aerial"
          end,
        },
        lualine_z = {
          "location",
        },
      },
      filetypes = { "aerial" },
    }

    local winbar_a = {
      {
        "filename",
        path = 1,
        fmt = function(str)
          return str:gsub("/", " > ")
        end,
        color = "lualine_winbar",
      },
      { "navic", color = "lualine_winbar" },
    }

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
            "aerial",
          },
        },
      },
      sections = {
        lualine_b = {
          { "branch", icon = "" },
          "diff",
          {
            "diagnostics",
            symbols = {
              error = Settings.icons.diagnostics.Error,
              warn = Settings.icons.diagnostics.Warn,
              info = Settings.icons.diagnostics.Info,
              hint = Settings.icons.diagnostics.Hint,
            },
          },
        },
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
            symbols = { alternate_file = "" },
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
        lualine_a = winbar_a,
      },
      inactive_winbar = {
        lualine_a = winbar_a,
      },
      extensions = { "lazy", "mason", "neo-tree", fugitive, aerial, harpoon },
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
