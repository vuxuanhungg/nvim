local gmap = require("user.utils").map()

local workbench = {
  -- Window
  split_horizontally = function()
    vim.fn.VSCodeNotify("workbench.action.splitEditorDown")
  end,
  split_vertically = function()
    vim.fn.VSCodeNotify("workbench.action.splitEditor")
  end,
  maximize_window = function()
    vim.fn.VSCodeNotify("workbench.action.toggleMaximizeEditorGroup")
  end,
  split_equally = function()
    vim.fn.VSCodeNotify("workbench.action.evenEditorWidths")
  end,

  -- Finder
  find_file = function()
    vim.fn.VSCodeNotify("workbench.action.quickOpen")
  end,
  switch_buffer = function()
    vim.fn.VSCodeNotify("workbench.action.showEditorsInActiveGroup")
  end,
  find_word = function()
    vim.fn.VSCodeNotify("workbench.action.quickTextSearch")
  end,
  find_command = function()
    vim.fn.VSCodeNotify("workbench.action.showCommands")
  end,

  -- Sidebar
  toggle_sidebar = function()
    vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
  end,

  -- Zen mode
  toggle_zenmode = function()
    vim.fn.VSCodeNotify("workbench.action.toggleZenMode")
  end,
  toggle_minimap = function()
    vim.fn.VSCodeNotify("editor.action.toggleMinimap")
  end,
}

local editor = {
  save = function()
    vim.fn.VSCodeNotify("workbench.action.files.save")
  end,
  rename = function()
    vim.fn.VSCodeNotify("editor.action.rename")
  end,
  fold = function()
    vim.fn.VSCodeNotify("editor.fold")
  end,
  unfold = function()
    vim.fn.VSCodeNotify("editor.unfold")
  end,
  next_problem = function()
    vim.fn.VSCodeNotify("editor.action.marker.next")
  end,
  prev_problem = function()
    vim.fn.VSCodeNotify("editor.action.marker.prev")
  end,
}

-- Editor
gmap("n", "<leader>w", editor.save, "Save buffer")
gmap("n", "<leader>rn", editor.rename, "Rename symbol")
gmap("n", "zc", editor.fold, "Fold")
gmap("n", "zo", editor.unfold, "Unfold")
gmap("n", "]d", editor.next_problem, "Next problem")
gmap("n", "[d", editor.prev_problem, "Prev problem")

-- Window
gmap("n", "<leader>sv", workbench.split_vertically, "Split window vertically")
gmap("n", "<leader>sh", workbench.split_horizontally, "Split window horizontally")
gmap("n", "<leader>sm", workbench.maximize_window, "Maximize window")
gmap("n", "<leader>se", workbench.split_equally, "Split window equally")

-- Telescope
gmap("n", "<leader>ff", workbench.find_file, "Find file")
gmap("n", "<leader>fw", workbench.find_word, "Find word")
gmap("n", "<leader>fb", workbench.switch_buffer, "Switch buffer")
gmap("n", "<leader>fc", workbench.find_command, "Find command")

-- Sidebar
gmap("n", "<leader>e", workbench.toggle_sidebar, "Toggle sidebar")

-- Zen mode
gmap("n", "<leader>uz", workbench.toggle_zenmode, "Toggle Zen mode")
gmap("n", "<leader>um", workbench.toggle_minimap, "Toggle Minimap")
