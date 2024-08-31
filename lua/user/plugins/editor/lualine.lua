local macro_record = {
  status = {
    function()
      local register = vim.fn.reg_recording()
      if register == "" then
        return ""
      else
        return "Recording @" .. register
      end
    end,
    type = "lua_expr",
  },
  update = function()
    local autocmd = vim.api.nvim_create_autocmd
    local refresh = function()
      require("lualine").refresh({
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
}

local neo_tree_offset = {
  function()
    return "󰉓  Neo-tree                           "
  end,
  color = "NormalNC",
  cond = function()
    return _G.neo_tree_open and not _G.diffview_open
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local components = {
      buffer = {
        "buffers",
        padding = 2,
        symbols = { alternate_file = "" },
        section_separators = { left = "", right = "" },
        buffers_color = {
          active = "lualine_b_normal",
          inactive = "lualine_buffers_inactive",
        },
        filetype_names = {
          ["neo-tree"] = "Neo-tree",
          lazy = "Lazy",
          mason = "Mason",
          harpoon = "Harpoon",
          aerial = "Aerial",
          spectre_panel = "Spectre",
        },
      },

      winbar = {
        {
          "filename",
          path = 1,
          fmt = function(str)
            return str:gsub("/", "  ")
          end,
          color = "lualine_winbar",
        },
      },

      diagnostics = {
        "diagnostics",
        symbols = {
          error = Settings.icons.diagnostics.Error,
          warn = Settings.icons.diagnostics.Warn,
          info = Settings.icons.diagnostics.Info,
          hint = Settings.icons.diagnostics.Hint,
        },
      },
    }

    local extensions = {
      aerial = {
        sections = {
          lualine_a = {
            function()
              return " Aerial"
            end,
          },
          lualine_x = { "searchcount" },
          lualine_z = { "location" },
        },
        filetypes = { "aerial" },
      },

      fugitive = {
        sections = {
          lualine_a = {
            function()
              return Settings.icons.git.Branch .. vim.fn.FugitiveHead()
            end,
          },
          lualine_z = { "location" },
        },
        filetypes = { "fugitive" },
      },

      harpoon = {
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
      },
    }

    lualine.setup({
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          winbar = {
            "",
            "git",
            "gitcommit",
            "gitrebase",
            "man",
            "help",
            "neo-tree",
            "fugitive",
            "aerial",
            "DiffviewFiles",
            "DiffviewFileHistory",
          },
        },
      },
      sections = {
        lualine_b = {
          { "b:gitsigns_head", icon = Settings.icons.git.Branch:gsub(" ", "") },
          components.diagnostics,
        },
        lualine_c = { "searchcount", macro_record.status },
      },
      tabline = {
        lualine_a = { neo_tree_offset },
        lualine_b = { components.buffer },
      },
      winbar = {
        lualine_a = components.winbar,
      },
      inactive_winbar = {
        lualine_a = components.winbar,
      },
      extensions = { "lazy", "mason", "neo-tree", extensions.aerial, extensions.fugitive, extensions.harpoon },
    })

    macro_record.update()
  end,
  event = "VeryLazy",
}
