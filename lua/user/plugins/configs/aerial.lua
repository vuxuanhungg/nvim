return {
  config = function()
    require("aerial").setup({
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = {
        width = 30,
        placement = "edge",
        default_direction = "right",
        preserve_equality = true,
      },
      attach_mode = "global",
      show_guides = true,
    })

    vim.api.nvim_set_hl(0, "AerialLine", { link = "Visual" })
    vim.api.nvim_set_hl(0, "AerialGuide", { link = "IndentBlanklineChar" })
  end,
}
