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

  -- Whether to show cmdline
  -- Show cmdline would reduce occurences of "Press Enter to continue" popup
  ---@type 0|1
  cmdheight = 1,
}
