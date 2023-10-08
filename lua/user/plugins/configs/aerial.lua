return {
  config = function()
    require("aerial").setup({
      layout = {
        width = 30,
        placement = "edge",
        default_direction = "right",
        preserve_equality = true,
      },
      filter_kind = {
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Object",
        "Property",
        "Struct",
        "Variable",
      },
      attach_mode = "global",
      show_guides = true,
    })

    vim.api.nvim_set_hl(0, "AerialLine", { link = "Visual" })
    vim.api.nvim_set_hl(0, "AerialGuide", { link = "IndentBlanklineChar" })
  end,
}
