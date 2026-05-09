---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-cmdline", lazy = true },
  },
  event = { "CmdlineEnter" },
  init = function()
    vim.api.nvim_create_autocmd("CmdlineEnter", {
      callback = function()
        local cmp = require "cmp"
        local function is_visible() return cmp.core.view:visible() or vim.fn.pumvisible() == 1 end

        -- <CR> will select and submit the item the same way `blink.cmp` does
        local cr_mapping = cmp.mapping(function(fallback)
          if is_visible() then
            cmp.confirm { select = false }
            vim.api.nvim_feedkeys(vim.keycode "<CR>", "n", false)
          else
            fallback()
          end
        end, { "c" })

        if not require("astrocore").is_available "cmp-cmdline" then return end
        cmp.setup.cmdline(":", {
          completion = { autocomplete = false },
          mapping = cmp.mapping.preset.cmdline {
            -- Make <C-n> and <C-p> cycle thru cmdline history
            ["<C-n>"] = cmp.mapping(function()
              if is_visible() then
                cmp.select_next_item()
              else
                vim.api.nvim_feedkeys(vim.keycode "<Down>", "n", false)
              end
            end, { "c" }),

            ["<C-p>"] = cmp.mapping(function()
              if is_visible() then
                cmp.select_prev_item()
              else
                vim.api.nvim_feedkeys(vim.keycode "<Up>", "n", false)
              end
            end, { "c" }),

            ["<CR>"] = cr_mapping,
          },
          sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
          ---@diagnostic disable-next-line: missing-fields
          matching = { disallow_symbol_nonprefix_matching = false },
        })

        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmp.mapping.preset.cmdline {
            ["<CR>"] = cr_mapping,
          },
          sources = { { name = "buffer" } },
        })

        -- Deregister the autocmd
        return true
      end,
    })
  end,
  opts = {
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
  },
}
