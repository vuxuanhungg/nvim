require("user.core.options.shared")
require("user.core.keymaps.shared")
require("user.core.autocmds.shared")

if vim.g.vscode then
  require("user.core.keymaps.vscode")
else
  require("user.core.options.neovim")
  require("user.core.keymaps.neovim")
  require("user.core.autocmds.neovim")
end

require("user.core.lazy")
