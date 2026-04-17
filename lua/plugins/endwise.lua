return {
  {
    "RRethy/nvim-treesitter-endwise",
    config = function()
      require("nvim-treesitter.config").setup({
        endwise = {
          enabled = true,
        },
      })
    end,
  },
}
