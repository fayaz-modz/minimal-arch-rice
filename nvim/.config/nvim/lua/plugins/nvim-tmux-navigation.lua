return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require('nvim-tmux-navigation').setup({})
    local keymap = vim.keymap.set
    keymap('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = "Navigate to the left tmux pane" })
    keymap('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { desc = "Navigate to the bottom tmux pane" })
    keymap('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { desc = "Navigate to the top tmux pane" })
    keymap('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { desc = "Navigate to the right tmux pane" })
  end,
}
