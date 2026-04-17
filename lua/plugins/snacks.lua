return {
  {
    "folke/snacks.nvim",
    opts = {
      input = {
        enabled = true,
      },
      picker = {
        enabled = true,
        sources = {
          explorer = { -- configure files tree explorer
            hidden = true, -- show hidden files
            ignored = true, -- show fiels from .gitignore
          },
          files = {
            hidden = true, -- config for file search (<leader>ff)
            ignored = true,
          },
        },
      },
    },
  },
}
