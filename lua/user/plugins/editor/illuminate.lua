return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      delay = 200,
      filetypes_denylist = {
        "aerial",
      },
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    })
  end,
  event = { "BufReadPost", "BufNewFile" },
}
