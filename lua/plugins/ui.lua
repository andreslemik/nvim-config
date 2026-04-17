return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ════════════════════════════════════════════════════════════════════════════
  -- Fidget (LSP progress notifications)
  -- ════════════════════════════════════════════════════════════════════════════
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
}
