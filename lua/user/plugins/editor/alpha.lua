return {
  "goolord/alpha-nvim",
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

    local use_fzf = Settings.use_fzf

    dashboard.section.buttons.val = {
      dashboard.button("e", "󰝒" .. "  New file", ":ene <bar> startinsert <cr>"),
      dashboard.button(
        "f",
        "󰱼" .. "  Find file",
        use_fzf and "<cmd> FzfLua files <cr>" or "<cmd> Telescope find_files <cr>"
      ),
      dashboard.button(
        "o",
        "󰤘" .. "  Recent files",
        use_fzf and "<cmd> FzfLua oldfiles <cr>" or "<cmd> Telescope oldfiles <cr>"
      ),
      dashboard.button(
        "w",
        "󰭷" .. "  Search text",
        use_fzf and "<cmd> FzfLua live_grep <cr>" or "<cmd> Telescope live_grep <cr>"
      ),
      dashboard.button("c", "󰒓" .. "  Config", ":e $MYVIMRC <bar> cd %:p:h <cr>"),
      dashboard.button("q", "󰶞" .. "  Quit", ":qa <cr>"),
    }
    dashboard.config.layout[1].val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) })
    dashboard.config.layout[3].val = 5
    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)
  end,
}
