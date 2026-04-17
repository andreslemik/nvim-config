return {
  -- Lazygit integration
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gG", "<cmd>LazyGitFiltered<cr>", desc = "LazyGit (Current File" },
    },
    config = function() end,
  },

  -- additions: blame and other git-commands
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlame",
    keys = {
      { "<leader>gb", "<cmd>GitBlameToggle", desc = "Toggle Git Blame" },
    },
    opts = {
      -- show blame in virtual text column
      virtual_text_column = 0,
      -- refresh on cursor movement
      delay = 500,
    },
  },
}
