Settings = {
  ---@type "vscode" | "catppuccin" | "tokyonight"
  colorscheme = "tokyonight",

  ---@type "single" | "rounded"
  border = "rounded",

  icons = {
    diagnostics = {
      Error = "󰅚 ",
      Warn = "󰀪 ",
      Info = "󰋽 ",
      Hint = "󰌶 ",
    },
    kinds = {
      Text = " ",
      Unit = " ",
      Value = " ",
      Keyword = " ",
      Snippet = " ",
      Color = " ",
      Reference = " ",
      Folder = " ",
      File = " ",
      Module = " ",
      Namespace = " ",
      Package = " ",
      Class = " ",
      Method = " ",
      Property = " ",
      Field = " ",
      Constructor = " ",
      Enum = " ",
      Interface = " ",
      Function = " ",
      Variable = " ",
      Constant = " ",
      String = " ",
      Number = " ",
      Boolean = " ",
      Array = " ",
      Object = " ",
      Key = " ",
      Null = " ",
      EnumMember = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
    },
    git = {
      Branch = " ",
    },
    misc = {
      Debugger = " ",
    },
  },

  --[[
Whether to use `none-ls` or `conform` + `nvim-lint`

`conform` + `nvim-lint` are for formatting and diagnostics, respectively
`none-ls` provides extra sources for completion, code actions and hover

`conform` + `nvim-lint` are preferred, as they are more lightweight
`preferred` binary in `conform` also behaves more consistently with the standard prettier

]]
  ---@type boolean
  use_nls = false,

  -- Whether to show cmdline
  -- Show cmdline would reduce occurences of "Press Enter to continue" popup
  ---@type 0|1
  cmdheight = 1,
}
