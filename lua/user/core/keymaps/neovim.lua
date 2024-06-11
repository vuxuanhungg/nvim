local utils = require("user.utils")
local gmap = utils.map()

gmap("n", "<leader>w", ":w <cr>", "Save buffer")
gmap("n", "<leader>W", ":noautocmd w <cr>", "Save buffer without formatting")
gmap("n", "<leader>L", "<cmd> Lazy <cr>", "Lazy")
gmap("n", "<leader>M", "<cmd> Mason <cr>", "Mason")

-- Navigate windows
gmap("n", "<C-h>", "<C-w>h", "Navigate to left window")
gmap("n", "<C-l>", "<C-w>l", "Navigate to right window")
gmap("n", "<C-j>", "<C-w>j", "Navigate to lower window")
gmap("n", "<C-k>", "<C-w>k", "Navigate to upper window")

-- Split windows
gmap("n", "<C-\\>", "<C-w>v", "Split window vertically")
gmap("n", "<leader>sv", "<C-w>v", "Split window vertically")
gmap("n", "<leader>sh", "<C-w>s", "Split window horizontally")
gmap("n", "<leader>sm", "<cmd> MaximizerToggle <cr>", "Maximize window")
gmap("n", "<leader>se", "<C-w>=", "Split window equally")

-- VSCode-like shortcuts
gmap("i", "<C-a>", "<esc> ggVG", "Select all")

-- Line editing
gmap("n", "<A-j>", ":m .+1<cr>==", "Move line down")
gmap("n", "<A-k>", ":m .-2<cr>==", "Move line up")
gmap("n", "<A-J>", "yyp", "Copy line down")
gmap("n", "<A-K>", "yyP", "Copy line up")

-- Block editing
gmap("v", "<A-j>", ":m '>+1<cr>gv-gv", "Move block down")
gmap("v", "<A-k>", ":m '<-2<cr>gv-gv", "Move block up")
gmap("v", "<A-J>", "yPgv", "Copy block down")
gmap("v", "<A-K>", "y'>pgv", "Copy block up")

-- File explorer
gmap("n", "<leader>e", "<cmd> Neotree toggle filesystem reveal_force_cwd <cr>", "Toggle Explorer")

-- Telescope
gmap("n", "<C-p>", "<cmd> Telescope find_files <cr>", "Find file")
gmap("n", "<leader>ff", "<cmd> Telescope find_files <cr>", "Find file")
gmap("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>", "Find all")
gmap("n", "<leader>fo", "<cmd> Telescope oldfiles <cr>", "Open recent")
gmap("n", "<leader>fw", "<cmd> Telescope live_grep <cr>", "Find word")
gmap("n", "<leader>fb", "<cmd> Telescope buffers <cr>", "Switch buffer")
gmap("n", "<leader>fc", "<cmd> Telescope commands <cr>", "Find command")
gmap("n", "<leader>fk", "<cmd> Telescope keymaps <cr>", "Find keymaps")
gmap("n", "<leader>fr", "<cmd> Telescope resume <cr>", "Resume last search")
gmap("n", "<leader>ft", "<cmd> TodoTelescope <cr>", "Find todo")
gmap("n", "<leader>fs", function()
  require("telescope").extensions.aerial.aerial()
end, "Find symbols")
gmap("n", "<leader>fn", function()
  require("telescope").load_extension("notify").notify()
end, "Notification history")

-- Buffer
gmap("n", "L", "<cmd> BufferLineCycleNext <cr>", "Next buffer")
gmap("n", "H", "<cmd> BufferLineCyclePrev <cr>", "Prev buffer ")
gmap("n", "Q", "<cmd> Bdelete <cr>", "Close buffer")
gmap("n", "<C-i>", "<C-i>", "Keep Ctrl+I functionality when press Tab")
gmap("n", "<tab>", ":e # <cr>", "Recent buffer")

-- Comment
gmap("n", "<C-/>", "<cmd> lua require('Comment.api').toggle.linewise.current() <cr>", "Toggle comment")
gmap("v", "<C-/>", "<esc><cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode()) <cr>", "Toggle comment")

-- Search panel
gmap("n", "<leader>S", "<cmd> Spectre <cr>", "Toggle Spectre")

-- Trouble
gmap("n", "<leader>x", "<cmd> Trouble <cr>", "Open Trouble")

-- Fugitive
local toggle_fugitive = function()
  if not utils.is_git_repo() then
    utils.notify("File does not belong to a Git repository", vim.log.levels.ERROR, { title = "vim-futigive" })
    return
  end

  local winids = vim.api.nvim_list_wins()
  for _, id in pairs(winids) do
    local status = pcall(vim.api.nvim_win_get_var, id, "fugitive_status")
    if status then
      vim.api.nvim_win_close(id, false)
      return
    end
  end
  vim.cmd.Git()
end
gmap("n", "<leader>g", toggle_fugitive, "Toggle Fugitive")

-- Notification
gmap("n", "<leader>un", function()
  require("notify").dismiss({ silent = true, pending = true })
end, "Dismiss all notifications")

-- Misc
gmap("n", "<leader>uc", function()
  vim.api.nvim_set_option("cmdheight", 1 - vim.api.nvim_get_option("cmdheight"))
end, "Toggle cmdline")

gmap("n", "<leader>uw", function()
  vim.cmd.set("wrap!")
end, "Toggle wrap")

gmap("n", "<leader>uo", "<cmd> AerialToggle <cr>", "Symbols outline")
