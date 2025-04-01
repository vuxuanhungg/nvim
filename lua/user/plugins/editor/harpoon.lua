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
    local show_buffers = function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end
    local add_buffer = function()
      harpoon:list():add()
      vim.notify("Buffer added to Harpoon", vim.log.levels.INFO, { title = "harpoon" })
    end
    local navigate_to_buffer = function(index)
      harpoon:list():select(index)
    end

    gmap("n", "<leader>bs", show_buffers, "Show buffers in Harpoon")
    gmap("n", "<leader>ba", add_buffer, "Add buffer to Harpoon")

    for i = 1, 5 do
      gmap("n", "<leader>b" .. i, function()
        navigate_to_buffer(i)
      end, "Navigate to Harpoon buffer " .. i)
    end
  end,
  event = "VeryLazy",
}
