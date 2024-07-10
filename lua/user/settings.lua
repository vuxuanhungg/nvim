Settings = {
  ---@type "vscode" | "catppuccin" | "tokyonight"
  colorscheme = "tokyonight",

  --- Whether to use `none-ls` or `conform` + `nvim-lint`
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
