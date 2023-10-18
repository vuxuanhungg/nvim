return {
  config = function()
    local default_setup = function()
      require("mason").setup({
        ui = {
          width = 0.8,
          height = 0.8,
          border = "single",
          icons = {
            package_installed = "✓",
            package_uninstalled = "✗",
            package_pending = "⟳",
          },
        },
      })
    end

    local extra_setup = function()
      local ensure_installed = {
        "stylua",
        "shfmt",
        "shellcheck",
        "prettierd",
        "eslint_d",
        "black",
      }

      local Registry = require("mason-registry")
      local Optional = require("mason-core.optional")
      local Package = require("mason-core.package")

      local notify = function(msg, type)
        require("user.utils").notify(msg, type or vim.log.levels.INFO, { title = "mason.nvim" })
      end

      local resolve_package = function(name)
        return Optional.of_nilable(name):map(function()
          local ok, pkg = pcall(Registry.get_package, name)
          if ok then
            return pkg
          end
        end)
      end

      local install = function(pkg, version)
        notify(string.format("[mason.nvim] installing %s", pkg.name))

        return pkg:install({ version = version }):once(
          "closed",
          vim.schedule_wrap(function()
            if pkg:is_installed() then
              notify(string.format("[mason.nvim] %s was successfully installed", pkg.name))
            else
              notify(
                string.format(
                  "[mason.nvim] failed to install %s. Installation logs are available in :Mason and :MasonLog",
                  pkg.name
                ),
                vim.log.levels.ERROR
              )
            end
          end)
        )
      end

      local ensure_install = function()
        for _, server_identifier in ipairs(ensure_installed or {}) do
          local name, version = Package.Parse(server_identifier)

          resolve_package(name)
            :if_present(function(pkg)
              if not pkg:is_installed() then
                install(pkg, version)
              end
            end)
            :if_not_present(function()
              notify(string.format("[mason.nvim] cannot find package %s", name), vim.log.levels.WARN)
            end)
        end
      end

      if Registry.refresh then
        Registry.refresh(vim.schedule_wrap(ensure_install))
      else
        ensure_install()
      end
    end

    default_setup()
    extra_setup()
  end,
}
