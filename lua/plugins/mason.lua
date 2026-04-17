return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "standardjs",
    },
    automatic_installation = {
      exclude = { "nil_ls" },
    },
  },
}
