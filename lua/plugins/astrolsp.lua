---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    mappings = {
      n = {
        ["<A-O>"] = {
          function() require("vtsls").commands.organize_imports() end,
          desc = "Typescript: Organize imports",
          cond = function(client) return client.name == "vtsls" end,
        },
      },
    },
  },
}
