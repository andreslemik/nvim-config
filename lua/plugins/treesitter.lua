return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,

  init = function()
    local ensure_installed = {
      "css",
      "haml",
      "html",
      "javascript",
      "javascriptreact",
      "latex",
      "lua",
      "ruby",
      "scss",
      "tsx",
      "typescript",
      "typst",
      "vim",
      "vimdoc",
    }
    local installed = require("nvim-treesitter.config").get_installed()
    local to_install = vim
      .iter(ensure_installed)
      :filter(function(p)
        return not vim.tbl_contains(installed, p)
      end)
      :totable()
    if #to_install > 0 then
      require("nvim-treesitter"):install(to_install)
    end
  end,

  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "haml", "ruby", "lua", "html", "javascript", "typescript", "tsx" },
      callback = function()
        pcall(vim.treesitter.start)

        if vim.bo.filetype == "haml" then
          vim.bo.autoindent = true
          vim.bo.smartindent = false
          vim.bo.indentexpr = ""
          vim.bo.shiftwidth = 2
          vim.bo.softtabstop = 2
          vim.bo.expandtab = true
        else
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,

  opts = {
    highlight = { enable = true },
  },
}
