-- ~/.config/nvim/lua/plugins/herb.lua
-- Herb (https://herb-tools.dev) — HTML+ERB language server, formatter and linter.
-- The `herb-language-server` binary is installed by mason (package `herb-language-server`).

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        herb_ls = {
          -- Herb reads these through `workspace/configuration` under the
          -- `languageServerHerb` section. A project's `.herb.yml` still wins for
          -- whether the formatter runs; these are the personal defaults.
          settings = {
            languageServerHerb = {
              linter = {
                enabled = true,
                fixOnSave = true,
              },
              formatter = {
                enabled = true,
                indentWidth = 2,
                indentStyle = "space",
                maxLineLength = 80,
              },
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        herb_format = {
          command = "herb-format",
          args = { "-q", "-" },
          stdin = true,
          -- `.herb.yml` controls whether formatting is enabled and how it looks,
          -- and is discovered from the working directory upwards.
          cwd = require("conform.util").root_file({ ".herb.yml", "Gemfile", ".git" }),
        },
      },
      formatters_by_ft = {
        eruby = { "herb_format" },
      },
    },
  },
}
