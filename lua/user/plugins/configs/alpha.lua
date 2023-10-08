return {
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      "                                                    ",
      " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                    ",
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", "󰝒" .. "  New file", ":ene <bar> startinsert <cr>"),
      dashboard.button("f", "󰱼" .. "  Find file", ":Telescope find_files <cr>"),
      dashboard.button("o", "󰤘" .. "  Recent files", ":Telescope oldfiles <cr>"),
      dashboard.button("w", "󰭷" .. "  Search text", ":Telescope live_grep <cr>"),
      dashboard.button("c", "󰒓" .. "  Config", ":e $MYVIMRC <cr>"),
      dashboard.button("q", "󰶞" .. "  Quit", ":qa<cr>"),
    }
    dashboard.config.layout[1].val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) })
    dashboard.config.layout[3].val = 5
    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)
  end,
}
