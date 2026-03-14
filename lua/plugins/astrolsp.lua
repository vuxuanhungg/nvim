---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    mappings = {
      n = {
        gd = { function() require("snacks.picker").lsp_definitions() end, desc = "Go to definitions" },
        gr = { function() require("snacks.picker").lsp_references() end, nowait = true, desc = "Go to references" },
        ["<A-O>"] = {
          function() require("vtsls").commands.organize_imports() end,
          desc = "Typescript: Organize imports",
          cond = function(client) return client.name == "vtsls" end,
        },
      },
    },
  },
}
