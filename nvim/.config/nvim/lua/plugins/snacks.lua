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
    { "<leader>d", function() Snacks.dashboard() end,             desc = "dashboard toggle" },
    { "<leader>z", function() Snacks.zen() end,                   desc = "zen mode" },
    { "<leader>h", function() Snacks.notifier.hide() end,         desc = "zen mode" },
    { "<leader>H", function() Snacks.notifier.show_history() end, desc = "zen mode" },
    { "<leader>/", function() Snacks.terminal() end,              desc = "terminal toggle" },
    { "<leader>E", function() Snacks.explorer() end,              desc = "file explorer" },
    {
      "<leader>e",
      function()
        Snacks.explorer({
          auto_close = true,
          layout = {
            layout = {
              backdrop = false,
              row = 1,
              width = 0.4,
              min_width = 80,
              height = 0.8,
              border = "none",
              box = "vertical",
              { win = "preview", title = "{preview}", height = 0.4, border = "rounded" },
              {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                title_pos = "center",
                { win = "input", height = 1,     border = "bottom" },
                { win = "list",  border = "none" },
              },
            },
          }
        })
      end,
      desc = "file explorer"
    },
    { "<C-p>f",           function() Snacks.picker.files() end,                 { desc = "Files" } },
    { "<leader><leader>", function() Snacks.picker.recent() end,                { desc = "Recent files" } },
    { '<C-p>gp',          function() Snacks.picker.grep() end,                  { desc = "Grep" } },
    { '<C-p>b',           function() Snacks.picker.buffers() end,               { desc = "Buffers" } },
    { '<C-p>h',           function() Snacks.picker.help() end,                  { desc = "Help" } },
    { '<C-p>gf',          function() Snacks.picker.git_files() end,             { desc = "Git files" } },
    { '<C-p>d',           function() Snacks.picker.diagnostics() end,           { desc = "Diagnostics" } },
    { '<C-p>cm',          function() Snacks.picker.commands() end,              { desc = "Commands" } },
    { '<C-p>s',           function() Snacks.picker.lsp_symbols() end,           { desc = "Doc symbols" } },
    { '<C-p>w',           function() Snacks.picker.lsp_workspace_symbols() end, { desc = "WS symbols" } },
    { '<C-p>r',           function() Snacks.picker.lsp_references() end,        { desc = "References" } },
  },
}
