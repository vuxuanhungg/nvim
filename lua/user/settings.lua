Settings = {
  ---@type "vscode" | "catppuccin" | "tokyonight"
  colorscheme = "tokyonight",

  --[[
Whether to use `none-ls` or `conform` + `nvim-lint`

`conform` + `nvim-lint` are for formatting and diagnostics, respectively
`none-ls` provides extra sources for completion, code actions and hover

`conform` + `nvim-lint` are preferred, as they are more lightweight
`preferred` binary in `conform` also behaves more consistently with the standard prettier

]]
  ---@type boolean
  use_nls = false,

  --[[
 Whether to use `telescope.nvim` or `fzf-lua.nvim`

`telescope.nvim`:
- Pros:
    Has better community support and integration with other plugins, such as `aerial`, `nvim-notify`
- Cons:
    Cannot get lazyloaded colorschemes
    Limited support for scrolling results/preview window (until recently)

`fzf-lua.nvim`:
- Pros:
    Is more performant, especially in large codebases
    Enable toggle option (respect/ignore .gitignore) out of the box
    Can get lazyloaded colorschemes
- Cons:
    Limited integration with some plugins
]]
  ---@type boolean
  use_fzf = true,
}
