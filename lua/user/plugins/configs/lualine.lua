return {
  opts = function()
    local search_count = function()
      if vim.api.nvim_get_vvar("hlsearch") == 1 then
        local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })

        if res.total > 0 then
          return string.format("%d/%d", res.current, res.total)
        end
      end

      return ""
    end

    return {
      options = {
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { "alpha" },
      },
      sections = {
        lualine_c = {
          { search_count, type = "lua_expr" },
        },
      },
      extensions = { "neo-tree", "trouble", "fugitive" },
    }
  end,
}
