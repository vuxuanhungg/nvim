local M = {}

function M.equalize_windows()
  local current_tab = vim.fn.tabpagenr()
  vim.cmd "tabdo wincmd ="
  vim.cmd("tabnext " .. current_tab)
end

----- Get cached colorscheme -----
-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/cache-colorscheme/init.lua
local colorscheme_cache = vim.fs.joinpath and vim.fs.joinpath(vim.fn.stdpath "state", "last_colorscheme")
  or (vim.fn.stdpath "state" .. "/last_colorscheme")

function M.get_cached_colorscheme()
  local file = io.open(colorscheme_cache, "r")
  if not file then return nil end

  local content = file:read "*a"
  file:close()

  return vim.trim(content)
end

return M
