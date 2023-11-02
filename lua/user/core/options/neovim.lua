local g = vim.g
local opt = vim.opt

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
opt.showmode = false -- hide command line unless needed
opt.cmdheight = 0 -- hide command line unless needed
opt.laststatus = 3 -- only show status line on the focused window
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = true -- word wrap
opt.breakindent = true
opt.linebreak = true
opt.shortmess:append({ I = true, s = true }) -- disable startup & search messages
opt.fillchars = opt.fillchars + "eob: " -- hide tilde "~" on empty lines

-- Behaviors
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
