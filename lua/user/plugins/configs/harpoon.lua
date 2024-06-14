return {
  config = function()
    local harpoon = require("harpoon")
    require("harpoon"):setup({
      settings = {
        save_on_toggle = true,
      },
    })

    local gmap = require("user.utils").map()
    local mark_file = function()
      harpoon:list():add()
      require("user.utils").notify("Buffer marked")
    end
    local toggle_menu = function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end
    local navigate_to_buffer = function(index)
      harpoon:list():select(index)
    end

    gmap("n", "<leader>ba", mark_file, "Mark buffer")
    gmap("n", "<tab>", toggle_menu, "Show harpoon list")

    gmap("n", "<leader>b1", function()
      navigate_to_buffer(1)
    end, "Navigate to buffer 1")

    gmap("n", "<leader>b2", function()
      navigate_to_buffer(2)
    end, "Navigate to buffer 2")

    gmap("n", "<leader>b3", function()
      navigate_to_buffer(3)
    end, "Navigate to buffer 3")

    gmap("n", "<leader>b4", function()
      navigate_to_buffer(4)
    end, "Navigate to buffer 4")
  end,
}
