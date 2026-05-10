return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require("flutter-tools").setup {}
    require("telescope").load_extension("flutter")
    vim.keymap.set('n', '<leader>F',
      require('telescope').extensions.flutter.commands,
      { desc = "open flutter tools" })
  end
}
