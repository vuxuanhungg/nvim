return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    require("harpoon"):setup({
      settings = {
        save_on_toggle = true,
      },
    })

    local gmap = require("user.utils").map()
    local navigate_to_buffer = function(index)
      harpoon:list():select(index)
    end

    gmap("n", "<C-i>", "<C-i>", "Keep Ctrl+i functionality when press Tab")

    for i = 1, 5 do
      gmap("n", "<leader>b" .. i, function()
        navigate_to_buffer(i)
      end, "Navigate to buffer " .. i)
    end
  end,
  keys = function()
    local harpoon = require("harpoon")
    local toggle_menu = function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end
    local mark_file = function()
      harpoon:list():add()
      require("user.utils").notify("Buffer marked")
    end

    return {
      { "<tab>", toggle_menu, desc = "Show harpoon list" },
      { "<leader>ba", mark_file, desc = "Mark buffer" },
    }
  end,
}
