-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--       vim.o.background = "light"
--       vim.cmd([[colorscheme gruvbox]])
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }

return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup()

    vim.cmd("colorscheme github_light")
  end,
}
