local gmap = require("user.utils").map()

-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
gmap({ "n", "v" }, "<Space>", "<Nop>", nil, { silent = true })

-- Better default behavior
gmap("n", "k", "v:count == 0 ? 'gk' : 'k'", nil, { expr = true, silent = true, remap = true })
gmap("n", "j", "v:count == 0 ? 'gj' : 'j'", nil, { expr = true, silent = true, remap = true })
gmap("v", "p", "P", "Better paste")
gmap("n", "J", "mzJ`z", "Retain cursor position on merge")
gmap("n", "n", "nzzzv", "Center search result (down)", { remap = true })
gmap("n", "N", "Nzzzv", "Center search result (up)", { remap = true })
gmap({ "n", "i" }, "<esc>", "<cmd> nohlsearch <cr><esc>", "Escape and clear search highlights")
gmap("v", "<", "<gv", "Indent left")
gmap("v", ">", ">gv", "Indent right")

-- VSCode-like shortcuts
gmap("n", "<C-a>", "ggVG", "Select all")
