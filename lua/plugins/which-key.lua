return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.defaults["<leader>o"] = { name = "Overlook" }
    return opts
  end,
}
