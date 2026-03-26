local M = {}

local colorscheme_cache = vim.fs.joinpath and vim.fs.joinpath(vim.fn.stdpath "state", "last_colorscheme")
  or (vim.fn.stdpath "state" .. "/last_colorscheme")

--- Get colorscheme from cache
-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/cache-colorscheme/init.lua
function M.get_cached_colorscheme()
  local file = io.open(colorscheme_cache, "r")
  if not file then return nil end

  local content = file:read "*a"
  file:close()

  return vim.trim(content)
end

function M.equalize_windows()
  local current_tab = vim.fn.tabpagenr()
  vim.cmd "tabdo wincmd ="
  vim.cmd("tabnext " .. current_tab)
end

--- Update Windows Terminal's padding and scroll bar state
--- Pair with `windows-terminal-update-ui.ps1`
---@param padding string
---@param scrollbar "visible" | "hidden" | "always"
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

--- Update kitty terminal's padding and margin
--- Make sure to include these settings in your `kitty.conf`
--- ```bash
---   allow_remote_control yes
---   listen_on unix:/tmp/kitty-{kitty_pid}
--- ```
---@param padding string | "default"
---@param margin string | "default"
function M.set_kitty_terminal_ui(padding, margin)
  -- Only run inside Kitty
  if not os.getenv "KITTY_WINDOW_ID" then return end

  local socket = os.getenv "KITTY_LISTEN_ON"

  if socket and socket ~= "" then
    local path = socket:gsub("^unix:", "")
    if vim.fn.filereadable(path) ~= 1 then return end

    vim.fn.system("kitty @ --to=" .. socket .. " set-spacing padding=" .. padding .. " margin=" .. margin)
  end
end

return M
