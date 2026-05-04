-- ~/.config/nvim/lua/plugins/ruby.lua

return {
  -- 1. Setup LSP server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Tell LazyVim to use ruby_lsp instead of solargraph
        ruby_lsp = {
          offset_encoding = "utf-8",
          -- Important: DO NOT install via mason, use bundler
          mason = false,
          -- We launch LSP via bundle so that it can see all the project's gems
          -- cmd = { "bundle", "exec", "ruby-lsp" },
          cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
          -- cmd = function()
          --   if vim.fn.filereadable("Gemfile") == 1 then
          --     local gemfile = vim.fn.readfile("Gemfile")
          --     for _, line in ipairs(gemfile) do
          --       if line:match("ruby%-lsp") then
          --         return { "bundle", "exec", "ruby-lsp" }
          --       end
          --     end
          --   end
          --
          --   -- if Gemfile does not includes ruby_lsp use global gem
          --   return { vim.fn.expand("~/.asdf/shims/ruby-lsp") }
          -- end,
        },
        -- Turn off the old solargraph if it suddenly turns on.
        solargraph = {
          enabled = false,
        },
        rubocop = {
          enabled = false,
        },

        nil_ls = false,
      },
    },
  },

  -- 2. Add the legendary tpope/vim-rails plugin for navigation
  -- {
  --   "tpope/vim-rails",
  --   dependencies = {
  --     "vim-ruby/vim-ruby",
  --     "tpope/vim-bundler",
  --   },
  --   lazy = false,
  --   -- Adding useful shortcuts in the style of LazyVim
  --   keys = {
  --     { "<leader>rR", "<Plug>RailsFindRoutes", desc = "Find Route" },
  --     { "<leader>rm", "<Plug>RailsFindModel", desc = "Find Model" },
  --     { "<leader>rc", "<Plug>RailsFindController", desc = "Find Controller" },
  --     { "<leader>rv", "<Plug>RailsFindView", desc = "Find View" },
  --     { "<leader>rj", "<Plug>RailsFindJavaScript", desc = "Find JS" },
  --     { "<leader>rs", "<Plug>RailsFindStylesheet", desc = "Find CSS" },
  --   },
  -- },

  -- 3. Setting up formatting for ERB and Ruby files
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        rubocop_bundled = {
          command = "./bin/rubocop",
          args = { "--stdin", "$FILENAME", "--format", "quiet", "--autocorrect-all" },
          stdin = true,
          cwd = require("conform.util").root_file({ "Gemfile", ".git" }),
        },

        haml_lint = {
          command = "haml-lint",
          args = { "--auto-correct", "--stdin", "$FILENAME" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        -- For ERB templates we use erb_format (need gem install erb_format)
        -- eruby = { "trim_whitespace", "erb_format" },
        haml = { "trim_whitespace" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "ruby", "bash", "html", "lua", "markdown", "vim" },
      auto_install = true,
      sync_install = false,
      endwise = { enabled = true },
      ident = { enabled = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
    },
  },

  {
    "asdf-vm/asdf",
    event = "VeryLazy",
  },
}
