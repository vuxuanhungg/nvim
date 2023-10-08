return {
  config = function()
    require("mason").setup({
      ui = {
        width = 0.8,
        height = 0.8,
        border = "single",
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
    })
  end,
}
