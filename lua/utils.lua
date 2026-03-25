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

function M.set_windows_terminal_ui(padding, scrollbar)
  -- Only run on Windows or WSL with Windows Terminal
  local is_windows = vim.fn.has "win32" == 1
  local is_wsl = vim.fn.has "wsl" == 1

  if not (is_windows or is_wsl) then return end
  if not vim.env.WT_SESSION then return end

  -- Get Windows user path
  local win_home = vim.fn.system("powershell.exe -NoProfile -Command '$env:USERPROFILE'"):gsub("%s+$", "")

  vim.fn.jobstart({
    "powershell.exe",
    "-NoProfile",
    "-File",
    win_home .. "\\scripts\\windows-terminal-update-ui.ps1",
    padding,
    scrollbar,
  }, { detach = true })
end

return M
