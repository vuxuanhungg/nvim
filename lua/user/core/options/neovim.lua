local g = vim.g
local opt = vim.opt

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

---------- Appearance ----------

-- Enable true color support
opt.termguicolors = true

-- Always show the sign column
-- otherwise it would shift the text everytime cursor moves
opt.signcolumn = "yes"

-- Don't show the mode, since it's already in the status line
opt.showmode = false

opt.cmdheight = Settings.cmdheight

-- Only show status line on the focused window
opt.laststatus = 3

-- Enable line number and cursor line
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- Set default tab width
opt.tabstop = 4
opt.shiftwidth = 4

-- Use space instead of tab
opt.expandtab = true

-- Word wrap
opt.wrap = true
opt.breakindent = true
opt.linebreak = true

---------- Behaviors ----------

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- Split window to right and below
opt.splitright = true
opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 5
