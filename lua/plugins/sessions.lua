return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- log_level = 'debug',
    git_use_branch_name = true,
    git_auto_restore_on_branch_change = false, -- Should we auto-restore the session when the git branch changes. Requires git_use_branch_name
  },
}
