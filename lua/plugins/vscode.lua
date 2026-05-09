---@type LazySpec
return {
  "Mofiqul/vscode.nvim",
  opts = {
    style = "dark",
    italic_comments = true,
    group_overrides = {
      AerialLine = {
        bg = "#37373D",
        blend = 0,
        bold = true,
        cterm = {
          bold = true,
        },
      },
      AerialGuide = { link = "IblIndent" },
      NeoTreeCursorLine = { link = "AerialLine" },
      NeoTreeIndentMarker = { link = "IblIndent" },
      NormalFloat = { bg = "#181818" },
      NeoTreeNormal = { link = "NormalFloat" },
      NeoTreeNormalNC = { link = "NormalFloat" },
      FloatBorder = { link = "NeoTreeFloatBorder" },
      SnacksPickerBorder = { link = "NeoTreeFloatBorder" },
    },
  },
}
