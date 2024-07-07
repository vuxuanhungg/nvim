return {
  "onsails/lspkind.nvim",
  opts = {
    preset = "codicons",
    symbol_map = {
      Array = " ",
      Boolean = " ",
      Key = "",
      Namespace = " ",
      Null = " ",
      Number = " ",
      Object = " ",
      Package = " ",
      String = " ",
    },
  },
  config = function(_, opts)
    require("lspkind").init(opts)
  end,
}
