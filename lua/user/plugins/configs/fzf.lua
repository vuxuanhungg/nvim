return {
  -- Note: Currently cannot use <C-cr> for mapping (vertical split)
  -- use <C-v> instead
  config = function()
    require("fzf-lua").setup({
      winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
      },
      files = {
        git_icons = false,
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
        },
      },
      grep = {
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
        },
      },
      lsp = {
        symbols = {
          symbol_icons = require("lspkind").symbol_map,
        },
      },
      hls = {
        border = "FloatBorder",
        preview_border = "FloatBorder",
      },
      keymap = {
        fzf = {
          ["ctrl-n"] = "down",
          ["ctrl-p"] = "up",
          ["ctrl-j"] = "next-history",
          ["ctrl-k"] = "previous-history",
        },
      },
    })
  end,
}
