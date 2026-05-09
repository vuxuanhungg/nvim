---@type LazySpec
return {
  "AstroNvim/astrotheme",
  opts = {
    highlights = {
      astrodark = {
        -- Make `neo-tree` focus and blur state look different
        NeoTreeNormal = { link = "Normal" },
        NeoTreeNormalNC = { link = "NormalNC" },
      },
    },
  },
}
