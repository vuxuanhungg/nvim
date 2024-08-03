local equalize_windows = function(position)
  if position == "left" or position == "right" then
    vim.cmd("wincmd =")
  end
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- Don't show git status icons
    default_component_configs = {
      git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "",
          renamed = "",
        },
      },
    },
    commands = {
      system_open = function(state)
        local path = state.tree:get_node():get_id()
        vim.ui.open(path)
      end,
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, select the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local results = {
          e = { val = modify(filename, ":e"), msg = "Extension only" },
          f = { val = filename, msg = "Filename" },
          F = { val = modify(filename, ":r"), msg = "Filename w/o extension" },
          h = { val = modify(filepath, ":~"), msg = "Path relative to Home" },
          p = { val = modify(filepath, ":."), msg = "Path relative to CWD" },
          P = { val = filepath, msg = "Absolute path" },
        }

        local messages = {
          { "\nChoose to copy to clipboard:\n", "Normal" },
        }
        for i, result in pairs(results) do
          if result.val and result.val ~= "" then
            vim.list_extend(messages, {
              { ("%s."):format(i), "Identifier" },
              { (" %s: "):format(result.msg) },
              { result.val, "String" },
              { "\n" },
            })
          end
        end
        vim.api.nvim_echo(messages, false, {})
        local result = results[vim.fn.getcharstr()]
        if result and result.val and result.val ~= "" then
          vim.notify("Copied: " .. result.val, vim.log.levels.INFO, { title = "neo-tree" })
          vim.fn.setreg("+", result.val)
        end
      end,
    },
    window = {
      mappings = {
        o = "open",
        ["<C-cr>"] = "open_vsplit",
        O = "system_open",
        h = "parent_or_close",
        l = "child_or_open",
        Y = "copy_selector",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = { ".git" },
      },
    },
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          equalize_windows(args.position)

          -- Fix nvim-ufo autofold neo-tree folders
          vim.opt_local.foldenable = false

          _G.neo_tree_open = true
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          equalize_windows(args.position)

          _G.neo_tree_open = false

          require("lualine").refresh({
            place = { "tabline" },
          })
        end,
      },

      ---------- Map <esc> to enter normal mode instead of close prompt ----------
      {
        event = "neo_tree_popup_input_ready",
        handler = function(args)
          vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        end,
      },
    },
  },
  cmd = "Neotree",
  keys = { { "<leader>e", "<cmd> Neotree toggle <cr>", desc = "Explorer" } },
}
