-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("VimEnter", {
  desc = "Set kitty spacing for neovim",
  group = augroup("set_kitty_spacing", { clear = true }),
  command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  desc = "Reset kitty spacing on quit",
  group = augroup("reset_kitty_spacing", { clear = true }),
  command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default margin=default",
})
