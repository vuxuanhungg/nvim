Settings = {
  ---@type "vscode" | "catppuccin"
  colorscheme = "catppuccin",

  --- Whether to use `none-ls` or `conform` + `nvim-lint`
  ---@type boolean
  use_nls = true,

  --[[
 Whether to use `telescope.nvim` or `fzf-lua.nvim`

`telescope.nvim` has better community support and integration with other plugins, such as `todo-comment`, `aerial`, `nvim-notify`...
while `fzf-lua.nvim` is more performant, especially in large codebases
   ]]
  ---@type boolean
  use_fzf = false,
}
