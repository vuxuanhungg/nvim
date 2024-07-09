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
    local toggle_menu = function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end
    local mark_file = function()
      harpoon:list():add()
      vim.notify("Buffer marked", vim.log.levels.INFO, { title = "harpoon" })
    end
    local navigate_to_buffer = function(index)
      harpoon:list():select(index)
    end

    gmap("n", "<C-i>", "<C-i>", "Keep Ctrl+i functionality when press Tab")
    gmap("n", "<tab>", toggle_menu, "Show harpoon list")
    gmap("n", "<leader>ba", mark_file, "Mark buffer")

    for i = 1, 5 do
      gmap("n", "<leader>b" .. i, function()
        navigate_to_buffer(i)
      end, "Navigate to buffer " .. i)
    end
  end,
  event = "VeryLazy",
}
