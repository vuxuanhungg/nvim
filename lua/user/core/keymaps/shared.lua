local gmap = require("user.utils").map()
local vscode = vim.g.vscode

-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
gmap({ "n", "v" }, "<Space>", "<Nop>", nil, { silent = true })

-- Better default behavior
gmap("n", "k", "v:count == 0 ? 'gk' : 'k'", nil, { expr = true, silent = true, remap = vscode })
gmap("n", "j", "v:count == 0 ? 'gj' : 'j'", nil, { expr = true, silent = true, remap = vscode })
gmap("v", "p", "P", "Better paste")
gmap("n", "J", "mzJ`z", "Retain cursor position on merge")
gmap({ "n", "i" }, "<esc>", "<cmd> nohlsearch <cr><esc>", "Clear search highlights on escape")
gmap("v", "<", "<gv", "Indent left")
gmap("v", ">", ">gv", "Indent right")

-- Searching and occurrences
gmap("c", "<cr>", function()
  return vim.fn.getcmdtype() == "/" and "<cr>zzzv" or "<cr>"
end, "Center first search result", { expr = true, remap = vscode })
gmap("n", "*", "*zzzv", "Center next occurrence", { remap = vscode })
gmap("n", "#", "#zzzv", "Center previous occurrence", { remap = vscode })
gmap("n", "n", "nzzzv", "Center next result", { remap = vscode })
gmap("n", "N", "Nzzzv", "Center previous result", { remap = vscode })

-- Extras
gmap({ "n", "i", "v" }, "<C-a>", "<esc>ggVG", "Select all")
