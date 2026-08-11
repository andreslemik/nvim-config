return {
  "WilliamHsieh/overlook.nvim",
  opts = {},

  -- Optional: set up common keybindings
  -- Moved from <leader>p* to <leader>o* so the 'p' group stays free for yank history.
  keys = {
    { "<leader>o", group = "Overlook" },
    {
      "<leader>od",
      function()
        require("overlook.api").peek_definition()
      end,
      desc = "Overlook: Peek definition",
    },
    {
      "<leader>oc",
      function()
        require("overlook.api").close_all()
      end,
      desc = "Overlook: Close all popup",
    },
    {
      "<leader>ou",
      function()
        require("overlook.api").restore_popup()
      end,
      desc = "Overlook: Restore popup",
    },
    {
      "<leader>op",
      function()
        require("overlook.api").peek_cursor()
      end,
      desc = "Overlook: Peek cursor",
    },
    {
      "<leader>oU",
      function()
        require("overlook.api").restore_all_popups()
      end,
      desc = "Overlook: Restore all popups",
    },
    {
      "<leader>of",
      function()
        require("overlook.api").switch_focus()
      end,
      desc = "Overlook: switch focus",
    },
    {
      "<leader>os",
      function()
        require("overlook.api").open_in_split()
      end,
      desc = "Overlook: Open popup in split",
    },
    {
      "<leader>ov",
      function()
        require("overlook.api").open_in_vsplit()
      end,
      desc = "Overlook: Open popup in vsplit",
    },
    {
      "<leader>ot",
      function()
        require("overlook.api").open_in_tab()
      end,
      desc = "Overlook: Open popup in tab",
    },
    {
      "<leader>oo",
      function()
        require("overlook.api").open_in_original_window()
      end,
      desc = "Overlook: Open popup in current window",
    },
  },
}
