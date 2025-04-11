return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    words = { enabled = true },
    image = { enabled = true },
    toggle = {
      map = vim.keymap.set, -- keymap.set function to use
      which_key = true,     -- integrate with which-key to show enabled/disabled icons and colors
      notify = true,        -- show a notification when toggling
      -- icons for enabled/disabled states
      icon = {
        enabled = " ",
        disabled = " ",
      },
      -- colors for enabled/disabled states
      color = {
        enabled = "green",
        disabled = "yellow",
      },
      wk_desc = {
        enabled = "Disable ",
        disabled = "Enable ",
      },
    }
  },
  keys = {
    { "<leader>z", function() Snacks.zen() end,           desc = "zen mode" },
    { "<leader>h", function() Snacks.notifier.hide() end, desc = "zen mode" },
    { "<leader>/", function() Snacks.terminal() end,      desc = "terminal toggle" },
  }
}
