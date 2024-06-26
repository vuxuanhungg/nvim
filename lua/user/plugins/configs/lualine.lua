return {
  config = function()
    local lualine = require("lualine")

    local search_count = function()
      if vim.api.nvim_get_vvar("hlsearch") == 1 then
        local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })

        if res.total > 0 then
          return string.format("%d/%d", res.current, res.total)
        end
      end

      return ""
    end

    local macro_record = function()
      local register = vim.fn.reg_recording()
      if register == "" then
        return ""
      else
        return "Recording @" .. register
      end
    end

    local harpoon2 = { sections = { lualine_a = { "filetype" } }, filetypes = { "harpoon" } }

    lualine.setup({
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha" },
      },
      sections = {
        lualine_c = {
          { search_count, type = "lua_expr" },
          { macro_record, type = "lua_expr" },
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
}
