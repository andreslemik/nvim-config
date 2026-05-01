return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      javascript = { "standard" },
      javascriptreact = { "standard" },
      typescript = { "standard" },
      typescriptreact = { "standard" },
      vue = { "standard" },
      json = { "jq" }, -- or "fixjson"
    },
    formatters = {
      standard = {
        command = "standard",
        args = { "--fix", "--stdin" },
        stdin = true,
      },
    },
  },
}
