return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.move").setup({

        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",
      })
    end,
  },
}
